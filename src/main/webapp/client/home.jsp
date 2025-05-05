<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VidView | Home</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-950 text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/navbarsession.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/navbar.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Video Grid Section -->
  <section class="bg-gray-900 py-16">
    <div class="max-w-7xl mx-auto px-6 text-center">

      <!-- Grid of Videos -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="v" items="${videos}">
          <div onclick="window.location.href='${pageContext.request.contextPath}/video?id=${v.videoId}'"
               class="cursor-pointer bg-gray-800 rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition duration-300 group">
            
            <div class="overflow-hidden">
              <iframe class="w-full h-48 pointer-events-none"
                      src="https://www.youtube.com/embed/${fn:replace(v.youtubeUrl, 'https://www.youtube.com/watch?v=', '')}">
              </iframe>
            </div>

            <div class="p-6 text-left space-y-3">
              <h3 class="text-xl font-bold text-white truncate">${v.title}</h3>
              <p class="text-sm text-gray-400">${v.description}</p>
              <div class="flex items-center justify-between mt-4">
                <span class="text-sm text-gray-400">
                  Uploaded by <span class="font-medium text-sky-500">${v.uploadedByName}</span>
                </span>
              </div>
            </div>
          </div>
        </c:forEach>

        <c:if test="${empty videos}">
          <div class="col-span-full text-gray-400">No videos available at the moment.</div>
        </c:if>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>