package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppContextListener implements ServletContextListener {

    private static ServletContext context;

    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
    }

    public void contextDestroyed(ServletContextEvent sce) {}

    public static ServletContext getContext() {
        return context;
    }
}