package ui.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *
 * @author Thomas
 */

@Configuration
public class ApplicationConfig extends WebMvcConfigurerAdapter {
    
    @Bean 
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
