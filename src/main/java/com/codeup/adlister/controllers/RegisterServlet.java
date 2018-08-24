package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.mysql.cj.api.Session;
import org.apache.commons.lang3.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    private StringUtils util = new StringUtils();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: show the registration form
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // TODO: ensure the submitted information is valid
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("confirm");
        User existingUser = DaoFactory.getUsersDao().findByUsername(username);
        boolean validAttempt = ((existingUser == null) && !util.isBlank(username) && !util.isBlank(email) && !util.isBlank(password) && !util.isBlank(passwordConfirm) && password.equals(passwordConfirm));

        String error = "Invalid attempt to register. Please try again.";
        request.setAttribute("error", error);
        if (!validAttempt) {
            if (existingUser != null) {
                request.setAttribute("userExists", "Username already exists. Please choose another username.");
            }
            if (!email.contains("@")){
                request.setAttribute("emailError", "Email is invalid.");
            }
            if (!password.equals(passwordConfirm)) {
                request.setAttribute("passError", "Passwords do not match.");
            }
            session.setAttribute("username", username);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } else {

            // TODO: create a new user based off of the submitted information
            User newUser = new User (username, email, password);
            Long check = DaoFactory.getUsersDao().insert(newUser);
            request.getSession().setAttribute("user", newUser);
            // TODO: if a user was successfully created, send them to their profile
            System.out.println(check);
            if (check != 0) {
                request.getSession().removeAttribute("email");
                request.getSession().removeAttribute("password");
                response.sendRedirect("/profile");
            } else {
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            }

        }
    }
}
