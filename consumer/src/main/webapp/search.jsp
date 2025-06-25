<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String token = (String) session.getAttribute("token");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search | Wanderlust Adventures</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-search {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            min-height: 60vh;
        }

        .place-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .place-card {
            transition: all 0.3s ease;
        }

        .parallax {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body class="font-sans bg-gray-50">
<!-- Navigation -->
<nav class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <div class="flex-shrink-0 flex items-center">
                    <i class="fas fa-plane-departure text-blue-600 text-2xl mr-2"></i>
                    <a href="home" class="text-xl font-bold text-blue-600">Wanderlust</a>
                </div>
            </div>
            <div class="hidden md:flex items-center space-x-8">
                <a href="home" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Home</a>
                <a href="search" class="text-blue-600 px-3 py-2 font-medium border-b-2 border-blue-600">Search</a>
                <c:choose>
                    <c:when test="${sessionScope.user != null and sessionScope.user.role == 2}">
                        <a href="${pageContext.request.contextPath}/logout" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">
                            <i class="fas fa-sign-out-alt mr-1"></i> Logout
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="login" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full font-medium transition duration-300">
                            <i class="fas fa-sign-in-alt mr-1"></i> Login
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
            <a href="home" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Home</a>
            <a href="search" class="block px-3 py-2 text-blue-600 font-medium">Search</a>
            <c:choose>
                <c:when test="${sessionScope.user != null and sessionScope.user.role == 2}">
                    <a href="logout" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">
                        <i class="fas fa-sign-out-alt mr-1"></i>Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="login" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">
                        <i class="fas fa-sign-in-alt mr-1"></i>Login
                    </a>
                    <a href="register" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">
                        <i class="fas fa-user-plus mr-1"></i>Register
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<!-- Hero Search Section -->
<section class="hero-search flex items-center justify-center text-white">
    <div class="text-center px-4 w-full max-w-4xl">
        <h1 class="text-4xl md:text-5xl font-bold mb-6">Find Your Perfect Destination</h1>
        <p class="text-xl md:text-2xl mb-8">Search for amazing places that match your interests</p>

        <!-- Search Form -->
        <div class="bg-white rounded-xl shadow-xl p-6 md:p-8 max-w-2xl mx-auto">
            <form action="search" method="get" class="space-y-4">
                <div class="relative">
                    <label class="block text-gray-700 text-sm font-bold mb-2 text-left" for="keyword">
                        What are you looking for?
                    </label>
                    <div class="relative">
                        <input type="text"
                               id="keyword"
                               name="keyword"
                               value="${param.keyword}"
                               placeholder="Enter place name, city, or description..."
                               class="w-full p-4 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-gray-800 text-lg">
                        <i class="fas fa-search absolute right-4 top-4 text-gray-400 text-lg"></i>
                    </div>
                </div>
                <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-4 px-6 rounded-lg transition duration-300 text-lg">
                    <i class="fas fa-search mr-2"></i>Search Destinations
                </button>
            </form>
        </div>
    </div>
</section>

<!-- Error/Success Messages -->
<c:if test="${not empty error or not empty success}">
    <section class="py-8">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <c:if test="${not empty error}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-4">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-circle mr-2"></i>
                        <span>${error}</span>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-4">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle mr-2"></i>
                        <span>${success}</span>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</c:if>

<!-- Search Results -->
<c:if test="${not empty places}">
    <section class="py-16 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold text-gray-800 mb-4">Search Results</h2>
                <p class="text-gray-600">
                    <c:choose>
                        <c:when test="${not empty param.keyword}">
                            Found ${places.size()} places matching "${param.keyword}"
                        </c:when>
                        <c:otherwise>
                            Found ${places.size()} places
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                <c:forEach var="place" items="${places}">
                    <div class="place-card bg-white rounded-xl shadow-lg overflow-hidden">
                        <div class="relative h-64">
                            <img src="${pageContext.request.contextPath}/${place.imageUrls[0]}"
                                 alt="${place.placeName}"
                                 class="w-full h-full object-cover">
                            <div class="absolute top-4 right-4 bg-white rounded-full px-3 py-1 shadow-md">
                                <span class="text-yellow-500 font-bold">
                                    <i class="fas fa-star"></i> ${place.averageRating}
                                </span>
                            </div>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-bold text-gray-800 mb-2">${place.placeName}</h3>
                            <p class="text-gray-600 mb-4 line-clamp-3">${place.description}</p>
                            <div class="flex justify-between items-center">
                                <div class="flex items-center text-gray-500">
                                    <i class="fas fa-map-marker-alt mr-1"></i>
                                    <span class="text-sm">${place.location}</span>
                                </div>
                                <a href="place-detail?id=${place.id}"
                                   class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full text-sm transition duration-300">
                                    View Details <i class="fas fa-arrow-right ml-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>

<!-- No Results -->
<c:if test="${empty places and not empty param.keyword}">
    <section class="py-16 bg-white">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <div class="bg-gray-50 rounded-xl p-12">
                <i class="fas fa-search text-gray-400 text-6xl mb-6"></i>
                <h3 class="text-2xl font-bold text-gray-800 mb-4">No Results Found</h3>
                <p class="text-gray-600 mb-6">
                    We couldn't find any places matching "${param.keyword}". Try searching with different keywords or check your spelling.
                </p>
                <div class="space-y-4">
                    <h4 class="font-semibold text-gray-800">Search Tips:</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li>• Try using different keywords</li>
                        <li>• Check your spelling</li>
                        <li>• Use more general terms</li>
                        <li>• Try searching for city names or landmarks</li>
                    </ul>
                </div>
                <a href="search" class="inline-block mt-6 bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-full transition duration-300">
                    Try New Search
                </a>
            </div>
        </div>
    </section>
</c:if>

<!-- Popular Categories (when no search performed) -->
<c:if test="${empty param.keyword}">
    <section class="py-16 bg-gray-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold text-gray-800 mb-4">Popular Categories</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">
                    Explore different types of places and discover your next adventure
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- Tourist Attractions -->
                <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                    <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-6">
                        <i class="fas fa-mountain text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Tourist Attractions</h3>
                    <p class="text-gray-600 mb-4">Discover breathtaking landmarks and scenic spots around the world.</p>
                    <a href="search?keyword=attraction" class="text-blue-600 font-medium flex items-center">
                        Explore Attractions <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>

                <!-- Restaurants -->
                <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                    <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-6">
                        <i class="fas fa-utensils text-green-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Restaurants</h3>
                    <p class="text-gray-600 mb-4">Find amazing dining experiences from local cuisine to fine dining.</p>
                    <a href="search?keyword=restaurant" class="text-blue-600 font-medium flex items-center">
                        Find Restaurants <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>

                <!-- Activities -->
                <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                    <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mb-6">
                        <i class="fas fa-skiing text-purple-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-3">Activities</h3>
                    <p class="text-gray-600 mb-4">Experience thrilling adventures and unique activities worldwide.</p>
                    <a href="search?keyword=activity" class="text-blue-600 font-medium flex items-center">
                        View Activities <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>
</c:if>

<!-- Newsletter Section -->
<section class="py-16 bg-blue-600 text-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl font-bold mb-4">Get Travel Inspiration</h2>
        <p class="text-xl mb-8">Subscribe to our newsletter for exclusive deals, travel tips, and destination guides</p>
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
                    <li><a href="home" class="text-gray-400 hover:text-white transition duration-300">Home</a></li>
                    <li><a href="search" class="text-gray-400 hover:text-white transition duration-300">Search</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">About Us</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Contact</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Services</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Flight Bookings</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Hotel Reservations</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Tour Packages</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Travel Insurance</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Support</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Help Center</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Terms & Conditions</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Privacy Policy</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Contact Us</a></li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2023 Wanderlust Adventures. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<button id="back-to-top" class="fixed bottom-8 right-8 w-12 h-12 bg-blue-600 text-white rounded-full shadow-lg flex items-center justify-center transition duration-300 opacity-0 invisible">
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

                // Close mobile menu if open
                if (!mobileMenu.classList.contains('hidden')) {
                    mobileMenu.classList.add('hidden');
                }
            }
        });
    });

    // Autofocus search input when page loads
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('keyword');
        if (searchInput && !searchInput.value) {
            searchInput.focus();
        }

        // Add animation to search results
        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animation = 'fadeInUp 0.6s ease forwards';
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });

        document.querySelectorAll('.place-card').forEach(card => {
            observer.observe(card);
        });
    });

    // CSS Animation keyframes
    const style = document.createElement('style');
    style.textContent = `
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

        .line-clamp-3 {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    `;
    document.head.appendChild(style);
</script>
</body>
</html>