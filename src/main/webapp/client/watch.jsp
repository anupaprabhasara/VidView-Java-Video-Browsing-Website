<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VidView | Watch</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-900 text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/navbarsession.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/navbar.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-4 py-12 space-y-10">

    <!-- Video Player -->
    <div class="rounded-xl overflow-hidden shadow-lg border border-gray-700">
      <iframe class="w-full h-96"
              src="https://www.youtube.com/embed/${fn:replace(video.youtubeUrl, 'https://www.youtube.com/watch?v=', '')}"></iframe>
    </div>

    <!-- Video Details -->
    <div class="space-y-2">
      <h1 class="text-3xl font-bold text-white">${video.title}</h1>
      <p class="text-gray-400">${video.description}</p>
      <div class="text-sm text-gray-500">
        Uploaded by <span class="text-sky-400 font-medium">${video.uploadedByName}</span> on ${video.uploadedAt}
      </div>
    </div>
    
    <!-- Report Button -->
	<div class="mt-4">
	  <a href="${pageContext.request.contextPath}/report-create?id=${video.videoId}"
	     class="inline-flex items-center gap-2 px-4 py-2 bg-red-600/70 hover:bg-red-700/70 text-white text-sm font-semibold rounded-lg transition">
	    <i class="fas fa-flag"></i> Report This Video
	  </a>
	</div>

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
	        setTimeout(() => msg.remove(), 500); // Remove after fade out
	      }
	    }, 3000); // 3 seconds
	  </script>
	</c:if>
    <c:if test="${not empty error}">
      <div class="bg-red-700/10 border border-red-600 text-red-400 font-medium rounded-lg px-4 py-3 mb-4">
        <i class="fas fa-exclamation-circle mr-2"></i>${error}
      </div>
    </c:if>

    <!-- Comments Section -->
    <div class="bg-gray-800 p-6 rounded-xl border border-gray-700 space-y-6">
      <h2 class="text-2xl font-bold text-sky-400">
        <i class="fas fa-comments mr-2"></i> Leave a Comment
      </h2>

      <!-- Comment Form (only if logged in) -->
      <c:if test="${isLoggedIn}">
        <form method="post" action="${pageContext.request.contextPath}/video" class="space-y-2">
          <input type="hidden" name="id" value="${video.videoId}">
          <textarea name="content" rows="3" required placeholder="Write your comment..."
                    class="w-full p-3 rounded-lg bg-gray-700 text-white border border-gray-600 focus:ring-2 focus:ring-sky-500 resize-none"></textarea>
          <button type="submit"
                  class="px-4 py-2 bg-sky-600 hover:bg-sky-700 text-white font-semibold rounded-lg transition">
            <i class="fas fa-comment-alt mr-1"></i> Post Comment
          </button>
        </form>
      </c:if>

      <c:if test="${not isLoggedIn}">
        <div class="text-gray-400 text-sm">You must <a href="${pageContext.request.contextPath}/login" class="text-sky-400 underline">login</a> to post a comment.</div>
      </c:if>

      <!-- Comment List -->
      <div class="space-y-4">
        <c:forEach var="c" items="${comments}">
          <div class="bg-gray-700 p-4 rounded-lg">
            <div class="flex justify-between items-start mb-2">
              <div>
                <span class="text-sky-400 font-medium">${c.commenter}</span>
                <span class="text-sm text-gray-400 ml-2">${c.commentedAt}</span>
              </div>

              <!-- Delete button if comment belongs to logged-in user -->
              <c:if test="${userId == c.userId}">
                <form method="post" action="${pageContext.request.contextPath}/video">
                  <input type="hidden" name="action" value="delete_comment">
                  <input type="hidden" name="comment_id" value="${c.commentId}">
                  <input type="hidden" name="id" value="${video.videoId}">
                  <button type="submit" class="text-red-400 hover:text-red-500 text-sm flex items-center gap-1 mt-1">
                    <i class="fas fa-trash"></i> Delete
                  </button>
                </form>
              </c:if>
            </div>
            <p class="text-sm text-gray-300">${c.content}</p>
          </div>
        </c:forEach>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>