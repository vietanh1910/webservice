<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String token = (String) session.getAttribute("token");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - Wanderlust Adventures</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-search {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 40vh;
        }

        .destination-card:hover .destination-overlay {
            opacity: 1;
            transform: translateY(0);
        }

        .destination-overlay {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.3s ease;
        }

        .search-card {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.95);
        }

        .gradient-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
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

        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .line-clamp-3 {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</head>
<body class="font-sans">
<!-- Navigation -->
<nav class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <div class="flex-shrink-0 flex items-center">
                    <i class="fas fa-plane-departure text-blue-600 text-2xl mr-2"></i>
                    <span class="text-xl font-bold text-blue-600">Wanderlust</span>
                </div>
            </div>
            <div class="hidden md:flex items-center space-x-8">
                <a href="home.jsp" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Home</a>
                <a href="search" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Search</a>
                <c:choose>
                    <c:when test="${sessionScope.token != null}">
                        <a href="logout" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">
                            <i class="fas fa-sign-out-alt mr-1"></i>Logout
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="login" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">
                            <i class="fas fa-sign-in-alt mr-1"></i>Login
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="md:hidden flex items-center">
                <button id="menu-btn" class="text-gray-800 hover:text-blue-600 focus:outline-none">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-white shadow-lg">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
            <a href="home.jsp" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Home</a>
            <a href="search" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Search</a>
            <c:choose>
                <c:when test="${sessionScope.token != null}">
                    <a href="logout" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">
                        <i class="fas fa-sign-out-alt mr-1"></i>Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="login" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">
                        <i class="fas fa-sign-in-alt mr-1"></i>Login
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<!-- Hero Search Section -->
<section class="hero-search flex items-center justify-center text-white">
    <div class="text-center px-4 py-16">
        <h1 class="text-3xl md:text-5xl font-bold mb-6">
            <c:choose>
                <c:when test="${not empty keyword}">
                    Results for: "<span class="text-yellow-300">${keyword}</span>"
                </c:when>
                <c:otherwise>
                    Search Destinations
                </c:otherwise>
            </c:choose>
        </h1>
        <p class="text-lg md:text-xl mb-8 max-w-3xl mx-auto">
            <c:choose>
                <c:when test="${not empty places}">
                    Found ${places.size()} destinations matching your search
                </c:when>
                <c:otherwise>
                    Discover amazing destinations with our search tool
                </c:otherwise>
            </c:choose>
        </p>
    </div>
</section>

<!-- Search Section -->
<section class="bg-white py-12 -mt-16 relative z-10">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="search-card rounded-xl shadow-xl p-6 md:p-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Search Again</h2>
            <form action="search" method="GET">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div class="relative md:col-span-2">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="keyword">Keywords</label>
                        <div class="relative">
                            <input type="text"
                                   id="keyword"
                                   name="keyword"
                                   value="${keyword}"
                                   placeholder="Enter destination name..."
                                   class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <i class="fas fa-search absolute right-3 top-3 text-gray-400"></i>
                        </div>
                    </div>
                    <div class="relative">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="category">Category</label>
                        <select id="category"
                                name="category"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Categories</option>
                            <option value="Tourism" ${category == 'Tourism' ? 'selected' : ''}>Tourism</option>
                            <option value="Food" ${category == 'Food' ? 'selected' : ''}>Food & Dining</option>
                            <option value="Entertainment" ${category == 'Entertainment' ? 'selected' : ''}>Entertainment</option>
                            <option value="Shopping" ${category == 'Shopping' ? 'selected' : ''}>Shopping</option>
                        </select>
                    </div>
                    <div class="flex items-end">
                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition duration-300">
                            Search <i class="fas fa-search ml-2"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- Search Results -->
<section class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <c:choose>
            <c:when test="${empty places}">
                <!-- No Results -->
                <div class="bg-white rounded-xl shadow-lg p-12 text-center fade-in">
                    <div class="text-6xl text-gray-400 mb-6">
                        <i class="fas fa-search"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-4">No Results Found</h2>
                    <p class="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
                        We couldn't find any destinations matching your search criteria.<br>
                        Try using different keywords or explore different categories.
                    </p>
                    <div class="flex flex-col sm:flex-row justify-center gap-4">
                        <a href="search" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-full transition duration-300">
                            <i class="fas fa-search mr-2"></i>New Search
                        </a>
                        <a href="home.jsp" class="bg-transparent hover:bg-blue-600 text-blue-600 hover:text-white font-bold py-3 px-6 border-2 border-blue-600 rounded-full transition duration-300">
                            <i class="fas fa-home mr-2"></i>Back to Home
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Search Summary -->
                <div class="text-center mb-12 fade-in">
                    <div class="flex flex-wrap justify-center items-center gap-4 mb-6">
                        <c:if test="${not empty category}">
                            <span class="bg-blue-100 text-blue-800 px-4 py-2 rounded-full text-sm font-medium flex items-center gap-2">
                                <i class="fas fa-tag"></i>
                                Category: ${category}
                            </span>
                        </c:if>
                        <span class="text-gray-600 text-lg flex items-center gap-2">
                            <i class="fas fa-map-marked-alt text-blue-500"></i>
                            Found ${places.size()} destinations
                        </span>
                    </div>
                </div>

                <!-- Results Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="place" items="${places}" varStatus="status">
                        <div class="destination-card card-hover relative overflow-hidden rounded-xl shadow-lg h-96 bg-white fade-in" style="animation-delay: ${status.index * 0.1}s;">
                            <!-- Image -->
                            <div class="relative h-56 overflow-hidden">
                                <c:choose>
                                    <c:when test="${not empty place.imageUrls}">
                                        <img src="${pageContext.request.contextPath}/${place.imageUrls[0]}"
                                             alt="${place.placeName}"
                                             class="w-full h-full object-cover">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="w-full h-full bg-gradient-to-br from-blue-400 to-purple-500 flex items-center justify-center">
                                            <i class="fas fa-image text-white text-4xl opacity-50"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Overlay -->
                                <div class="destination-overlay absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent flex flex-col justify-end p-4">
                                    <c:if test="${place.averageRating > 0}">
                                        <div class="flex items-center mb-2">
                                            <div class="flex text-yellow-400 text-sm mr-2">
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
                                            <span class="text-white font-bold text-sm">
                                                <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>
                                            </span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Content -->
                            <div class="p-6">
                                <h3 class="text-xl font-bold text-gray-800 mb-2 line-clamp-2">${place.placeName}</h3>

                                <div class="flex items-center text-gray-600 mb-3">
                                    <i class="fas fa-map-marker-alt text-red-500 mr-2 flex-shrink-0"></i>
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

                                <!-- Action Button -->
                                <div class="absolute bottom-4 right-4">
                                    <a href="place-detail?id=${place.id}"
                                       class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full text-sm font-medium transition duration-300 inline-flex items-center gap-2">
                                        <i class="fas fa-eye"></i>
                                        View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination or Load More -->
                <div class="text-center mt-12">
                    <a href="places" class="bg-transparent hover:bg-blue-600 text-blue-600 hover:text-white font-bold py-3 px-6 border-2 border-blue-600 rounded-full transition duration-300">
                        View All Destinations <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Newsletter -->
<section class="py-16 bg-blue-600 text-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl font-bold mb-4">Get Travel Updates</h2>
        <p class="text-xl mb-8">Subscribe to receive exclusive deals and the latest destination recommendations</p>
        <div class="flex flex-col sm:flex-row gap-4 max-w-md mx-auto">
            <input type="email" placeholder="Your email address" class="flex-grow p-3 rounded-lg focus:outline-none text-gray-800">
            <button class="bg-white hover:bg-gray-100 text-blue-600 font-bold py-3 px-6 rounded-lg transition duration-300">
                Subscribe
            </button>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <div class="flex items-center mb-4">
                    <i class="fas fa-plane-departure text-blue-400 text-2xl mr-2"></i>
                    <span class="text-xl font-bold">Wanderlust</span>
                </div>
                <p class="text-gray-400 mb-4">Making travel dreams come true since 2010.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="home.jsp" class="text-gray-400 hover:text-white transition duration-300">Home</a></li>
                    <li><a href="search" class="text-gray-400 hover:text-white transition duration-300">Search</a></li>
                    <li><a href="places" class="text-gray-400 hover:text-white transition duration-300">Destinations</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Contact</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Services</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Flight Booking</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Hotel Booking</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Package Tours</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Visa Support</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Contact</h4>
                <ul class="space-y-3 text-gray-400">
                    <li class="flex items-start">
                        <i class="fas fa-map-marker-alt mt-1 mr-3 text-blue-400"></i>
                        <span>123 Travel Street, District 1, Ho Chi Minh City</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-phone-alt mr-3 text-blue-400"></i>
                        <span>1900 1234</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-envelope mr-3 text-blue-400"></i>
                        <span>info@wanderlust.com</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2025 Wanderlust Adventures. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<button id="back-to-top" class="fixed bottom-8 right-8 w-12 h-12 bg-blue-600 text-white rounded-full shadow-lg flex items-center justify-center transition duration-300 opacity-0 invisible hover:bg-blue-700">
    <i class="fas fa-arrow-up"></i>
</button>

<script>
    // Mobile menu toggle
    const menuBtn = document.getElementById('menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    menuBtn.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });

    // Back to top button
    const backToTopBtn = document.getElementById('back-to-top');

    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            backToTopBtn.classList.remove('opacity-0', 'invisible');
            backToTopBtn.classList.add('opacity-100', 'visible');
        } else {
            backToTopBtn.classList.remove('opacity-100', 'visible');
            backToTopBtn.classList.add('opacity-0', 'invisible');
        }
    });

    backToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
                if (!mobileMenu.classList.contains('hidden')) {
                    mobileMenu.classList.add('hidden');
                }
            }
        });
    });

    // Enhanced animations and interactions
    document.addEventListener('DOMContentLoaded', function() {
        // Stagger animation for cards
        const cards = document.querySelectorAll('.card-hover');
        cards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });

        // Focus on search input if no results
        if (${empty places}) {
            document.getElementById('keyword').focus();
        }
    });

    // Add loading animation for view detail buttons
    document.querySelectorAll('a[href*="place-detail"]').forEach(btn => {
        btn.addEventListener('click', function(e) {
            const icon = this.querySelector('i');
            const originalClass = icon.className;
            icon.className = 'fas fa-spinner fa-spin';
            setTimeout(() => {
                icon.className = originalClass;
            }, 1000);
        });
    });

    // Autofocus search input and select text if there's a keyword
    document.addEventListener('DOMContentLoaded', function() {
        const keywordInput = document.getElementById('keyword');
        if (keywordInput.value) {
            keywordInput.select();
        }
    });
</script>
</body>
</html>