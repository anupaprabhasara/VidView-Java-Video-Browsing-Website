package com.vidview.servlet;

import com.vidview.model.User;
import com.vidview.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        User user = authenticate(email, password);

        if (user != null) {
            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user); // full User object
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("name", user.getFullName());
            session.setAttribute("email", user.getEmail());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Remember Me Cookie
            if ("on".equals(remember)) {
                Cookie rememberCookie = new Cookie("rememberEmail", email);
                rememberCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                rememberCookie.setPath(request.getContextPath());
                response.addCookie(rememberCookie);
            } else {
                Cookie remove = new Cookie("rememberEmail", "");
                remove.setMaxAge(0);
                remove.setPath(request.getContextPath());
                response.addCookie(remove);
            }

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // Login failed
            request.setAttribute("error", "Invalid email or password.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/client/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        // Load remembered email
        String rememberedEmail = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberEmail".equals(cookie.getName())) {
                    rememberedEmail = cookie.getValue();
                    break;
                }
            }
        }

        request.setAttribute("rememberedEmail", rememberedEmail);
        request.getRequestDispatcher("/client/login.jsp").forward(request, response);
    }

    private User authenticate(String email, String password) {
        List<User> users = userService.getAllUsers();
        for (User u : users) {
            if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }
}