package com.vidview.servlet;

import com.vidview.model.User;
import com.vidview.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic Validation
        String error = null;

        if (fullName == null || fullName.trim().isEmpty()) {
            error = "Full name is required.";
        } else if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            error = "Invalid email format.";
        } else if (password == null || !password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}$")) {
            error = "Password must include uppercase, lowercase, number, and special character.";
        }

        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
            return;
        }

        // Create user and insert
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);

        boolean success = userService.createUser(user);

        if (success) {
            request.setAttribute("success", "Registration successful! You can now login.");
            request.setAttribute("redirect", true); // use in JSP for auto-redirect if needed
        } else {
            request.setAttribute("error", "An error occurred. Please try again.");
        }

        request.getRequestDispatcher("/client/register.jsp").forward(request, response);
    }
}