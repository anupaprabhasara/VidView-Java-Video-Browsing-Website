<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VidView | Register</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
</head>

<body class="bg-gray-900 text-white font-sans">

  <!-- Header -->
  <jsp:include page="./partials/navbar.jsp" />

  <!-- Registration Section -->
  <main class="min-h-[80vh] flex items-center justify-center px-4 py-12">
    <div class="bg-gray-800 border border-gray-700 rounded-xl shadow-lg p-8 w-full max-w-md space-y-6">
      <div class="text-center">
        <i class="fas fa-user-plus text-sky-500 text-4xl mb-4"></i>
        <h1 class="text-3xl font-bold text-white">Create Your Account</h1>
        <p class="text-sm text-gray-400">Join VidView and start exploring content</p>
      </div>

      <!-- Messages -->
      <c:if test="${not empty error}">
        <div class="bg-red-700/20 text-white text-sm px-4 py-3 rounded-md border border-red-500">
          <i class="fas fa-exclamation-circle mr-2"></i> ${error}
        </div>
      </c:if>
      <c:if test="${not empty success}">
        <div class="bg-green-700/20 text-white text-sm px-4 py-3 rounded-md border border-green-500">
          <i class="fas fa-check-circle mr-2"></i> ${success}
        </div>
        <script>
          setTimeout(() => {
            window.location.href = "${pageContext.request.contextPath}/login";
          }, 3000);
        </script>
      </c:if>

      <!-- Registration Form -->
      <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-4" autocomplete="off">
        <div>
          <label for="full_name" class="block text-sm font-medium text-gray-300 mb-1">Full Name</label>
          <input type="text" id="full_name" name="full_name" required
                 class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                 placeholder="Your name">
        </div>

        <div>
          <label for="email" class="block text-sm font-medium text-gray-300 mb-1">Email</label>
          <input type="email" id="email" name="email" required
                 class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                 placeholder="you@example.com">
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-300 mb-1">Password</label>
          <input type="password" id="password" name="password" required
                 class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                 placeholder="••••••••">
          <ul class="text-xs text-gray-400 mt-2 space-y-1">
            <li id="lengthHint">• At least 8 characters</li>
            <li id="uppercaseHint">• At least one uppercase letter</li>
            <li id="lowercaseHint">• At least one lowercase letter</li>
            <li id="digitHint">• At least one number</li>
          </ul>
        </div>

        <button id="submitBtn" type="submit"
                class="w-full py-2 bg-sky-600 hover:bg-sky-700 text-white font-semibold rounded-lg transition opacity-50 cursor-not-allowed" disabled>
          <i class="fas fa-user-plus mr-1"></i> Register
        </button>
      </form>

      <div class="text-center text-sm text-gray-400">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login" class="text-sky-400 hover:underline">Login here</a>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" />

  <!-- Password JS -->
  <script>
    const passwordInput = document.getElementById("password");
    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");
    const submitBtn = document.getElementById("submitBtn");

    function validatePassword() {
      const val = passwordInput.value;
      const hasLength = val.length >= 8;
      const hasUpper = /[A-Z]/.test(val);
      const hasLower = /[a-z]/.test(val);
      const hasDigit = /\d/.test(val);

      lengthHint.className = hasLength ? "text-green-500" : "text-red-500";
      uppercaseHint.className = hasUpper ? "text-green-500" : "text-red-500";
      lowercaseHint.className = hasLower ? "text-green-500" : "text-red-500";
      digitHint.className = hasDigit ? "text-green-500" : "text-red-500";

      const isValid = hasLength && hasUpper && hasLower && hasDigit;
      submitBtn.disabled = !isValid;
      submitBtn.classList.toggle("opacity-50", !isValid);
      submitBtn.classList.toggle("cursor-not-allowed", !isValid);
      submitBtn.classList.toggle("hover:bg-sky-700", isValid);
    }

    passwordInput.addEventListener("input", validatePassword);
  </script>
</body>
</html>