package ui.controller;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 *
 * @author Thomas
 */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
      
   @Override
    protected Class[] getRootConfigClasses() {
        return new Class[] {};
    }

    @Override
    protected Class[] getServletConfigClasses() {
        return new Class[] {DispatcherServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}
