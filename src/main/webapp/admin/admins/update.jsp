<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VidView | Edit Admin</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=${sessionScope.fullName}&background=0ea5e9&color=fff&rounded=true" type="image/x-icon">

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

      <!-- Admin Update Form -->
      <form action="${pageContext.request.contextPath}/admin/admin" method="POST" class="bg-gray-900 border border-sky-700/30 shadow-lg rounded-xl p-8 w-full">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${admin.adminId}">

        <h2 class="text-2xl font-semibold text-sky-400 mb-6"><i class="fas fa-user-edit mr-2"></i> Update Admin</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Full Name -->
          <div>
            <label class="block text-sm font-medium mb-1 text-gray-300" for="full_name">Full Name</label>
            <input type="text" id="full_name" name="full_name" required
              value="${admin.fullName}"
              class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none">
          </div>

          <!-- Email -->
          <div>
            <label class="block text-sm font-medium mb-1 text-gray-300" for="email">Email</label>
            <input type="email" id="email" name="email" required
              value="${admin.email}"
              class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none">
          </div>
        </div>

        <!-- Password -->
        <div class="mt-6">
          <label class="block text-sm font-medium mb-1 text-gray-300" for="password">Password</label>
          <input type="password" id="password" name="password" required
          	value="${admin.password}"
            class="w-full px-4 py-2 rounded-lg border border-gray-700 bg-gray-800 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
            placeholder="Enter new password" oninput="validatePassword()">

          <!-- Password Criteria -->
          <div class="text-sm mt-2 space-y-1 hidden" id="passwordCriteria">
            <p id="length" class="text-red-500">• At least 8 characters</p>
            <p id="uppercase" class="text-red-500">• At least 1 uppercase letter</p>
            <p id="number" class="text-red-500">• At least 1 number</p>
            <p id="special" class="text-red-500">• At least 1 special character</p>
          </div>
        </div>

        <!-- Submit -->
        <div class="mt-8 flex justify-end">
          <button id="submitButton" type="submit"
            class="flex items-center gap-2 px-6 py-2 bg-sky-600 hover:bg-sky-700 text-white rounded-lg font-semibold transition">
            <i class="fas fa-save"></i> Update Admin
          </button>
        </div>
      </form>

    </main>
  </div>

  <!-- Scripts -->
  <%@ include file="../partials/script.jsp" %>

  <script>
    function validatePassword() {
      const password = document.getElementById('password').value;
      const length = document.getElementById('length');
      const uppercase = document.getElementById('uppercase');
      const number = document.getElementById('number');
      const special = document.getElementById('special');
      const criteriaBox = document.getElementById('passwordCriteria');
      const submitButton = document.getElementById('submitButton');

      if (password.length > 0) {
        criteriaBox.classList.remove('hidden');

        const validLength = password.length >= 8;
        const hasUpper = /[A-Z]/.test(password);
        const hasNumber = /[0-9]/.test(password);
        const hasSpecial = /[!@#$%^&*]/.test(password);

        length.className = validLength ? "text-green-400" : "text-red-500";
        uppercase.className = hasUpper ? "text-green-400" : "text-red-500";
        number.className = hasNumber ? "text-green-400" : "text-red-500";
        special.className = hasSpecial ? "text-green-400" : "text-red-500";

        submitButton.disabled = !(validLength && hasUpper && hasNumber && hasSpecial);
      } else {
        criteriaBox.classList.add('hidden');
        submitButton.disabled = false;
      }
    }

    window.onload = validatePassword;
  </script>

</body>
</html>