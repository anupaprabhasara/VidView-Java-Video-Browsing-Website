package com.vidview.servlet;

import com.vidview.model.Video;
import com.vidview.service.VideoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/video")
public class VideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoService videoService;

    @Override
    public void init() throws ServletException {
        videoService = new VideoService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                // Show all videos
                request.setAttribute("videos", videoService.getAllVideos());
                request.getRequestDispatcher("/admin/videos/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                // Show create form
                request.getRequestDispatcher("/admin/videos/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Video video = videoService.getVideo(id);
                if (video != null) {
                    request.setAttribute("video", video);
                    request.getRequestDispatcher("/admin/videos/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                videoService.deleteVideo(id);
                response.sendRedirect(request.getContextPath() + "/admin/videos");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String youtubeUrl = request.getParameter("youtube_url");
                int uploadedBy = (int) session.getAttribute("adminId"); // assuming session has adminId

                Video video = new Video();
                video.setTitle(title);
                video.setDescription(description);
                video.setYoutubeUrl(youtubeUrl);
                video.setUploadedBy(uploadedBy);

                if (videoService.createVideo(video)) {
                    response.sendRedirect(request.getContextPath() + "/admin/videos");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create video.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String youtubeUrl = request.getParameter("youtube_url");

                Video video = new Video();
                video.setVideoId(id);
                video.setTitle(title);
                video.setDescription(description);
                video.setYoutubeUrl(youtubeUrl);

                if (videoService.updateVideo(video)) {
                    response.sendRedirect(request.getContextPath() + "/admin/videos");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update video.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}