<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="fixed top-0 left-0 w-60 hidden md:flex flex-col bg-gray-900 border-r border-sky-700/50 shadow-lg h-screen z-20">

  <!-- Logo -->
  <div class="p-6 text-center border-b border-sky-700/30">
    <h1 class="text-2xl font-bold text-sky-400">VidView</h1>
    <p class="text-sm text-gray-500">Admin Panel</p>
  </div>

  <!-- Navigation -->
  <nav class="flex-1 px-4 py-6 space-y-2 overflow-y-auto text-sm">
    <a href="${pageContext.request.contextPath}/admin/video"
       class="flex items-center p-3 rounded hover:bg-sky-600/20 transition text-gray-300 hover:text-white">
      <i class="fas fa-video mr-3"></i> Videos
    </a>

    <a href="${pageContext.request.contextPath}/admin/comment"
       class="flex items-center p-3 rounded hover:bg-sky-600/20 transition text-gray-300 hover:text-white">
      <i class="fas fa-comments mr-3"></i> Comments
    </a>

    <a href="${pageContext.request.contextPath}/admin/report"
       class="flex items-center p-3 rounded hover:bg-sky-600/20 transition text-gray-300 hover:text-white">
      <i class="fas fa-flag mr-3"></i> Reports
    </a>

    <a href="${pageContext.request.contextPath}/admin/admin"
       class="flex items-center p-3 rounded hover:bg-sky-600/20 transition text-gray-300 hover:text-white">
      <i class="fas fa-user-shield mr-3"></i> Admins
    </a>

    <a href="${pageContext.request.contextPath}/admin/user"
       class="flex items-center p-3 rounded hover:bg-sky-600/20 transition text-gray-300 hover:text-white">
      <i class="fas fa-users mr-3"></i> Users
    </a>
  </nav>

  <!-- Logout -->
  <div class="p-4 border-t border-sky-700/30">
    <a href="${pageContext.request.contextPath}/admin/logout"
       class="w-full flex items-center justify-center text-red-400 hover:text-red-500 font-semibold transition">
      <i class="fas fa-sign-out-alt mr-2"></i> Logout
    </a>
  </div>

</aside>