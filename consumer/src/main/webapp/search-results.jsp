<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:10 PM
  Modern Travel Service Search Results Page - Tailwind CSS Version
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm - TravelExplorer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Poppins', sans-serif;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .gradient-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .card-hover {
            transition: all 0.4s ease;
        }

        .card-hover:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .image-hover {
            transition: transform 0.4s ease;
        }

        .card-hover:hover .image-hover {
            transform: scale(1.05);
        }

        .navbar {
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            background-color: rgba(0, 0, 0, 0.9);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .mobile-menu {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
        }

        .mobile-menu.open {
            max-height: 500px;
        }

        .fade-in {
            animation: fadeInUp 0.6s ease forwards;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }
    </style>
</head>
<body class="font-sans text-gray-800 bg-gray-50">
<!-- Header & Navigation -->
<header class="fixed w-full z-50">
    <nav id="navbar" class="navbar py-4 px-6 md:px-12 flex justify-between items-center bg-white bg-opacity-95">
        <div class="flex items-center">
            <a href="home.jsp" class="text-2xl font-bold">
                <i class="fas fa-compass mr-2 text-blue-500"></i>
                <span class="gradient-text">TravelExplorer</span>
            </a>
        </div>

        <div class="hidden md:flex space-x-8">
            <a href="search" class="text-gray-700 hover:text-blue-500 font-medium transition duration-300 flex items-center">
                <i class="fas fa-search mr-1"></i>Tìm kiếm
            </a>
            <c:choose>
                <c:when test="${sessionScope.token != null}">
                    <a href="logout" class="text-gray-700 hover:text-blue-500 font-medium transition duration-300 flex items-center">
                        <i class="fas fa-sign-out-alt mr-1"></i>Đăng xuất
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="login" class="text-gray-700 hover:text-blue-500 font-medium transition duration-300 flex items-center">
                        <i class="fas fa-sign-in-alt mr-1"></i>Đăng nhập
                    </a>
                </c:otherwise>
            </c:choose>
        </div>

        <button id="mobile-menu-button" class="md:hidden text-gray-700 text-2xl">
            <i class="fas fa-bars"></i>
        </button>
    </nav>

    <div id="mobile-menu" class="mobile-menu md:hidden bg-gray-900">
        <div class="px-6 py-4 space-y-4">
            <a href="search" class="block text-white hover:text-blue-300 flex items-center">
                <i class="fas fa-search mr-2"></i>Tìm kiếm
            </a>
            <c:choose>
                <c:when test="${sessionScope.token != null}">
                    <a href="logout" class="block text-white hover:text-blue-300 flex items-center">
                        <i class="fas fa-sign-out-alt mr-2"></i>Đăng xuất
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="login" class="block text-white hover:text-blue-300 flex items-center">
                        <i class="fas fa-sign-in-alt mr-2"></i>Đăng nhập
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="pt-24 pb-16">
    <div class="container mx-auto px-6">
        <!-- Search Summary -->
        <div class="bg-white rounded-3xl shadow-xl p-8 mb-8 fade-in">
            <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">
                Kết quả tìm kiếm cho: "<span class="gradient-text">${keyword}</span>"
            </h1>
            <div class="flex flex-wrap items-center gap-4 mb-4">
                <c:if test="${not empty category}">
                        <span class="btn-primary text-white px-4 py-2 rounded-full text-sm font-medium flex items-center gap-2">
                            <i class="fas fa-tag"></i>
                            Danh mục: ${category}
                        </span>
                </c:if>
                <span class="text-gray-600 text-lg flex items-center gap-2">
                        <i class="fas fa-map-marked-alt text-blue-500"></i>
                        Tìm thấy ${places.size()} địa điểm tuyệt vời
                    </span>
            </div>
        </div>

        <!-- Search Results -->
        <c:choose>
            <c:when test="${empty places}">
                <!-- No Results -->
                <div class="bg-white rounded-3xl shadow-xl p-12 text-center fade-in">
                    <div class="text-6xl text-gray-400 mb-6">
                        <i class="fas fa-search"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-4">Không tìm thấy kết quả</h2>
                    <p class="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
                        Chúng tôi không thể tìm thấy địa điểm nào phù hợp với tiêu chí tìm kiếm của bạn.<br>
                        Hãy thử sử dụng từ khóa khác hoặc khám phá các danh mục khác nhau.
                    </p>
                    <a href="search" class="btn-primary text-white px-8 py-4 rounded-full font-bold text-lg inline-flex items-center gap-3">
                        <i class="fas fa-search"></i>
                        Tìm kiếm lại
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Results Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="place" items="${places}" varStatus="status">
                        <div class="bg-white rounded-3xl shadow-lg overflow-hidden card-hover fade-in" style="animation-delay: ${status.index * 0.1}s;">
                            <!-- Image -->
                            <div class="relative h-56 overflow-hidden">
                                <c:choose>
                                    <c:when test="${not empty place.imageUrls}">
                                        <img src="${place.imageUrls}" alt="${place.placeName}" class="w-full h-full object-cover image-hover">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="w-full h-full gradient-bg flex items-center justify-center">
                                            <i class="fas fa-image text-white text-4xl opacity-50"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <!-- Content -->
                            <div class="p-6">
                                <h3 class="text-xl font-bold text-gray-800 mb-3 line-clamp-2">${place.placeName}</h3>

                                <div class="flex items-center text-gray-600 mb-3">
                                    <i class="fas fa-map-marker-alt text-red-500 mr-2"></i>
                                    <span class="text-sm line-clamp-1">${place.address}</span>
                                </div>

                                <p class="text-gray-600 text-sm line-clamp-3 mb-4">
                                    <c:choose>
                                        <c:when test="${place.description.length() > 120}">
                                            ${place.description.substring(0, 120)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${place.description}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <!-- Meta Info -->
                                <div class="flex justify-between items-center mb-4">

                                    <c:if test="${place.averageRating > 0}">
                                        <div class="flex items-center gap-1">
                                            <div class="flex text-yellow-400 text-sm">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <c:choose>
                                                        <c:when test="${star <= place.averageRating}">
                                                            <i class="fas fa-star"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-star"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <span class="text-gray-600 text-sm font-medium ml-1">
                                                    <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>
                                                </span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Footer -->
                            <div class="bg-gray-50 px-6 py-4 flex justify-between items-center">
                                <a href="place-detail?id=${place.id}" class="btn-primary text-white px-6 py-2 rounded-full font-medium text-sm inline-flex items-center gap-2">
                                    <i class="fas fa-eye"></i>
                                    Xem chi tiết
                                </a>
                                <small class="text-gray-500 text-xs flex items-center gap-1">
                                    <i class="fas fa-calendar-alt"></i>
<%--                                    <fmt:formatDate value="${place.createdAt}" pattern="dd/MM/yyyy"/>--%>
                                </small>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Search Actions -->
        <div class="text-center mt-12">
            <a href="search" class="btn-primary text-white px-8 py-4 rounded-full font-bold text-lg inline-flex items-center gap-3">
                <i class="fas fa-search"></i>
                Tìm kiếm mới
            </a>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
            <!-- About -->
            <div>
                <h3 class="text-xl font-bold mb-4 gradient-text">TravelExplorer</h3>
                <p class="text-gray-400 mb-4">Khám phá thế giới cùng chúng tôi với những trải nghiệm du lịch đáng nhớ và dịch vụ chất lượng cao.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-blue-400 text-xl transition duration-300">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-blue-400 text-xl transition duration-300">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-blue-400 text-xl transition duration-300">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
            </div>

            <!-- Quick Links -->
            <div>
                <h3 class="text-xl font-bold mb-4">Liên kết nhanh</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Trang chủ</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Tìm kiếm</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Về chúng tôi</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Liên hệ</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div>
                <h3 class="text-xl font-bold mb-4">Liên hệ</h3>
                <ul class="space-y-3 text-gray-400">
                    <li class="flex items-start">
                        <i class="fas fa-map-marker-alt mt-1 mr-3 text-blue-400"></i>
                        <span>123 Đường ABC, Quận 1, TP.HCM</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-phone-alt mr-3 text-blue-400"></i>
                        <span>1900 1234</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-envelope mr-3 text-blue-400"></i>
                        <span>contact@travelexplorer.com</span>
                    </li>
                </ul>
            </div>

            <!-- Newsletter -->
            <div>
                <h3 class="text-xl font-bold mb-4">Đăng ký tin tức</h3>
                <p class="text-gray-400 mb-4">Nhận thông tin mới nhất về các điểm đến du lịch</p>
                <div class="flex">
                    <input type="email" placeholder="Email của bạn" class="flex-grow px-4 py-2 rounded-l-full text-gray-800 focus:outline-none">
                    <button class="btn-primary text-white px-6 py-2 rounded-r-full font-medium">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 text-center text-gray-400">
            <p>© 2025 TravelExplorer. Bảo lưu mọi quyền.</p>
        </div>
    </div>
</footer>

<script>
    // Mobile menu toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');

    mobileMenuButton.addEventListener('click', () => {
        mobileMenu.classList.toggle('open');
    });

    // Navbar scroll effect
    const navbar = document.getElementById('navbar');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 100) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Enhanced animations and interactions
    document.addEventListener('DOMContentLoaded', function() {
        // Stagger animation for cards
        const cards = document.querySelectorAll('.card-hover');
        cards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });

        // Smooth scroll to results
        if (document.querySelector('.card-hover')) {
            setTimeout(() => {
                document.querySelector('.fade-in').scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }, 300);
        }
    });

    // Add loading animation for view detail buttons
    document.querySelectorAll('a[href*="place-detail"]').forEach(btn => {
        btn.addEventListener('click', function(e) {
            const icon = this.querySelector('i');
            icon.className = 'fas fa-spinner fa-spin';
            setTimeout(() => {
                icon.className = 'fas fa-eye';
            }, 500);
        });
    });
</script>
</body>
</html>