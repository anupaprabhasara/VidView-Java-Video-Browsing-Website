package com.vidview.servlet;

import com.vidview.model.Comment;
import com.vidview.model.User;
import com.vidview.model.Video;
import com.vidview.service.CommentService;
import com.vidview.service.VideoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/video")
public class VideoWatchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final VideoService videoService = new VideoService();
    private final CommentService commentService = new CommentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String videoIdParam = request.getParameter("id");

        if (videoIdParam == null || !videoIdParam.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid video ID.");
            return;
        }

        int videoId = Integer.parseInt(videoIdParam);

        // Fetch video
        Video video = videoService.getVideo(videoId);
        if (video == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found.");
            return;
        }

        // Fetch comments
        List<Comment> comments = commentService.getCommentsByVideoId(videoId);

        // Session check
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;
        int userId = -1;

        if (session != null && session.getAttribute("user") != null) {
            isLoggedIn = true;
            User user = (User) session.getAttribute("user");
            userId = user.getUserId();
        }

        // Retrieve and remove flash messages from session
        if (session != null) {
            Object successMsg = session.getAttribute("success");
            Object errorMsg = session.getAttribute("error");

            if (successMsg != null) {
                request.setAttribute("success", successMsg);
                session.removeAttribute("success");
            }
            if (errorMsg != null) {
                request.setAttribute("error", errorMsg);
                session.removeAttribute("error");
            }
        }

        // Set attributes for JSP
        request.setAttribute("video", video);
        request.setAttribute("comments", comments);
        request.setAttribute("isLoggedIn", isLoggedIn);
        request.setAttribute("userId", userId);

        request.getRequestDispatcher("/client/watch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String videoIdParam = request.getParameter("id");
        String content = request.getParameter("content");

        if (videoIdParam == null || !videoIdParam.matches("\\d+") || content == null || content.trim().isEmpty()) {
            session.setAttribute("error", "Invalid comment submission.");
            response.sendRedirect(request.getContextPath() + "/video?id=" + videoIdParam);
            return;
        }

        int videoId = Integer.parseInt(videoIdParam);
        User user = (User) session.getAttribute("user");

        Comment comment = new Comment();
        comment.setVideoId(videoId);
        comment.setUserId(user.getUserId());
        comment.setContent(content.trim());

        boolean success = commentService.createComment(comment);

        if (success) {
            session.setAttribute("success", "Comment posted successfully!");
        } else {
            session.setAttribute("error", "Failed to post comment.");
        }

        response.sendRedirect(request.getContextPath() + "/video?id=" + videoId);
    }
}