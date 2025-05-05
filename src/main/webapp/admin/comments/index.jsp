<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VidView | Video Comments</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=Comments&background=0ea5e9&color=fff&rounded=true" type="image/x-icon">

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

      <!-- Title -->
      <div class="flex justify-between items-center">
        <h1 class="text-2xl font-semibold text-sky-400"><i class="fas fa-comments mr-2"></i> Video Comments</h1>
      </div>

      <!-- Comments Table -->
      <div class="overflow-x-auto bg-gray-900 shadow-lg rounded-xl border border-gray-700">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-gray-800 text-gray-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Video Title</th>
              <th class="px-6 py-4">Commenter</th>
              <th class="px-6 py-4">Content</th>
              <th class="px-6 py-4">Commented At</th>
              <th class="px-6 py-4 text-center">Action</th>
            </tr>
          </thead>
          <tbody class="text-gray-200">
            <c:choose>
              <c:when test="${not empty comments}">
                <c:forEach var="comment" items="${comments}">
                  <tr class="border-b border-gray-800 hover:bg-gray-800/60 transition">
                    <td class="px-6 py-4">${comment.commentId}</td>
                    <td class="px-6 py-4">${comment.videoTitle}</td>
                    <td class="px-6 py-4">${comment.commenter}</td>
                    <td class="px-6 py-4">${comment.content}</td>
                    <td class="px-6 py-4">${comment.commentedAt}</td>
                    <td class="px-6 py-4 text-center">
                      <a href="${pageContext.request.contextPath}/admin/comment?action=delete&id=${comment.commentId}"
                         onclick="return confirm('Are you sure you want to delete this comment?');"
                         class="text-red-500 hover:text-red-600">
                        <i class="fas fa-trash-alt"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-4 text-center text-gray-400">No comments available.</td>
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