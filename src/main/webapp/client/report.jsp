<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Report Video | VidView</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>

<body class="bg-gray-900 text-gray-100 font-sans">

  <!-- Header -->
  <jsp:include page="./partials/navbarsession.jsp" />

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-4 py-16 space-y-10">

    <h1 class="text-3xl font-bold text-sky-400 text-center">
      <i class="fas fa-flag mr-2"></i> Report Video
    </h1>

    <!-- Flash Messages -->
    <c:if test="${not empty success}">
      <div id="successMessage" class="bg-green-700/10 border border-green-600 text-green-400 font-medium rounded-lg px-4 py-3 mb-4">
        <i class="fas fa-check-circle mr-2"></i>${success}
      </div>
      <script>
        setTimeout(function () {
          const msg = document.getElementById("successMessage");
          if (msg) {
            msg.style.transition = "opacity 0.5s ease";
            msg.style.opacity = "0";
            setTimeout(() => msg.remove(), 500);
          }
        }, 3000);
      </script>
    </c:if>

    <c:if test="${not empty error}">
      <div class="bg-red-700/10 border border-red-600 text-red-400 font-medium rounded-lg px-4 py-3 mb-4">
        <i class="fas fa-exclamation-circle mr-2"></i>${error}
      </div>
    </c:if>

    <!-- Report Form -->
    <form action="${pageContext.request.contextPath}/report" method="post" class="bg-gray-800 p-6 rounded-xl border border-gray-700 space-y-4">
      <input type="hidden" name="video_id" value="${videoId}" />

      <label for="reason" class="block text-sm font-medium text-gray-300 mb-1">
        Why are you reporting this video?
      </label>
      <textarea id="reason" name="reason" rows="6" required
        class="w-full p-3 rounded-lg bg-gray-700 text-white border border-gray-600 focus:ring-2 focus:ring-red-500 resize-none"
        placeholder="Describe the issue..."></textarea>

      <div class="flex justify-end">
        <button type="submit"
          class="px-5 py-2 bg-red-600/70 hover:bg-red-700/70 text-white font-semibold rounded-lg transition">
          <i class="fas fa-paper-plane mr-1"></i> Submit Report
        </button>
      </div>
    </form>

    <div class="text-center">
      <a href="${pageContext.request.contextPath}/video?id=${videoId}" class="text-sm text-sky-400 hover:underline">
        ← Back to Video
      </a>
    </div>
  </main>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>