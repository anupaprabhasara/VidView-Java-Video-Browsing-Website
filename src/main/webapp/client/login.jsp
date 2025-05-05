<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VidView | Login</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
</head>

<body class="bg-gray-900 text-white font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${not empty sessionScope.name}">
      <jsp:include page="./partials/navbarsession.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/navbar.jsp" />
    </c:otherwise>
  </c:choose>

  <!-- Login Form Section -->
  <main class="min-h-[80vh] flex items-center justify-center px-4 py-12">
    <div class="bg-gray-800 border border-gray-700 rounded-xl shadow-lg p-8 w-full max-w-md space-y-6">
      <div class="text-center">
        <i class="fas fa-video text-sky-500 text-4xl mb-4"></i>
        <h1 class="text-3xl font-bold text-white">Welcome to VidView</h1>
        <p class="text-sm text-gray-400">Please login to continue</p>
      </div>

      <!-- Error Message -->
      <c:if test="${not empty error}">
        <div class="bg-red-700/20 text-white text-sm px-4 py-3 rounded-md border border-red-500">
          <i class="fas fa-exclamation-circle mr-2"></i> ${error}
        </div>
      </c:if>

      <!-- Login Form -->
      <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-4">
        <div>
          <label for="email" class="block text-sm font-medium text-gray-300 mb-1">Email</label>
          <input type="email" id="email" name="email" required
                 class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                 value="${email != null ? email : rememberedEmail}" placeholder="you@example.com">
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-300 mb-1">Password</label>
          <input type="password" id="password" name="password" required
                 class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                 placeholder="••••••••">
        </div>

        <div class="flex items-center justify-between text-sm text-gray-400">
          <label class="inline-flex items-center">
            <input type="checkbox" name="remember" class="form-checkbox bg-gray-700 border-gray-600 text-sky-500">
            <span class="ml-2">Remember me</span>
          </label>
          <a href="#" class="hover:text-sky-400">Forgot password?</a>
        </div>

        <button type="submit"
                class="w-full py-2 bg-sky-600 hover:bg-sky-700 text-white font-semibold rounded-lg transition">
          <i class="fas fa-sign-in-alt mr-1"></i> Login
        </button>
      </form>

      <div class="text-center text-sm text-gray-400">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register" class="text-sky-400 hover:underline">Sign up here</a>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />
</body>
</html>