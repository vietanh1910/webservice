package org.example.provider.listener;

import org.example.provider.util.HibernateUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(">>> Initializing Hibernate...");
        HibernateUtil.getSessionFactory(); // kích hoạt Hibernate ở startup
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        HibernateUtil.shutdown(); // đóng Hibernate khi tắt app
    }
}

