<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${place.placeName} - Travel Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary-color: #64748b;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --warning-color: #f59e0b;
            --info-color: #06b6d4;
            --light-bg: #f8fafc;
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --card-shadow-hover: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --border-radius: 12px;
            --gradient-bg: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--light-bg);
            color: #1e293b;
        }

        /* Navigation Styles */
        .navbar {
            background: var(--gradient-bg) !important;
            padding: 1rem 0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand i {
            font-size: 1.8rem;
            color: #fbbf24;
        }

        .nav-link {
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 8px;
            padding: 0.5rem 1rem !important;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-1px);
        }

        /* Breadcrumb Styles */
        .breadcrumb {
            background: white;
            border-radius: var(--border-radius);
            padding: 1rem 1.5rem;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
        }

        .breadcrumb-item a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb-item a:hover {
            color: var(--primary-dark);
        }

        .breadcrumb-item.active {
            color: var(--secondary-color);
        }

        /* Place Header Styles */
        .place-header {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--card-shadow);
            border-left: 4px solid var(--primary-color);
            position: relative;
            overflow: hidden;
        }

        .place-header::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border-radius: 50%;
            transform: translate(30px, -30px);
        }

        .place-title {
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
            font-size: 2.5rem;
        }

        .place-address {
            color: var(--secondary-color);
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .place-address i {
            color: var(--primary-color);
        }

        .place-description {
            color: #374151;
            line-height: 1.7;
            font-size: 1.1rem;
        }

        /* Rating Styles */
        .rating-section {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            color: white;
            text-align: center;
        }

        .rating-stars {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .rating-value {
            font-size: 1.2rem;
            font-weight: 600;
        }

        /* Image Gallery Styles */
        .gallery-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .gallery-header {
            background: var(--gradient-bg);
            color: white;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .gallery-header i {
            font-size: 1.5rem;
        }

        .gallery-header h5 {
            margin: 0;
            font-weight: 600;
        }

        .image-item {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .image-item:hover {
            transform: translateY(-4px);
            box-shadow: var(--card-shadow-hover);
        }

        .image-item img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .image-item:hover img {
            transform: scale(1.05);
        }

        .image-caption {
            padding: 1.5rem;
            background: #f8fafc;
        }

        .image-caption p {
            margin: 0;
            color: var(--secondary-color);
            font-size: 0.9rem;
        }

        /* Reviews Section Styles */
        .reviews-section {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .reviews-header {
            background: var(--gradient-bg);
            color: white;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .reviews-summary {
            background: #f8fafc;
            padding: 2rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .rating-overview {
            display: flex;
            align-items: center;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .rating-display {
            text-align: center;
        }

        .rating-display .rating-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--primary-color);
            line-height: 1;
        }

        .rating-breakdown {
            flex: 1;
        }

        .rating-row {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.5rem;
        }

        .star-label {
            min-width: 60px;
            font-size: 0.9rem;
            color: var(--secondary-color);
        }

        .rating-bar {
            flex: 1;
            height: 8px;
            background: #e5e7eb;
            border-radius: 4px;
            overflow: hidden;
        }

        .rating-fill {
            height: 100%;
            background: linear-gradient(90deg, #fbbf24, #f59e0b);
            transition: width 0.8s ease;
        }

        .rating-count {
            min-width: 40px;
            font-size: 0.9rem;
            color: var(--secondary-color);
        }

        .review-item {
            padding: 2rem;
            border-bottom: 1px solid #e2e8f0;
            transition: background-color 0.3s ease;
        }

        .review-item:last-child {
            border-bottom: none;
        }

        .review-item:hover {
            background-color: #f8fafc;
        }

        .review-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .reviewer-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--gradient-bg);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
        }

        .reviewer-info {
            flex: 1;
        }

        .reviewer-name {
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.25rem;
        }

        .review-date {
            color: var(--secondary-color);
            font-size: 0.9rem;
        }

        .review-rating {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .review-stars {
            color: #fbbf24;
        }

        .review-content {
            color: #374151;
            line-height: 1.7;
            margin-bottom: 1rem;
        }

        .review-actions {
            display: flex;
            gap: 1rem;
        }

        .review-action-btn {
            background: none;
            border: none;
            color: var(--secondary-color);
            font-size: 0.9rem;
            cursor: pointer;
            transition: color 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .review-action-btn:hover {
            color: var(--primary-color);
        }

        .review-action-btn.active {
            color: var(--primary-color);
        }

        /* Write Review Section */
        .write-review-section {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .write-review-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e2e8f0;
        }

        .write-review-header i {
            color: var(--primary-color);
            font-size: 1.5rem;
        }

        .write-review-header h4 {
            margin: 0;
            color: #1e293b;
        }

        /* Button Styles */
        .btn {
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            padding: 0.6rem 1.2rem;
        }

        .btn-primary {
            background: var(--gradient-bg);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .btn-success:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
        }

        .btn-warning {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(251, 191, 36, 0.4);
            color: white;
        }

        /* Modal Improvements */
        .modal-content {
            border-radius: var(--border-radius);
            border: none;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .modal-header {
            background: var(--gradient-bg);
            color: white;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            border-bottom: none;
            padding: 1.5rem;
        }

        .modal-header .btn-close {
            filter: invert(1);
        }

        .modal-body {
            padding: 2rem;
        }

        .modal-footer {
            padding: 1.5rem 2rem;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
        }

        /* Rating Stars in Modal */
        .rating-stars-input {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
            gap: 0.25rem;
            margin-bottom: 1rem;
        }

        .rating-stars-input input[type="radio"] {
            display: none;
        }

        .rating-stars-input label {
            cursor: pointer;
            font-size: 2.5rem;
            color: #e5e7eb;
            transition: all 0.3s ease;
        }

        .rating-stars-input label:hover,
        .rating-stars-input label:hover ~ label,
        .rating-stars-input input[type="radio"]:checked ~ label {
            color: #fbbf24;
            transform: scale(1.1);
        }

        /* Form Styles */
        .form-label {
            font-weight: 600;
            color: #374151;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #e5e7eb;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        /* Empty State */
        .empty-state {
            background: white;
            border-radius: var(--border-radius);
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            border: 2px dashed #cbd5e1;
        }

        .empty-state i {
            color: #cbd5e1;
            margin-bottom: 1.5rem;
        }

        .empty-state h4 {
            color: #64748b;
            margin-bottom: 1rem;
        }

        .no-reviews {
            text-align: center;
            padding: 3rem 2rem;
            color: var(--secondary-color);
        }

        .no-reviews i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #cbd5e1;
        }

        /* Animations */
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

        .fade-in-up {
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .slide-in-right {
            animation: slideInRight 0.6s ease-out;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .place-title {
                font-size: 2rem;
            }

            .place-header {
                padding: 1.5rem;
            }

            .gallery-header, .reviews-header {
                padding: 1rem;
            }

            .modal-body {
                padding: 1.5rem;
            }

            .rating-stars-input label {
                font-size: 2rem;
            }

            .rating-overview {
                flex-direction: column;
                gap: 1rem;
            }

            .rating-display .rating-number {
                font-size: 2.5rem;
            }

            .review-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .review-rating {
                margin-top: 0.5rem;
            }
        }

        /* Loading Animation */
        .loading-placeholder {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        /* Micro-interactions */
        .image-item .btn:hover {
            transform: scale(1.05);
        }

        .review-item {
            transform: translateX(0);
            transition: all 0.3s ease;
        }

        .review-item:hover {
            transform: translateX(5px);
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="search.jsp">
            <i class="fas fa-compass"></i>
            <span>TravelGuide Pro</span>
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="search">
                <i class="fas fa-search me-1"></i> Search
            </a>
            <c:choose>
                <c:when test="${sessionScope.token != null}">
                    <a class="nav-link" href="logout">
                        <i class="fas fa-sign-out-alt me-1"></i> Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link" href="login">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="fade-in-up">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="search">
                    <i class="fas fa-home me-1"></i> Search
                </a>
            </li>
            <li class="breadcrumb-item active">
                <i class="fas fa-map-marker-alt me-1"></i> ${place.placeName}
            </li>
        </ol>
    </nav>

    <!-- Place Header -->
    <div class="place-header fade-in-up">
        <div class="row align-items-center">
            <div class="col-lg-8">
                <h1 class="place-title">${place.placeName}</h1>
                <div class="place-address">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>${place.address}</span>
                </div>
                <p class="place-description">${place.description}</p>
            </div>
            <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                <c:if test="${place.averageRating > 0}">
                    <div class="rating-section">
                        <div class="rating-stars">
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
                        <div class="rating-value">
                            <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/> / 5.0
                        </div>
                        <div class="text-sm opacity-75">
                            Based on ${place.totalRatings} reviews
                        </div>
                    </div>
                </c:if>
                <c:if test="${place.averageRating <= 0}">
                    <div class="rating-section">
                        <div class="rating-stars">
                            <c:forEach begin="1" end="5" var="star">
                                <i class="far fa-star"></i>
                            </c:forEach>
                        </div>
                        <div class="rating-value">No ratings yet</div>
                        <div class="text-sm opacity-75">Be the first to rate!</div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Images Section -->
        <div class="col-lg-8">
            <c:if test="${not empty images}">
                <div class="gallery-card fade-in-up">
                    <div class="gallery-header">
                        <i class="fas fa-images"></i>
                        <h5>Photo Gallery (${fn:length(images)} images)</h5>
                    </div>
                    <div class="p-4">
                        <div class="row">
                            <c:forEach var="image" items="${images}" varStatus="status">
                                <div class="col-lg-6 col-md-12">
                                    <div class="image-item">
                                        <img src="${image}" alt="Image ${status.index + 1} of ${place.placeName}">
                                        <div class="image-caption">
                                            <p>
                                                <i class="fas fa-camera me-2"></i>
                                                Photo ${status.index + 1} - ${place.placeName}
                                            </p>
                                            <div class="d-flex justify-content-between align-items-center mt-2">
                                                <small class="text-muted">
                                                    <i class="fas fa-eye me-1"></i>
                                                    High Quality
                                                </small>
                                                <c:if test="${sessionScope.token != null}">
                                                    <button type="button" class="btn btn-warning btn-sm"
                                                            onclick="showRatingModal('image', ${status.index}, ${place.id})">
                                                        <i class="fas fa-star me-1"></i> Rate
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
                <div class="empty-state fade-in-up">
                    <i class="fas fa-camera fa-5x"></i>
                    <h4>No Photos Available</h4>
                    <p class="text-muted mb-4">This destination doesn't have any photos yet. Check back later for stunning visuals!</p>
                </div>
            </c:if>
        </div>

        <!-- Reviews Section -->
        <div class="col-lg-4">
            <!-- Write Review Section (for logged in users) -->
            <c:if test="${sessionScope.token != null}">
                <div class="write-review-section fade-in-up slide-in-right">
                    <div class="write-review-header">
                        <i class="fas fa-pen"></i>
                        <h4>Share Your Experience</h4>
                    </div>
                    <button type="button" class="btn btn-primary w-100 mb-3"
                            onclick="showRatingModal('place', 0, ${place.id})">
                        <i class="fas fa-star me-2"></i>
                        Write a Review
                    </button>
                    <p class="text-muted text-center mb-0">
                        <small>Help other travelers discover this amazing place!</small>
                    </p>
                </div>
            </c:if>

            <!-- Login Prompt for non-logged users -->
            <c:if test="${sessionScope.token == null}">
                <div class="write-review-section fade-in-up slide-in-right">
                    <div class="write-review-header">
                        <i class="fas fa-sign-in-alt"></i>
                        <h4>Join the Community</h4>
                    </div>
                    <p class="text-muted mb-3">Want to share your experience and help other travelers?</p>
                    <a href="login" class="btn btn-primary w-100">
                        <i class="fas fa-sign-in-alt me-2"></i>
                        Login to Write Review
                    </a>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Reviews Section -->
    <div class="reviews-section fade-in-up">
        <div class="reviews-header">
            <i class="fas fa-comments"></i>
            <h5>Reviews & Ratings</h5>
        </div>

        <!-- Reviews Summary -->
        <c:if test="${place.totalRatings > 0}">
        <div class="reviews-summary">
            <div class="rating-overview">
                <div class="rating-display">
                    <div class="rating-number">
                        <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>
                    </div>
                    <div class="rating-stars mb-2">
                        <c:forEach begin="1" end="5" var="star">
                            <c:choose>
                                <c:when test="${star <= place.averageRating}">
                                    <i class="fas fa-star" style="color: #fbbf24;"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="far fa-star" style="color: #fbbf24;"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="text-muted">
                        Based on ${place.totalRatings} reviews
                    </div>
                </div>
                <div class="rating-breakdown">
                    <!-- Simulated rating breakdown - you can replace with actual data -->
                    <div class="rating-row">
                        <span class="star-label">5 stars</span>
                        <div class="rating-bar">
                            <div class="rating-fill" style="width: 60%;"></div>
                        </div>
                        <span class="rating-count">12</span>
                    </div>
                    <div class="rating-row">
                        <span class="star-label">4 stars</span>
                        <div class="rating-bar">
                            <div class="rating-fill" style="width: 25%;"></div>
                        </div>
                        <span class="rating-count">5</span>
                    </div>
                    <div class="rating-row">
                        <span class="star-label">3 stars</span>
                        <div class="rating-bar">
                            <div class="rating-fill" style="width: 10%;"></div>
                        </div>
                        <span class="rating-count">2</span>
                    </div>
                    <div class="rating-row">
                        <span class="star-label">2 stars</span>
                        <div class="rating-bar">
                            <div class="rating-fill" style="width: 3%;"></div>
                            </div>
                                                    <span class="rating-count">1</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>

                                    <!-- No Reviews State -->
                                    <c:if test="${place.totalRatings == 0}">
                                        <div class="no-reviews fade-in-up">
                                            <i class="fas fa-comments fa-5x"></i>
                                            <h4>No Reviews Yet</h4>
                                            <p class="text-muted mb-4">Be the first to share your experience about this destination!</p>
                                        </div>
                                    </c:if>

                                    <!-- Reviews List -->
                                    <c:if test="${not empty reviews}">
                                        <div class="p-4">
                                            <c:forEach var="review" items="${reviews}">
                                                <div class="review-item fade-in-up">
                                                    <div class="review-header">
                                                        <div class="reviewer-avatar">
                                                            <c:choose>
                                                                <c:when test="${not empty review.userAvatar}">
                                                                    <img src="${review.userAvatar}" alt="${review.userName}" class="img-fluid rounded-circle">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>${review.userName.substring(0, 1)}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="reviewer-info">
                                                            <div class="reviewer-name">${review.userName}</div>
                                                            <div class="review-date">
                                                                <fmt:formatDate value="${review.date}" pattern="MMM dd, yyyy"/>
                                                            </div>
                                                        </div>
                                                        <div class="review-rating">
                                                            <c:forEach begin="1" end="5" var="star">
                                                                <c:choose>
                                                                    <c:when test="${star <= review.rating}">
                                                                        <i class="fas fa-star"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="far fa-star"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="review-content">${review.content}</div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Footer -->
                            <footer class="mt-5">
                                <div class="text-center py-4">
                                    <p>&copy; 2023 TravelGuide Pro. All rights reserved.</p>
                                </div>
                            </footer>

                            <!-- Scripts -->
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                            <script>
                                function showRatingModal(type, index, placeId) {
                                    // Logic for showing rating modal
                                    console.log(`Show rating modal for ${type}, index: ${index}, placeId: ${placeId}`);
                                }
                            </script>
                            </body>
                            </html>