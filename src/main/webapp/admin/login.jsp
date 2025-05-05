<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VidView | Admin Login</title>
    <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=VV&background=0ea5e9&color=ffffff&rounded=true" type="image/x-icon">

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gradient-to-br from-gray-800 via-gray-900 to-slate-950 min-h-screen flex items-center justify-center px-4">
    <div class="w-full max-w-md p-8 space-y-6 bg-white/5 backdrop-blur-md shadow-xl rounded-2xl border border-sky-600/40">

        <!-- Title -->
        <h2 class="text-4xl font-bold text-center text-sky-400">VidView Admin</h2>
        <p class="text-center text-gray-400 text-sm mb-6">Sign in with your email and password.</p>

        <!-- Error -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="w-full bg-red-500/10 border border-red-600 text-red-400 px-4 py-3 rounded-lg text-center text-sm" role="alert">
                <i class="fas fa-exclamation-circle mr-2"></i>
                <%= error %>
            </div>
        <%
            }
        %>

        <!-- Login Form -->
        <form class="space-y-5" action="${pageContext.request.contextPath}/admin/login" method="POST">
            <!-- Email -->
            <div class="relative">
                <label for="email" class="block mb-1 text-gray-200 font-medium">Email</label>
                <div class="flex items-center relative">
                    <input id="email" name="email" type="email" required
                        class="w-full pl-10 pr-4 py-2 rounded-lg bg-gray-800 border border-gray-700 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                        placeholder="admin@example.com">
                    <i class="fas fa-envelope absolute left-3 text-gray-400"></i>
                </div>
            </div>

            <!-- Password -->
            <div class="relative">
                <label for="password" class="block mb-1 text-gray-200 font-medium">Password</label>
                <div class="flex items-center relative">
                    <input id="password" name="password" type="password" required
                        class="w-full pl-10 pr-10 py-2 rounded-lg bg-gray-800 border border-gray-700 text-white focus:ring-2 focus:ring-sky-500 focus:outline-none"
                        placeholder="Enter your password">
                    <i class="fas fa-lock absolute left-3 text-gray-400"></i>
                    <button type="button" onclick="togglePassword()" class="absolute right-3 text-gray-400 focus:outline-none">
                        <i id="eyeIcon" class="fas fa-eye"></i>
                    </button>
                </div>
            </div>

            <!-- Submit -->
            <div>
                <button type="submit"
                    class="w-full px-4 py-2 text-white bg-sky-600 hover:bg-sky-700 font-semibold rounded-lg shadow-md transition duration-200">
                    Sign In
                </button>
            </div>
        </form>

        <p class="text-center text-gray-500 text-xs mt-6">© 2025 VidView Admin</p>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById("password");
            const eyeIcon = document.getElementById("eyeIcon");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passwordInput.type = "password";
                eyeIcon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</body>
</html>