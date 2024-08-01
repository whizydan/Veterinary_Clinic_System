package controller;

import javax.ejb.EJB;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.UserService;
import model.Users;

public class ContextListener implements ServletContextListener {

    @EJB
    private UserService userService;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String email = "admin@gmail.com";
        String password = "Admin123";

        boolean userExists = userService.validateUser(email, password);

        if (!userExists) {
            userService.saveUser(new Users(
                    "John Doe",
                    "Admin123",
                    "0",
                    "",
                    "+1 355 332",
                    "admin@gmail.com"
            ));
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Add code here to run when the web application is about to be shut down
        System.out.println("Web application shutting down!");
        // You can perform cleanup tasks here
    }
}
