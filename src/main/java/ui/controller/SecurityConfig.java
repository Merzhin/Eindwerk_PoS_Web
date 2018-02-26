package ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 *
 * @author Thomas
 */

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder amb) throws Exception {
        amb.inMemoryAuthentication().withUser("admin").password("t").roles("USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/index.htm").permitAll()
                .antMatchers("/navigationController**").authenticated()
                .antMatchers("/navigationController/**").authenticated()
                .and()
                    .logout()
                        .logoutUrl("/perform_logout")
                        .logoutSuccessUrl("/index.htm")
                .and()
                    .formLogin()
                        .loginProcessingUrl("/perform_login")
                        .loginPage("/index.htm");
    }
}

