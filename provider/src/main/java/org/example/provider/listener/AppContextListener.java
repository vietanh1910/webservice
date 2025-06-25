package org.example.provider.listener;

import org.example.provider.util.HibernateUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
    private RatingScheduler scheduler;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(">>> Initializing Hibernate...");
        HibernateUtil.getSessionFactory();
        scheduler = new RatingScheduler();
        scheduler.startScheduler();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.stopScheduler();
        }
        HibernateUtil.shutdown(); // đóng Hibernate khi tắt app
    }


}

