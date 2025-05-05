package com.vidview.servlet;

import com.vidview.model.Report;
import com.vidview.model.User;
import com.vidview.service.ReportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/report")
public class VideoReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ReportService reportService = new ReportService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String videoIdParam = request.getParameter("id");

        if (videoIdParam == null || !videoIdParam.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid video ID.");
            return;
        }

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("user") != null) {
            isLoggedIn = true;
        }

        if (!isLoggedIn) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Load and remove flash messages
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

        request.setAttribute("videoId", Integer.parseInt(videoIdParam));
        request.getRequestDispatcher("/client/report.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String videoIdParam = request.getParameter("video_id");
        String reason = request.getParameter("reason");

        if (videoIdParam == null || !videoIdParam.matches("\\d+") || reason == null || reason.trim().isEmpty()) {
            session.setAttribute("error", "Invalid report submission.");
            response.sendRedirect(request.getContextPath() + "/report?id=" + videoIdParam);
            return;
        }

        int videoId = Integer.parseInt(videoIdParam);
        User user = (User) session.getAttribute("user");

        Report report = new Report();
        report.setVideoId(videoId);
        report.setUserId(user.getUserId());
        report.setReason(reason.trim());

        boolean success = reportService.createReport(report);

        if (success) {
            session.setAttribute("success", "Report submitted successfully!");
        } else {
            session.setAttribute("error", "Failed to submit report.");
        }

        response.sendRedirect(request.getContextPath() + "/report?id=" + videoId);
    }
}