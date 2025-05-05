<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- Navigation Bar (Non-Logged-In User, Dark Theme Match) -->
<nav class="bg-gray-900 text-white sticky top-0 z-50 shadow-md border-b border-gray-700">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center h-16">

      <!-- Brand -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold text-sky-400 hover:text-sky-300 transition">
        <i class="fas fa-video"></i> <span>VidView</span>
      </a>

      <!-- Right Section -->
      <div class="flex items-center space-x-4">
        <!-- Auth Buttons -->
        <a href="${pageContext.request.contextPath}/login"
           class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white transition">Login</a>
        <a href="${pageContext.request.contextPath}/register"
           class="px-4 py-2 bg-sky-600 hover:bg-sky-700 text-white rounded-md text-sm font-semibold transition">
          Sign Up
        </a>
      </div>

    </div>
  </div>
</nav>