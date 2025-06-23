<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:06 PM
  Modern Travel Service Search Page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover Amazing Places - TravelExplorer</title>
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
            --gradient-secondary: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        * {
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
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

        .hero-section {
            padding: 80px 0 40px;
            text-align: center;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            color: white;
            margin-bottom: 1.5rem;
            text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 3rem;
            font-weight: 300;
        }

        .search-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin-bottom: 3rem;
        }

        .form-control, .form-select {
            border: 2px solid rgba(37, 99, 235, 0.1);
            border-radius: 15px;
            padding: 12px 20px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
            background: white;
        }

        .btn-search {
            background: var(--gradient-primary);
            border: none;
            border-radius: 15px;
            padding: 12px 30px;
            font-weight: 600;
            font-size: 1.1rem;
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
        }

        .btn-search:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(37, 99, 235, 0.4);
            color: white;
        }

        .category-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            transition: all 0.3s ease;
            height: 100%;
        }

        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .category-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: white;
            transition: all 0.3s ease;
        }

        .category-icon.attraction {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .category-icon.restaurant {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .category-icon.hotel {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .category-icon.entertainment {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
        }

        .category-icon.shopping {
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
        }

        .category-icon.transport {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
        }

        .category-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }

        .btn-category {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            border-radius: 25px;
            padding: 8px 24px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-category:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .alert {
            border: none;
            border-radius: 15px;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
        }

        .alert-danger {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            color: #dc2626;
        }

        .alert-success {
            background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%);
            color: #16a34a;
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }

            .hero-subtitle {
                font-size: 1.1rem;
            }

            .search-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top">
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
                        <a class="nav-link" href="register">
                            <i class="fas fa-user-plus me-1"></i>Register
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
    <div class="container">
        <h1 class="hero-title">Discover Your Next Adventure</h1>
        <p class="hero-subtitle">Find amazing places, restaurants, and experiences around the world</p>
    </div>
</div>

<!-- Main Content -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <!-- Search Card -->
            <div class="search-card">
                <div class="text-center mb-4">
                    <h3 class="fw-bold text-dark mb-2">Start Your Journey</h3>
                    <p class="text-muted">Search for places that match your interests</p>
                </div>

                <!-- Error/Success Messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                    </div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle me-2"></i>${success}
                    </div>
                </c:if>

                <!-- Search Form -->
                <form action="search" method="get">
                    <div class="row g-3">
                        <div class="col-md-8">
                            <label for="keyword" class="form-label fw-semibold">What are you looking for?</label>
                            <input type="text" class="form-control" id="keyword" name="keyword"
                                   placeholder="Enter place name, city, or description..." required>
                        </div>
                    </div>
                </form>
          </div>

            <!-- Popular Categories -->
            <div class="row g-4">
                <div class="col-12 text-center mb-3">
                    <h3 class="fw-bold text-white mb-2">Popular Categories</h3>
                    <p class="text-white-50">Explore different types of places</p>
                </div>

                <div class="col-md-4">
                    <div class="category-card text-center">
                        <div class="category-icon attraction">
                            <i class="fas fa-mountain"></i>
                        </div>
                        <h5 class="category-title">Tourist Attractions</h5>
                        <p class="text-muted mb-3">Discover breathtaking landmarks and scenic spots</p>
                        <a href="search?category=ATTRACTION" class="btn btn-category">
                            Explore Attractions
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add smooth scrolling and animations
    document.addEventListener('DOMContentLoaded', function() {
        // Animate category cards on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animation = 'fadeInUp 0.6s ease forwards';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.category-card').forEach(card => {
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
        `;
    document.head.appendChild(style);
</script>
</body>
</html>