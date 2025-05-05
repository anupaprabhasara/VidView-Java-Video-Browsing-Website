<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VidView | Edit Video</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=VidView&background=0ea5e9&color=fff&rounded=true" type="image/x-icon">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-950 text-gray-100 min-h-screen flex">

  <!-- Sidebar -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Page Content -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Video Update Form -->
      <form action="${pageContext.request.contextPath}/admin/video" method="POST" class="bg-gray-900 border border-sky-700/30 shadow-lg rounded-xl p-8 w-full">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${video.videoId}">

        <h2 class="text-2xl font-semibold text-sky-400 mb-6"><i class="fas fa-edit mr-2"></i> Update Video</h2>

        <!-- Title -->
        <div class="mb-6">
          <label class="block text-sm font-medium mb-1 text-gray-300" for="title">Title</label>
          <input type="text" id="title" name="title" required
            value="${video.title}"
            class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
            placeholder="Video title">
        </div>

        <!-- YouTube URL -->
        <div class="mb-6">
          <label class="block text-sm font-medium mb-1 text-gray-300" for="youtube_url">YouTube URL</label>
          <input type="url" id="youtube_url" name="youtube_url" required
            value="${video.youtubeUrl}"
            class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
            placeholder="https://www.youtube.com/watch?v=...">
        </div>

        <!-- Description -->
        <div class="mb-6">
          <label class="block text-sm font-medium mb-1 text-gray-300" for="description">Description</label>
          <textarea id="description" name="description" rows="5"
            class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
            placeholder="Video description...">${video.description}</textarea>
        </div>

        <!-- Submit -->
        <div class="mt-8 flex justify-end">
          <button type="submit"
            class="flex items-center gap-2 px-6 py-2 bg-sky-600 hover:bg-sky-700 text-white rounded-lg font-semibold transition">
            <i class="fas fa-save"></i> Update Video
          </button>
        </div>
      </form>

    </main>
  </div>

  <!-- Scripts -->
  <%@ include file="../partials/script.jsp" %>
</body>
</html>