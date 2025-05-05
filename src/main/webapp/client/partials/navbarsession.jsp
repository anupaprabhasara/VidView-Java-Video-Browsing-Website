<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Navigation Bar (Logged-In User) -->
<nav class="bg-gray-900 text-white sticky top-0 z-50 shadow-md border-b border-gray-700">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center h-16">

      <!-- Brand -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold text-sky-400 hover:text-sky-300 transition">
        <i class="fas fa-video"></i> <span>VidView</span>
      </a>

      <!-- Right Section -->
      <div class="flex items-center space-x-4">
        <!-- Profile (No Dropdown) -->
        <div class="flex items-center gap-2">
          <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=0ea5e9&color=fff&rounded=true"
               alt="${sessionScope.name}" class="w-8 h-8 rounded-full border border-sky-600">
          <span class="text-sm font-medium hidden sm:inline">${sessionScope.name}</span>
        </div>

        <!-- Logout -->
        <a href="${pageContext.request.contextPath}/logout"
           class="px-4 py-2 bg-red-600/70 hover:bg-red-700/70 text-white rounded-md text-sm font-semibold transition">
          <i class="fas fa-sign-out-alt mr-1"></i> Logout
        </a>
      </div>
    </div>
  </div>
</nav>