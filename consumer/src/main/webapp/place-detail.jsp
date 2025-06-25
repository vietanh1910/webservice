<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String token = (String) session.getAttribute("token");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${place.placeName} | Wanderlust Adventures</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('${pageContext.request.contextPath}/${place.imageUrls[0]}');
            background-size: cover;
            background-position: center;
            height: 60vh;
        }

        .gallery-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .review-card {
            transition: all 0.3s ease;
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .rating-star {
            color: #fbbf24;
            transition: color 0.2s ease;
        }

        .rating-star:hover {
            color: #f59e0b;
        }

        .rating-breakdown-bar {
            background: #e5e7eb;
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
        }

        .rating-fill {
            background: linear-gradient(90deg, #fbbf24, #f59e0b);
            height: 100%;
            transition: width 0.5s ease;
        }

        .fade-in {
            animation: fadeIn 0.6s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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
                    <span class="text-xl font-bold text-blue-600">Wanderlust</span>
                </div>
            </div>
            <div class="hidden md:flex items-center space-x-8">
                <a href="home" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Home</a>
                <a href="search" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">
                    <i class="fas fa-search mr-1"></i> Search
                </a>
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
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section flex items-center justify-center text-white relative">
    <div class="absolute inset-0 bg-black opacity-40"></div>
    <div class="relative text-center px-4 z-10">
        <nav class="mb-6">
            <ol class="flex justify-center space-x-2 text-sm text-gray-200">
                <li><a href="search" class="hover:text-white transition duration-300">
                    <i class="fas fa-home mr-1"></i> Search
                </a></li>
                <li class="text-gray-300">/</li>
                <li class="text-white">
                    <i class="fas fa-map-marker-alt mr-1"></i> ${place.placeName}
                </li>
            </ol>
        </nav>
        <h1 class="text-4xl md:text-6xl font-bold mb-4">${place.placeName}</h1>
        <p class="text-xl md:text-2xl mb-2">
            <i class="fas fa-map-marker-alt mr-2"></i>${place.address}
        </p>
        <c:if test="${place.averageRating > 0}">
            <div class="flex justify-center items-center space-x-2 text-lg">
                <div class="flex">
                    <c:forEach begin="1" end="5" var="star">
                        <c:choose>
                            <c:when test="${star <= place.averageRating}">
                                <i class="fas fa-star text-yellow-400"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="far fa-star text-yellow-400"></i>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <span><fmt:formatNumber value="${place.averageRating}" pattern="0.0"/> / 5.0</span>
                <span class="text-gray-300">(${place.totalRatings} reviews)</span>
            </div>
        </c:if>
    </div>
</section>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <!-- Description Section -->
    <div class="bg-white rounded-xl shadow-lg p-8 mb-8 fade-in">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">About This Destination</h2>
        <p class="text-gray-600 text-lg leading-relaxed">${place.description}</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Photo Gallery -->
        <div class="lg:col-span-2">
            <c:if test="${not empty images}">
                <div class="bg-white rounded-xl shadow-lg overflow-hidden fade-in">
                    <div class="bg-gradient-to-r from-blue-600 to-blue-700 text-white p-6">
                        <h3 class="text-xl font-bold flex items-center">
                            <i class="fas fa-images mr-3"></i>
                            Photo Gallery (${fn:length(images)} images)
                        </h3>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <c:forEach var="image" items="${images}" varStatus="status">
                                <div class="gallery-card relative group overflow-hidden rounded-lg shadow-md transition duration-300">
                                    <img src="${image}" alt="Image ${status.index + 1} of ${place.placeName}"
                                         class="w-full h-64 object-cover group-hover:scale-105 transition duration-300">
                                    <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent opacity-0 group-hover:opacity-100 transition duration-300">
                                        <div class="absolute bottom-0 left-0 right-0 p-4 text-white">
                                            <p class="font-medium mb-2">
                                                <i class="fas fa-camera mr-2"></i>
                                                Photo ${status.index + 1} - ${place.placeName}
                                            </p>
                                            <div class="flex justify-between items-center">
                                                <small class="text-gray-200">
                                                    <i class="fas fa-eye mr-1"></i>
                                                    High Quality
                                                </small>
                                                <c:if test="${sessionScope.token != null}">
                                                    <button type="button" class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-full text-sm transition duration-300"
                                                            onclick="showRatingModal('image', ${status.index}, ${place.id})">
                                                        <i class="fas fa-star mr-1"></i> Rate
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Empty State for Images -->
            <c:if test="${empty images}">
                <div class="bg-white rounded-xl shadow-lg p-12 text-center fade-in">
                    <i class="fas fa-camera text-gray-300 text-6xl mb-4"></i>
                    <h4 class="text-xl font-bold text-gray-600 mb-2">No Photos Available</h4>
                    <p class="text-gray-500">This destination doesn't have any photos yet. Check back later for stunning visuals!</p>
                </div>
            </c:if>
        </div>

        <!-- Reviews Sidebar -->
        <div class="lg:col-span-1">
            <!-- Write Review Section -->
            <c:if test="${sessionScope.user != null and sessionScope.user.role == 2}">
                <div class="bg-white rounded-xl shadow-lg p-6 mb-8 fade-in">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-pen text-blue-600 text-xl"></i>
                        </div>
                        <h4 class="text-lg font-bold text-gray-800 mb-2">Share Your Experience</h4>
                        <p class="text-gray-600 text-sm mb-4">Help other travelers discover this amazing place!</p>
                        <button type="button" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-full transition duration-300"
                                onclick="showReviewModal(${place.id})">
                            <i class="fas fa-star mr-2"></i>
                            Write a Review
                        </button>
                    </div>
                </div>
            </c:if>

            <!-- Login Prompt -->
            <c:if test="${sessionScope.user == null or sessionScope.user.role != 2}">
            <div class="bg-white rounded-xl shadow-lg p-6 mb-8 fade-in">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-sign-in-alt text-blue-600 text-xl"></i>
                        </div>
                        <h4 class="text-lg font-bold text-gray-800 mb-2">Join the Community</h4>
                        <p class="text-gray-600 text-sm mb-4">Want to share your experience and help other travelers?</p>
                        <a href="login" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-full inline-block text-center transition duration-300">
                            <i class="fas fa-sign-in-alt mr-2"></i>
                            Login to Write Review
                        </a>
                    </div>
                </div>
            </c:if>

            <!-- Rating Summary -->
            <c:if test="${place.totalRatings > 0}">
                <div class="bg-white rounded-xl shadow-lg p-6 fade-in">
                    <h4 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                        <i class="fas fa-chart-bar mr-2 text-blue-600"></i>
                        Rating Summary
                    </h4>
                    <div class="text-center mb-6">
                        <div class="text-4xl font-bold text-blue-600 mb-2">
                            <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>
                        </div>
                        <div class="flex justify-center mb-2">
                            <c:forEach begin="1" end="5" var="star">
                                <c:choose>
                                    <c:when test="${star <= place.averageRating}">
                                        <i class="fas fa-star text-yellow-400 text-lg"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="far fa-star text-yellow-400 text-lg"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <p class="text-gray-600">Based on ${place.totalRatings} reviews</p>
                    </div>

                    <!-- Rating Breakdown -->
                    <div class="space-y-3">
                        <div class="flex items-center">
                            <span class="text-sm font-medium text-gray-700 w-12">5 star</span>
                            <div class="rating-breakdown-bar flex-1 mx-3">
                                <div class="rating-fill" style="width: 60%;"></div>
                            </div>
                            <span class="text-sm text-gray-600 w-8">12</span>
                        </div>
                        <div class="flex items-center">
                            <span class="text-sm font-medium text-gray-700 w-12">4 star</span>
                            <div class="rating-breakdown-bar flex-1 mx-3">
                                <div class="rating-fill" style="width: 25%;"></div>
                            </div>
                            <span class="text-sm text-gray-600 w-8">5</span>
                        </div>
                        <div class="flex items-center">
                            <span class="text-sm font-medium text-gray-700 w-12">3 star</span>
                            <div class="rating-breakdown-bar flex-1 mx-3">
                                <div class="rating-fill" style="width: 10%;"></div>
                            </div>
                            <span class="text-sm text-gray-600 w-8">2</span>
                        </div>
                        <div class="flex items-center">
                            <span class="text-sm font-medium text-gray-700 w-12">2 star</span>
                            <div class="rating-breakdown-bar flex-1 mx-3">
                                <div class="rating-fill" style="width: 3%;"></div>
                            </div>
                            <span class="text-sm text-gray-600 w-8">1</span>
                        </div>
                        <div class="flex items-center">
                            <span class="text-sm font-medium text-gray-700 w-12">1 star</span>
                            <div class="rating-breakdown-bar flex-1 mx-3">
                                <div class="rating-fill" style="width: 2%;"></div>
                            </div>
                            <span class="text-sm text-gray-600 w-8">0</span>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Reviews Section -->
    <div class="mt-12">
        <div class="bg-white rounded-xl shadow-lg overflow-hidden fade-in">
            <div class="bg-gradient-to-r from-blue-600 to-blue-700 text-white p-6">
                <h3 class="text-xl font-bold flex items-center">
                    <i class="fas fa-comments mr-3"></i>
                    Reviews & Ratings
                </h3>
            </div>

            <!-- No Reviews State -->
            <c:if test="${empty reviews}">
                <div class="p-12 text-center">
                    <i class="fas fa-comments text-gray-300 text-6xl mb-4"></i>
                    <h4 class="text-xl font-bold text-gray-600 mb-2">No Reviews Yet</h4>
                    <p class="text-gray-500 mb-6">Be the first to share your experience about this destination!</p>
                    <c:choose>
                        <c:when test="${sessionScope.user != null and sessionScope.user.role == 2}">
                            <button type="button" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-full transition duration-300"
                                    onclick="showReviewModal(${place.id})">
                                <i class="fas fa-star mr-2"></i>
                                Write First Review
                            </button>
                        </c:when>
                    </c:choose>
                </div>
            </c:if>

            <!-- Reviews List -->
            <c:if test="${not empty reviews}">
                <div class="p-6 space-y-6">
                    <c:forEach var="review" items="${reviews}">
                        <div class="review-card border border-gray-200 rounded-lg p-6">
                            <div class="flex items-start space-x-4">
                                <div class="flex-shrink-0">
                                    <c:choose>
                                        <c:when test="${not empty review.userAvatar}">
                                            <img src="${review.userAvatar}" alt="${review.userName}"
                                                 class="w-12 h-12 rounded-full object-cover">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="w-12 h-12 bg-blue-500 rounded-full flex items-center justify-center text-white font-bold text-lg">
                                                    ${review.userName.substring(0, 1)}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="flex-1 min-w-0">
                                    <div class="flex items-center justify-between mb-2">
                                        <div>
                                            <h5 class="font-bold text-gray-800">${review.userName}</h5>
                                            <p class="text-sm text-gray-500">
                                                <fmt:formatDate value="${review.date}" pattern="MMM dd, yyyy"/>
                                            </p>
                                        </div>
                                        <div class="flex">
                                            <c:forEach begin="1" end="5" var="star">
                                                <c:choose>
                                                    <c:when test="${star <= review.rating}">
                                                        <i class="fas fa-star text-yellow-400"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="far fa-star text-yellow-400"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <p class="text-gray-700 leading-relaxed">${review.content}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Review Modal -->
<div id="reviewModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
    <div class="bg-white rounded-xl shadow-2xl p-8 max-w-md w-full mx-4">
        <div class="text-center mb-6">
            <h3 class="text-xl font-bold text-gray-800 mb-2">Rate & Review</h3>
            <p class="text-gray-600">${place.placeName}</p>
        </div>
        <form id="reviewForm" method="post" action="submit-rating">
            <input type="hidden" id="placeId" value="${place.id}">

            <!-- Star Rating -->
            <div class="mb-6">
                <label class="block text-gray-700 font-medium mb-3">Your Rating</label>
                <div class="flex justify-center space-x-2">
                    <c:forEach begin="1" end="5" var="star">
                        <button type="button" class="rating-star text-3xl text-gray-300 hover:text-yellow-400 transition duration-200"
                                onclick="setRating(${star})">
                            <i class="far fa-star"></i>
                        </button>
                    </c:forEach>
                </div>
            </div>

            <!-- Comment -->
            <div class="mb-6">
                <label for="reviewComment" class="block text-gray-700 font-medium mb-2">Your Experience</label>
                <textarea id="reviewComment" rows="4"
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                          placeholder="Share your experience about this destination..."></textarea>
            </div>

            <!-- Buttons -->
            <div class="flex space-x-4">
                <button type="button" onclick="closeReviewModal()"
                        class="flex-1 bg-gray-300 hover:bg-gray-400 text-gray-700 font-bold py-3 px-4 rounded-lg transition duration-300">
                    Cancel
                </button>
                <button type="submit"
                        class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition duration-300">
                    Submit Review
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12 mt-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <div class="flex items-center mb-4">
                    <i class="fas fa-plane-departure text-blue-400 text-2xl mr-2"></i>
                    <span class="text-xl font-bold">Wanderlust</span>
                </div>
                <p class="text-gray-400 mb-4">Making travel dreams come true since 2010.</p>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="/" class="text-gray-400 hover:text-white transition duration-300">Home</a></li>
                    <li><a href="search" class="text-gray-400 hover:text-white transition duration-300">Search</a></li>
                    <li><a href="places" class="text-gray-400 hover:text-white transition duration-300">Destinations</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Support</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Help Center</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Contact Us</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Privacy Policy</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-lg font-semibold mb-4">Follow Us</h4>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-facebook-f text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-instagram text-xl"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2023 Wanderlust Adventures. All rights reserved.</p>
        </div>
    </div>
</footer>

<script>
    let selectedRating = 0;

    function showReviewModal(placeId) {
        document.getElementById('placeId').value = placeId;
        document.getElementById('reviewModal').classList.remove('hidden');
        selectedRating = 0;
        resetStars();
    }

    function closeReviewModal() {
        document.getElementById('reviewModal').classList.add('hidden');
        document.getElementById('reviewForm').reset();
        selectedRating = 0;
        resetStars();
    }

    function setRating(rating) {
        selectedRating = rating;
        const stars = document.querySelectorAll('.rating-star i');
        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.remove('far');
                star.classList.add('fas');
                star.parentElement.classList.add('text-yellow-400');
                star.parentElement.classList.remove('text-gray-300');
            } else {
                star.classList.remove('fas');
                star.classList.add('far');
                star.parentElement.classList.add('text-gray-300');
                star.parentElement.classList.remove('text-yellow-400');
            }
        });
    }

    function resetStars() {
        const stars = document.querySelectorAll('.rating-star i');
        stars.forEach(star => {
            star.classList.remove('fas');
            star.classList.add('far');
            star.parentElement.classList.add('text-gray-300');
            star.parentElement.classList.remove('text-yellow-400');
        });
    }

    function showRatingModal(type, index, placeId) {
        // Logic for rating images specifically
        console.log(`Show rating modal for ${type}, index: ${index}, placeId: ${placeId}`);
        // You can implement specific image rating logic here
        showReviewModal(placeId);
    }

    // Handle review form submission
    document.getElementById('reviewForm').addEventListener('submit', function (e) {
        e.preventDefault();

        if (selectedRating === 0) {
            alert('Please select a rating before submitting your review.');
            return;
        }

        const formData = new URLSearchParams();
        formData.append('placeId', document.getElementById('placeId').value);
        formData.append('rating', selectedRating);
        formData.append('comment', document.getElementById('reviewComment').value);

        const basePath = window.location.pathname.replace(/\/[^/]+$/, '');

        fetch(`${basePath}/submit-rating`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    alert('Thank you for your review! It will be displayed after approval.');
                    closeReviewModal();
                    window.location.reload();
                    // Optionally: reload or update reviews section
                } else if (response.status === 401) {
                    alert('You are not authorized to submit a review.');
                } else {
                    alert('Something went wrong. Please try again later.');
                }
            })
            .catch(error => {
                console.error('Error submitting review:', error);
                alert('Error connecting to server.');
            });
    });


    // Close modal when clicking outside
    document.getElementById('reviewModal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeReviewModal();
        }
    });

    // Add fade-in animation on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in');
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in').forEach(el => {
        observer.observe(el);
    });
</script>
</body>
</html>