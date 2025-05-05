<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VidView | Admins</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=${sessionScope.fullName}&background=0ea5e9&color=fff&rounded=true" type="image/x-icon">

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

      <!-- Header Row -->
      <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
        <a href="${pageContext.request.contextPath}/admin/admin?action=create"
           class="flex items-center gap-2 px-5 py-2 bg-sky-600 hover:bg-sky-700 text-white rounded-lg font-semibold transition">
          <i class="fas fa-plus"></i> Add Admin
        </a>

        <div class="relative w-full md:w-1/3">
          <input id="search" type="text" placeholder="Search admins..."
                 class="w-full pl-10 pr-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:ring-2 focus:ring-sky-500 focus:outline-none text-white">
          <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
        </div>
      </div>

      <!-- Admins Table -->
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
              <c:when test="${not empty admins}">
                <c:forEach var="admin" items="${admins}">
                  <tr class="border-b border-gray-800 hover:bg-gray-800/60 transition">
                    <td class="px-6 py-4">${admin.adminId}</td>
                    <td class="px-6 py-4">${admin.fullName}</td>
                    <td class="px-6 py-4">${admin.email}</td>
                    <td class="px-6 py-4">${admin.createdAt}</td>
                    <td class="px-6 py-4 text-center space-x-4">
                      <a href="${pageContext.request.contextPath}/admin/admin?action=edit&id=${admin.adminId}"
                         class="text-sky-400 hover:text-sky-500">
                        <i class="fas fa-edit"></i>
                      </a>
                      <a href="${pageContext.request.contextPath}/admin/admin?action=delete&id=${admin.adminId}"
                         onclick="return confirmDelete(this.href);"
                         class="text-red-500 hover:text-red-600">
                        <i class="fas fa-trash"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5" class="px-6 py-4 text-center text-gray-400">No admins found.</td>
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

  <script>
    function confirmDelete(url) {
      return confirm('Are you sure you want to delete this admin?');
    }
  </script>

</body>
</html>