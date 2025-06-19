<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
<div class="max-w-md w-full bg-white rounded-xl shadow-2xl overflow-hidden">
    <div class="bg-auth py-6 px-8 text-center">
        <h1 class="text-3xl font-bold mb-2">Tạo tài khoản</h1>
        <p class="text-blue-100">Điền thông tin để đăng ký</p>
    </div>

    <form method="post" action="register" class="px-8 pt-8 pb-6">
        <!-- Username -->
        <div class="mb-5">
            <label for="username" class="block text-gray-700 font-medium mb-2 flex items-center">
                <i class="fas fa-user mr-2 text-blue-500"></i> Tên đăng nhập
            </label>
            <input type="text" id="username" name="username" required
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-blue-500">
        </div>

        <!-- Password -->
        <div class="mb-5">
            <label for="password" class="block text-gray-700 font-medium mb-2 flex items-center">
                <i class="fas fa-lock mr-2 text-blue-500"></i> Mật khẩu
            </label>
            <input type="password" id="password" name="password" minlength="6" required
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-blue-500">
        </div>

        <!-- Confirm Password -->
        <div class="mb-5">
            <label for="confirmPassword" class="block text-gray-700 font-medium mb-2 flex items-center">
                <i class="fas fa-lock mr-2 text-blue-500"></i> Xác nhận mật khẩu
            </label>
            <input type="password" id="confirmPassword" name="confirmPassword" minlength="6" required
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-blue-500">
        </div>

        <!-- Email -->
        <div class="mb-5">
            <label for="email" class="block text-gray-700 font-medium mb-2 flex items-center">
                <i class="fas fa-envelope mr-2 text-blue-500"></i> Email
            </label>
            <input type="email" id="email" name="email" required
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-blue-500">
        </div>

        <!-- FullName -->
        <div class="mb-5">
            <label for="username" class="block text-gray-700 font-medium mb-2 flex items-center">
                <i class="fas fa-user mr-2 text-blue-500"></i> Họ và tên
            </label>
            <input type="text" id="fullName" name="fullName" required
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:border-blue-500">
        </div>

        <!-- Error (nếu có) -->
        <c:if test="${not empty error}">
            <div class="text-red-500 text-sm mt-2 mb-4">${error}</div>
        </c:if>

        <!-- Button -->
        <button type="submit"
                class="w-full bg-gradient-to-r from-green-500 to-green-600 text-white py-3 rounded-lg font-medium hover:from-green-600 hover:to-green-700 shadow-md">
            Đăng ký
        </button>

        <!-- Đăng nhập -->
        <div class="text-center text-sm text-gray-600 mt-6">
            Đã có tài khoản?
            <a href="login.jsp" class="text-blue-600 hover:underline font-medium">Đăng nhập ngay</a>
        </div>
    </form>
</div>
</body>
</html>
