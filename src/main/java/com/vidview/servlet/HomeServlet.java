package com.vidview.servlet;

import com.vidview.model.Video;
import com.vidview.service.VideoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final VideoService videoService = new VideoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Load all videos
        List<Video> allVideos = videoService.getAllVideos();
        request.setAttribute("videos", allVideos);

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("user") != null) {
            isLoggedIn = true;
            request.setAttribute("name", session.getAttribute("name"));
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/home.jsp").forward(request, response);
    }
}