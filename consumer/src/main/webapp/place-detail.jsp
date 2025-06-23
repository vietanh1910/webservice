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

        /* Responsive */
        @media (max-width: 768px) {
            .place-title {
                font-size: 2rem;
            }

            .place-header {
                padding: 1.5rem;
            }

            .gallery-header {
                padding: 1rem;
            }

            .modal-body {
                padding: 1.5rem;
            }

            .rating-stars-input label {
                font-size: 2rem;
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
        <div class="col-lg-12">
            <c:if test="${not empty images}">
                <div class="gallery-card fade-in-up">
                    <div class="gallery-header">
                        <i class="fas fa-images"></i>
                        <h5>Photo Gallery (${fn:length(images)} images)</h5>
                    </div>
                    <div class="p-4">
                        <div class="row">
                            <c:forEach var="image" items="${images}" varStatus="status">
                                <div class="col-lg-4 col-md-6">
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

            <!-- Rate This Place Section -->
            <c:if test="${sessionScope.token != null}">
                <div class="text-center mt-4 fade-in-up">
                    <button type="button" class="btn btn-primary btn-lg"
                            onclick="showRatingModal('place', 0, ${place.id})">
                        <i class="fas fa-star me-2"></i>
                        Rate This Destination
                    </button>
                </div>
            </c:if>
            <c:if test="${sessionScope.token == null}">
                <div class="text-center mt-4 fade-in-up">
                    <p class="text-muted mb-3">Want to share your experience?</p>
                    <a href="login" class="btn btn-primary btn-lg">
                        <i class="fas fa-sign-in-alt me-2"></i>
                        Login to Rate & Review
                    </a>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Rating Modal -->
<div class="modal fade" id="ratingModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-star me-2"></i>
                    Rate Your Experience
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="rating" method="post">
                <div class="modal-body">
                    <input type="hidden" name="placeId" value="${place.id}">
                    <input type="hidden" name="imageId" id="imageId">
                    <input type="hidden" name="infoId" id="infoId">

                    <div class="mb-4">
                        <label class="form-label">How would you rate this destination?</label>
                        <div class="rating-stars-input">
                            <input type="radio" name="rating" value="5" id="star5">
                            <label for="star5" class="star">★</label>
                            <input type="radio" name="rating" value="4" id="star4">
                            <label for="star4" class="star">★</label>
                            <input type="radio" name="rating" value="3" id="star3">
                            <label for="star3" class="star">★</label>
                            <input type="radio" name="rating" value="2" id="star2">
                            <label for="star2" class="star">★</label>
                            <input type="radio" name="rating" value="1" id="star1">
                            <label for="star1" class="star">★</label>
                        </div>
                        <small class="text-muted">Click on the stars to rate</small>
                    </div>

                    <div class="mb-3">
                        <label for="comment" class="form-label">
                            <i class="fas fa-comment me-2"></i>
                            Share your thoughts (optional)
                        </label>
                        <textarea class="form-control" name="comment" id="comment" rows="4"
                                  placeholder="Tell others about your experience at this amazing destination..."></textarea>
                    </div>

                    <div class="alert alert-info">
                        <i class="fas fa-info-circle me-2"></i>
                        <strong>Help other travelers!</strong> Your honest review helps others discover great places and experiences.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-paper-plane me-2"></i>Submit Review
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showRatingModal(type, id, placeId) {
        // Reset form
        document.getElementById('imageId').value = '';
        document.getElementById('infoId').value = '';

        // Reset radio buttons
        const radioButtons = document.querySelectorAll('input[name="rating"]');
        radioButtons.forEach(radio => radio.checked = false);

        // Reset comment
        document.getElementById('comment').value = '';

        // Set appropriate ID based on type
        if (type === 'image') {
            document.getElementById('imageId').value = id;
            document.querySelector('.modal-title').innerHTML = '<i class="fas fa-camera me-2"></i>Rate This Photo';
        } else if (type === 'info') {
            document.getElementById('infoId').value = id;
        } else {
            document.querySelector('.modal-title').innerHTML = '<i class="fas fa-star me-2"></i>Rate Your Experience';
        }

        // Show modal
        var modal = new bootstrap.Modal(document.getElementById('ratingModal'));
        modal.show();
    }

    // Add smooth scroll behavior
    document.documentElement.style.scrollBehavior = 'smooth';

    // Add loading state simulation for images
    document.addEventListener('DOMContentLoaded', function() {
        const images = document.querySelectorAll('.image-item img');
        images.forEach((img, index) => {
            img.addEventListener('load', function() {
                this.style.opacity = '0';
                this.style.transition = 'opacity 0.5s ease';
                setTimeout(() => {
                    this.style.opacity = '1';
                }, index * 100); // Stagger the loading animation
            });
        });

        // Add intersection observer for fade-in animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        // Observe fade-in elements
        document.querySelectorAll('.fade-in-up').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(30px)';
            el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(el);
        });
    });

    // Add hover effects for image items
    document.querySelectorAll('.image-item').forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px) scale(1.02)';
        });

        item.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Enhanced star rating interaction
    document.querySelectorAll('.rating-stars-input label').forEach(label => {
        label.addEventListener('mouseenter', function() {
            const value = this.getAttribute('for').replace('star', '');
            const allLabels = document.querySelectorAll('.rating-stars-input label');
            allLabels.forEach((l, index) => {
                if (index >= (5 - value)) {
                    l.style.color = '#fbbf24';
                    l.style.transform = 'scale(1.1)';
                } else {
                    l.style.color = '#e5e7eb';
                    l.style.transform = 'scale(1)';
                }
            });
        });
    });

    document.querySelector('.rating-stars-input').addEventListener('mouseleave', function() {
        const checkedInput = document.querySelector('input[name="rating"]:checked');
        const allLabels = document.querySelectorAll('.rating-stars-input label');

        if (checkedInput) {
            const checkedValue = checkedInput.value;
            allLabels.forEach((l, index) => {
                if (index >= (5 - checkedValue)) {
                    l.style.color = '#fbbf24';
                    l.style.transform = 'scale(1)';
                } else {
                    l.style.color = '#e5e7eb';
                    l.style.transform = 'scale(1)';
                }
            });
        } else {
            allLabels.forEach(l => {
                l.style.color = '#e5e7eb';
                l.style.transform = 'scale(1)';
            });
        }
    });
</script>
</body>
</html>