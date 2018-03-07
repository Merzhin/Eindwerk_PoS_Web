package ui.controller;

import be.livingsmart.eindwerk.domain.Item;
import be.livingsmart.eindwerk.domain.UserBean;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Thomas
 */
@Controller
@RequestMapping(value = "/controller")
public class NavigationController {

    private RestTemplate restTemplate;
    private String restUrl = "http://localhost:34081/HDR-Rest/";

    public NavigationController() {
        this.restTemplate = new RestTemplate();
    }

    /* ------------------------------------------------------ Products ------------------------------------------------------ */
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getProducts(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            ResponseEntity<List<Item>> response;
            response = restTemplate.exchange(restUrl + "item", HttpMethod.GET, null, new ParameterizedTypeReference<List<Item>>() {
            });
            List<Item> items = response.getBody();
            return new ModelAndView("productOverview", "items", items);
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/newProduct", method = RequestMethod.GET)
    public ModelAndView getNewProductForm(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            return new ModelAndView("addProduct", "item", new Item());
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public String addProduct(@Valid @ModelAttribute("item") Item item, BindingResult result, HttpServletRequest request) {
        if (isLoggedIn(request)) {
            if (result.hasErrors()) {
                return "addProduct";
            }
            String restItem = "{\"name\":\"" + item.getName() + "\", \"price\":\"" + item.getPrice() + "\", \"isFavorite\":\"" + item.isIsFavorite() + "\"}";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> entity = new HttpEntity<String>(restItem, headers);
            
            restTemplate.exchange(restUrl + "item", HttpMethod.POST, entity, Item.class);
            return "redirect:/controller";
        }
        return "redirect:/index.htm";
    }

    @RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
    public ModelAndView editProduct(@PathVariable String id, HttpServletRequest request) {
        if (isLoggedIn(request)) {
            Item product = restTemplate.getForObject(restUrl + "item/" + id, Item.class);
            System.out.println("product: " + product.getName() + " " + product.getPrice());
            return new ModelAndView("addProduct", "item", product);
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public String performEdit(@Valid @ModelAttribute("item") Item item, BindingResult result, HttpServletRequest request) {
        if (isLoggedIn(request)) {
            restTemplate.put(restUrl + "item/" + item.getId(), item);
            return "redirect:/controller";
        }
        return "redirect:/index.htm";
    }

    @RequestMapping(value = "/removeProduct/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable String id, HttpServletRequest request) {
        if (isLoggedIn(request)) {
            restTemplate.delete(restUrl + "item/" + id);
            return "redirect:/controller";
        }
        return "redirect:/index.htm";
    }

    /* -------------------------------------------------------- Users -------------------------------------------------------- */
    @RequestMapping(value = "/userOverview", method = RequestMethod.GET)
    public ModelAndView getUsers(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            ResponseEntity<List<String>> response;
            response = restTemplate.exchange(restUrl + "user", HttpMethod.GET, null, new ParameterizedTypeReference<List<String>>() {
            });
            List<String> users = response.getBody();
            return new ModelAndView("userOverview", "users", users);
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.GET)
    public ModelAndView getNewUserForm(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            return new ModelAndView("addUser", "user", new UserBean());
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(HttpServletRequest request, RedirectAttributes ra) {
        if (isLoggedIn(request)) {
            String user = "{\"username\":\"" + request.getParameter("username") + "\", \"password\":\"" + request.getParameter("password") + "\"}";

            boolean existing = restTemplate.getForObject(restUrl + "user/exists/" + request.getParameter("username"), Boolean.class);
            if (existing) {
                List<String> errors = new ArrayList<>();
                errors.add("Deze gebruiker bestaat al");
                ra.addFlashAttribute("errors", errors);
                ra.addFlashAttribute("username", request.getParameter("username"));
                return "redirect:/controller/newUser";
            }

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> entity = new HttpEntity<String>(user, headers);

            restTemplate.exchange(restUrl + "user", HttpMethod.POST, entity, String.class);
            return "redirect:/controller/userOverview";
        }
        return "redirect:index.htm";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public ModelAndView changePassword(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            return new ModelAndView("changePassword");
        }
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/savePassword", method = RequestMethod.POST)
    public String savePassword(HttpServletRequest request) {
        if (isLoggedIn(request)) {
            String user = "{\"username\":\"" + request.getSession().getAttribute("loggedIn") + "\", \"password\":\"" + request.getParameter("password") + "\"}";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> entity = new HttpEntity<String>(user, headers);

            restTemplate.exchange(restUrl + "user", HttpMethod.PUT, entity, String.class);
            return "redirect:/controller/userOverview";
        }
        return "redirect:index.htm";
    }

    @RequestMapping(value = "/removeUser/{user}", method = RequestMethod.GET)
    public String removeUser(@PathVariable String user, HttpServletRequest request) {
        if (isLoggedIn(request)) {
            if (restTemplate.getForObject(restUrl + "/user/exists/" + user, Boolean.class)) {
                restTemplate.delete(restUrl + "user/" + user);
                if (user.equals(request.getSession().getAttribute("loggedIn"))) {
                    return "redirect:/controller/logout";
                }
            }
            return "redirect:/controller/userOverview";
        }
        return "redirect:index.htm";
    }

 /* ------------------------------------------------------- Security ------------------------------------------------------- */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ResponseEntity<List<String>> response;
        response = restTemplate.exchange(restUrl + "user", HttpMethod.GET, null, new ParameterizedTypeReference<List<String>>() {
        });
        List<String> users = response.getBody();
        return new ModelAndView("index", "users", users);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
            @RequestParam("password") String password, HttpServletRequest request,
            RedirectAttributes ra
    ) {
        boolean response = restTemplate.getForObject(restUrl + "user/validateUser?username=" + username + "&password=" + password, Boolean.class);
        if (response) {
            request.getSession().setAttribute("loggedIn", username);
            return "redirect:/controller";
        } else {
            List<String> errors = new ArrayList<>();
            errors.add("Gebruikersnaam of wachtwoord is niet correct");
            ra.addFlashAttribute("errors", errors);
            ra.addFlashAttribute("username", username);
            return "redirect:/index.htm";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request
    ) {
        request.getSession().removeAttribute("loggedIn");
        return "redirect:/index.htm";
    }

    private boolean isLoggedIn(HttpServletRequest request) {
        String validated = (String) request.getSession().getAttribute("loggedIn");
        if (validated == null) {
            List<String> errors = new ArrayList<>();
            errors.add("U bent niet gemachtigd om deze pagina te bezoeken. Gelieve in te loggen");
            request.setAttribute("errors", errors);
        }
        return validated != null;
    }
}
