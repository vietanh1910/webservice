<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .bg-auth {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .input-effect {
            transition: all 0.3s ease;
        }
        .input-effect:focus {
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.3);
        }
        .shake {
            animation: shake 0.5s;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
<div class="max-w-md w-full bg-white rounded-xl shadow-2xl overflow-hidden">
    <!-- Header -->
    <div class="bg-auth py-6 px-8 text-center">
        <h1 class="text-3xl font-bold text-white mb-2">Chào mừng trở lại</h1>
        <p class="text-blue-100">Vui lòng đăng nhập để tiếp tục</p>
    </div>

    <!-- Form -->
    <form id="loginForm" method="post" action="login" class="px-8 pt-8 pb-6">
        <!-- Username -->
        <div class="mb-6">
            <label for="username" class="block text-gray-700 text-sm font-medium mb-2 flex items-center">
                <i class="fas fa-user mr-2 text-blue-500"></i> Tên đăng nhập
            </label>
            <div class="relative">
                <input
                        type="text"
                        id="username"
                        name="username"
                        class="w-full px-4 py-3 rounded-lg border border-gray-300 input-effect focus:outline-none focus:border-blue-500 transition-all"
                        placeholder="Nhập tên đăng nhập"
                        required
                >
            </div>
        </div>

        <!-- Password -->
        <div class="mb-1">
            <label for="password" class="block text-gray-700 text-sm font-medium mb-2 flex items-center">
                <i class="fas fa-lock mr-2 text-blue-500"></i> Mật khẩu
            </label>
            <div class="relative">
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="w-full px-4 py-3 rounded-lg border border-gray-300 input-effect focus:outline-none focus:border-blue-500 transition-all"
                        placeholder="Nhập mật khẩu"
                        required
                        minlength="6"
                >
                <button type="button" id="togglePassword" class="absolute right-3 top-3.5 text-gray-400 hover:text-blue-500">
                    <i class="fas fa-eye"></i>
                </button>
            </div>
        </div>

        <!-- Error message if exists -->
        <c:if test="${not empty error}">
            <div class="text-red-500 text-sm mt-2 mb-4">${error}</div>
        </c:if>

        <!-- Forgot -->
        <div class="flex justify-between items-center mb-6">
            <a href="#" class="text-sm text-blue-600 hover:text-blue-800 hover:underline">Quên mật khẩu?</a>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="w-full bg-gradient-to-r from-blue-500 to-blue-600 text-white py-3 px-4 rounded-lg font-medium hover:from-blue-600 hover:to-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-50 transition-all transform hover:scale-[1.01] shadow-md">
            Đăng nhập
        </button>

        <!-- Divider -->
        <div class="flex items-center my-6">
            <div class="flex-grow border-t border-gray-300"></div>
            <span class="mx-4 text-gray-500 text-sm">hoặc</span>
            <div class="flex-grow border-t border-gray-300"></div>
        </div>

        <!-- Register Link -->
        <div class="text-center text-sm text-gray-600">
            Chưa có tài khoản?
            <a href="#" class="text-blue-600 hover:text-blue-800 hover:underline font-medium">Đăng ký ngay</a>
        </div>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const passwordInput = document.getElementById('password');
        const togglePassword = document.getElementById('togglePassword');

        // Toggle password visibility
        togglePassword.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
        });
    });
</script>
</body>
</html>
