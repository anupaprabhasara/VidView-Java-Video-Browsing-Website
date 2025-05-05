<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VidView | Users</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=Users&background=0ea5e9&color=fff&rounded=true" type="image/x-icon">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gradient-to-br from-gray-800 via-gray-900 to-slate-950 text-gray-100 min-h-screen flex">

  <!-- Sidebar -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Header -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Content -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Header Row (Only Search - Right Aligned) -->
	  <div class="flex justify-end">
	    <div class="relative w-full md:w-1/3">
	      <input id="search" type="text" placeholder="Search users..."
	             class="w-full pl-10 pr-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:ring-2 focus:ring-sky-500 focus:outline-none text-white">
	      <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
	    </div>
	  </div>

      <!-- Users Table -->
      <div class="overflow-x-auto bg-gray-900 shadow-lg rounded-xl border border-gray-700">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-gray-800 text-gray-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Full Name</th>
              <th class="px-6 py-4">Email</th>
              <th class="px-6 py-4">Created At</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody id="table" class="text-gray-200">
            <c:choose>
              <c:when test="${not empty users}">
                <c:forEach var="user" items="${users}">
                  <tr class="border-b border-gray-800 hover:bg-gray-800/60 transition">
                    <td class="px-6 py-4">${user.userId}</td>
                    <td class="px-6 py-4">${user.fullName}</td>
                    <td class="px-6 py-4">${user.email}</td>
                    <td class="px-6 py-4">${user.createdAt}</td>
                    <td class="px-6 py-4 text-center space-x-4">
                      <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=${user.userId}"
                         onclick="return confirm('Are you sure you want to delete this user?');"
                         class="text-red-500 hover:text-red-600">
                        <i class="fas fa-trash-alt"></i> Delete
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5" class="px-6 py-4 text-center text-gray-400">No users found.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <!-- Scripts -->
  <%@ include file="../partials/script.jsp" %>
  
</body>
</html>