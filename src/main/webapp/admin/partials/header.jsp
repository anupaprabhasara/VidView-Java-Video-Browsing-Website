<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String uri = request.getRequestURI();
    String pageTitle = "Dashboard Overview";

    if (uri.contains("/admin/admin")) {
        pageTitle = "Admin Management";
    } else if (uri.contains("/admin/user")) {
        pageTitle = "User Management";
    } else if (uri.contains("/admin/video")) {
        pageTitle = "Video Management";
    } else if (uri.contains("/admin/comment")) {
        pageTitle = "Comment Moderation";
    } else if (uri.contains("/admin/report")) {
        pageTitle = "Report Center";
    }

    request.setAttribute("pageTitle", pageTitle);
%>

<header class="flex justify-between items-center p-4 bg-gray-900 border-b border-sky-600/20 shadow-sm">
    <h2 class="text-xl font-bold text-sky-400">${pageTitle}</h2>

    <div class="flex items-center space-x-4">
        <div class="text-right text-sm">
            <p class="text-white font-medium">${sessionScope.fullName}</p>
            <p class="text-gray-400 text-xs">${sessionScope.email}</p>
        </div>
        <img
            src="https://ui-avatars.com/api/?name=${sessionScope.fullName}&background=0ea5e9&color=fff"
            alt="Profile Avatar"
            class="w-10 h-10 rounded-full shadow-md border border-sky-500/40"
        >
    </div>
</header>