<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:10 PM
  Modern Travel Service Search Results Page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - TravelExplorer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #06b6d4;
            --accent-color: #f59e0b;
            --text-dark: #1f2937;
            --text-light: #6b7280;
            --bg-light: #f8fafc;
            --gradient-primary: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        * {
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--bg-light);
            color: var(--text-dark);
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color) !important;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 25px;
            padding: 8px 16px !important;
            margin: 0 4px;
        }

        .nav-link:hover {
            background: var(--gradient-primary);
            color: white !important;
            transform: translateY(-2px);
        }

        .search-summary {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin: 2rem 0;
            border: 1px solid rgba(37, 99, 235, 0.1);
        }

        .search-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .search-keyword {
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
        }

        .category-badge {
            background: var(--gradient-primary);
            color: white;
            padding: 6px 16px;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .results-count {
            color: var(--text-light);
            font-size: 1.1rem;
        }

        .place-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.4s ease;
            overflow: hidden;
            height: 100%;
        }

        .place-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .place-image {
            height: 220px;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .place-card:hover .place-image {
            transform: scale(1.05);
        }

        .place-card-body {
            padding: 1.5rem;
        }

        .place-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.8rem;
            line-height: 1.3;
        }

        .place-address {
            color: var(--text-light);
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .place-description {
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .place-meta {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .place-category {
            background: linear-gradient(135deg, #e0f2fe 0%, #b3e5fc 100%);
            color: #0277bd;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .rating-section {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .stars {
            color: #fbbf24;
            font-size: 0.9rem;
        }

        .rating-text {
            color: var(--text-light);
            font-size: 0.9rem;
            font-weight: 500;
        }

        .card-footer {
            background: rgba(248, 250, 252, 0.8);
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            padding: 1.2rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-view-detail {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 25px;
            padding: 10px 24px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-view-detail:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
        }

        .place-date {
            color: var(--text-light);
            font-size: 0.85rem;
        }

        .no-results {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .no-results-icon {
            font-size: 4rem;
            color: var(--text-light);
            margin-bottom: 1.5rem;
        }

        .no-results-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }

        .no-results-text {
            color: var(--text-light);
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .btn-search-again {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-search-again:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
        }

        .search-actions {
            text-align: center;
            margin-top: 3rem;
            padding: 2rem;
        }

        @media (max-width: 768px) {
            .search-summary {
                padding: 1.5rem;
                margin: 1.5rem 0;
            }

            .search-title {
                font-size: 1.5rem;
            }

            .place-card-body {
                padding: 1.2rem;
            }

            .card-footer {
                flex-direction: column;
                gap: 1rem;
                align-items: stretch;
            }
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
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">
            <i class="fas fa-compass me-2"></i>TravelExplorer
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="search">
                    <i class="fas fa-search me-1"></i>Search
                </a>
                <c:choose>
                    <c:when test="${sessionScope.token != null}">
                        <a class="nav-link" href="logout">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="login">
                            <i class="fas fa-sign-in-alt me-1"></i>Login
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Search Summary -->
    <div class="search-summary fade-in">
        <h2 class="search-title">
            Search results for: "<span class="search-keyword">${keyword}</span>"
        </h2>
        <div class="d-flex flex-wrap align-items-center gap-3 mb-3">
            <c:if test="${not empty category}">
                    <span class="category-badge">
                        <i class="fas fa-tag"></i>
                        Category: ${category}
                    </span>
            </c:if>
            <span class="results-count">
                    <i class="fas fa-map-marked-alt me-1"></i>
                    Found ${places.size()} amazing places
                </span>
        </div>
    </div>

    <!-- Search Results -->
    <div class="row g-4">
        <c:choose>
            <c:when test="${empty places}">
                <div class="col-12">
                    <div class="no-results fade-in">
                        <div class="no-results-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h3 class="no-results-title">No Results Found</h3>
                        <p class="no-results-text">
                            We couldn't find any places matching your search criteria.<br>
                            Try using different keywords or exploring different categories.
                        </p>
                        <a href="search" class="btn-search-again">
                            <i class="fas fa-search"></i>
                            Search Again
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="place" items="${places}" varStatus="status">
                    <div class="col-lg-4 col-md-6 fade-in" style="animation-delay: ${status.index * 0.1}s;">
                        <div class="place-card">
                            <c:if test="${not empty place.thumbnailUrl}">
                                <img src="${place.thumbnailUrl}" class="card-img-top place-image" alt="${place.name}">
                            </c:if>
                            <c:if test="${empty place.thumbnailUrl}">
                                <div class="card-img-top place-image d-flex align-items-center justify-content-center"
                                     style="background: var(--gradient-primary); color: white;">
                                    <i class="fas fa-image fa-3x opacity-50"></i>
                                </div>
                            </c:if>

                            <div class="place-card-body">
                                <h5 class="place-title">${place.name}</h5>

                                <div class="place-address">
                                    <i class="fas fa-map-marker-alt text-danger"></i>
                                    <span>${place.address}</span>
                                </div>

                                <p class="place-description">
                                    <c:choose>
                                        <c:when test="${place.description.length() > 120}">
                                            ${place.description.substring(0, 120)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${place.description}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <div class="place-meta">
                                    <span class="place-category">${place.category}</span>

                                    <c:if test="${place.averageRating > 0}">
                                        <div class="rating-section">
                                            <div class="stars">
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
                                            <span class="rating-text">
                                                    <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>
                                                </span>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="card-footer">
                                <a href="place-detail?id=${place.id}" class="btn-view-detail">
                                    <i class="fas fa-eye"></i>
                                    View Details
                                </a>
                                <small class="place-date">
                                    <i class="fas fa-calendar-alt me-1"></i>
                                    <fmt:formatDate value="${place.createdAt}" pattern="MMM dd, yyyy"/>
                                </small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Search Actions -->
    <div class="search-actions">
        <a href="search" class="btn-search-again">
            <i class="fas fa-search"></i>
            New Search
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Enhanced animations and interactions
    document.addEventListener('DOMContentLoaded', function() {
        // Stagger animation for cards
        const cards = document.querySelectorAll('.place-card');
        cards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });

        // Add hover effects for better UX
        cards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Smooth scroll to results
        if (document.querySelector('.place-card')) {
            setTimeout(() => {
                document.querySelector('.search-summary').scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }, 300);
        }
    });

    // Add loading animation for view detail buttons
    document.querySelectorAll('.btn-view-detail').forEach(btn => {
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