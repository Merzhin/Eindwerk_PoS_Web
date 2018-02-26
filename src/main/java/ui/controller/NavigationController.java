package ui.controller;

import be.livingsmart.eindwerk.domain.StockItem;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thomas
 */
@Controller
@RequestMapping(value="/navigationController")
public class NavigationController {
    
    private RestTemplate restTemplate;
    
    public NavigationController(@Autowired RestTemplate restTemplate){
        this.restTemplate = restTemplate;
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getProducts(){
        ModelAndView mv = new ModelAndView("overview");
        //List[StockItem] items;
        //items = restTemplate.getForObject("http://localhost:8080/Eindwerk_PoS_Rest/stockItem", List[StockItem.class]);
        //mv.addObject("items", items);
        return mv;
    }
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView getNewForm(){
        return new ModelAndView("addProduct");
    }
    
    @RequestMapping(value = "/management", method = RequestMethod.GET)
    public ModelAndView getUsers(){
        ModelAndView mv = new ModelAndView("management");
        return mv;
    }
}
