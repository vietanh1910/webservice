<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:18 PM
  Modern Travel Service Home Page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TravelExplorer - Discover Amazing Places</title>
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
      --gradient-hero: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
      --gradient-card: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
    }

    * {
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: var(--bg-light);
      color: var(--text-dark);
      overflow-x: hidden;
    }

    /* Navigation Styles */
    .navbar {
      background: rgba(255, 255, 255, 0.95) !important;
      backdrop-filter: blur(15px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      border-bottom: 1px solid rgba(255, 255, 255, 0.2);
      transition: all 0.3s ease;
    }

    .navbar.scrolled {
      background: rgba(255, 255, 255, 0.98) !important;
      box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.8rem;
      color: var(--primary-color) !important;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      transition: all 0.3s ease;
    }

    .navbar-brand:hover {
      transform: scale(1.05);
    }

    .nav-link {
      color: var(--text-dark) !important;
      font-weight: 500;
      transition: all 0.3s ease;
      border-radius: 25px;
      padding: 10px 20px !important;
      margin: 0 5px;
      position: relative;
      overflow: hidden;
    }

    .nav-link::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: var(--gradient-primary);
      transition: left 0.3s ease;
      z-index: -1;
    }

    .nav-link:hover::before {
      left: 0;
    }

    .nav-link:hover {
      color: white !important;
      transform: translateY(-2px);
    }

    /* Hero Section */
    .hero-section {
      background: var(--gradient-hero);
      min-height: 100vh;
      display: flex;
      align-items: center;
      position: relative;
      overflow: hidden;
    }

    .hero-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="rgba(255,255,255,0.1)"/><stop offset="100%" stop-color="rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="600" cy="700" r="120" fill="url(%23a)"/></svg>');
      opacity: 0.6;
    }

    .hero-content {
      position: relative;
      z-index: 2;
    }

    .hero-title {
      font-size: 4rem;
      font-weight: 700;
      color: white;
      margin-bottom: 1.5rem;
      line-height: 1.2;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .hero-subtitle {
      font-size: 1.4rem;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: 2.5rem;
      font-weight: 400;
      line-height: 1.6;
    }

    .hero-buttons {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .btn-hero {
      padding: 15px 35px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 30px;
      transition: all 0.3s ease;
      border: none;
      position: relative;
      overflow: hidden;
    }

    .btn-hero-primary {
      background: rgba(255, 255, 255, 0.2);
      color: white;
      backdrop-filter: blur(10px);
      border: 2px solid rgba(255, 255, 255, 0.3);
    }

    .btn-hero-primary:hover {
      background: white;
      color: var(--primary-color);
      transform: translateY(-3px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }

    .btn-hero-secondary {
      background: transparent;
      color: white;
      border: 2px solid rgba(255, 255, 255, 0.5);
    }

    .btn-hero-secondary:hover {
      background: rgba(255, 255, 255, 0.1);
      color: white;
      transform: translateY(-3px);
      border-color: white;
    }

    .hero-image {
      position: relative;
      z-index: 2;
    }

    .hero-image img {
      border-radius: 25px;
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
      transition: transform 0.3s ease;
    }

    .hero-image:hover img {
      transform: scale(1.02) rotate(1deg);
    }

    /* Floating Elements */
    .floating-element {
      position: absolute;
      animation: float 6s ease-in-out infinite;
    }

    .floating-element:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
    .floating-element:nth-child(2) { top: 60%; right: 15%; animation-delay: 2s; }
    .floating-element:nth-child(3) { bottom: 30%; left: 5%; animation-delay: 4s; }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-20px) rotate(5deg); }
    }

    /* Features Section */
    .features-section {
      padding: 100px 0;
      background: white;
      position: relative;
    }

    .section-title {
      font-size: 3rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 1rem;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .section-subtitle {
      font-size: 1.2rem;
      color: var(--text-light);
      text-align: center;
      margin-bottom: 4rem;
    }

    .feature-card {
      background: var(--gradient-card);
      border: none;
      border-radius: 25px;
      padding: 2.5rem;
      height: 100%;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .feature-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 5px;
      background: var(--gradient-primary);
      transform: scaleX(0);
      transition: transform 0.3s ease;
    }

    .feature-card:hover::before {
      transform: scaleX(1);
    }

    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
    }

    .feature-icon {
      width: 80px;
      height: 80px;
      background: var(--gradient-primary);
      color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2rem;
      margin: 0 auto 1.5rem;
      transition: all 0.3s ease;
    }

    .feature-card:hover .feature-icon {
      transform: scale(1.1) rotate(10deg);
    }

    .feature-title {
      font-size: 1.4rem;
      font-weight: 600;
      margin-bottom: 1rem;
      text-align: center;
    }

    .feature-description {
      color: var(--text-light);
      text-align: center;
      line-height: 1.6;
    }

    /* Categories Section */
    .categories-section {
      padding: 100px 0;
      background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    }

    .category-card {
      background: white;
      border: none;
      border-radius: 20px;
      padding: 2rem 1rem;
      height: 100%;
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .category-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: var(--gradient-primary);
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .category-card:hover::before {
      opacity: 0.1;
    }

    .category-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      text-decoration: none;
    }

    .category-icon {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      transition: all 0.3s ease;
    }

    .category-card:hover .category-icon {
      transform: scale(1.2);
    }

    .category-title {
      font-size: 1.1rem;
      font-weight: 600;
      color: var(--text-dark);
      margin: 0;
    }

    /* CTA Section */
    .cta-section {
      padding: 100px 0;
      background: var(--gradient-secondary);
      position: relative;
      overflow: hidden;
    }

    .cta-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="b" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="rgba(255,255,255,0.1)"/><stop offset="100%" stop-color="rgba(255,255,255,0)"/></radialGradient></defs><circle cx="100" cy="100" r="80" fill="url(%23b)"/><circle cx="900" cy="200" r="120" fill="url(%23b)"/><circle cx="200" cy="800" r="100" fill="url(%23b)"/><circle cx="800" cy="900" r="90" fill="url(%23b)"/></svg>');
    }

    .cta-content {
      position: relative;
      z-index: 2;
      text-align: center;
      color: white;
    }

    .cta-title {
      font-size: 3rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .cta-subtitle {
      font-size: 1.3rem;
      margin-bottom: 2.5rem;
      opacity: 0.9;
    }

    .btn-cta {
      background: rgba(255, 255, 255, 0.2);
      color: white;
      border: 2px solid rgba(255, 255, 255, 0.3);
      padding: 15px 40px;
      font-size: 1.2rem;
      font-weight: 600;
      border-radius: 30px;
      backdrop-filter: blur(10px);
      transition: all 0.3s ease;
    }

    .btn-cta:hover {
      background: white;
      color: var(--primary-color);
      transform: translateY(-3px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }

    /* Footer */
    .footer {
      background: #1a1a1a;
      color: white;
      padding: 60px 0 30px;
    }

    .footer-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 1rem;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .footer-text {
      color: #888;
      line-height: 1.6;
    }

    .footer-bottom {
      border-top: 1px solid #333;
      padding-top: 2rem;
      margin-top: 3rem;
    }

    /* Animations */
    .fade-in-up {
      opacity: 0;
      transform: translateY(30px);
      animation: fadeInUp 0.8s ease forwards;
    }

    .fade-in-up:nth-child(1) { animation-delay: 0.1s; }
    .fade-in-up:nth-child(2) { animation-delay: 0.2s; }
    .fade-in-up:nth-child(3) { animation-delay: 0.3s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .hero-title {
        font-size: 2.5rem;
      }

      .hero-subtitle {
        font-size: 1.1rem;
      }

      .hero-buttons {
        justify-content: center;
      }

      .section-title {
        font-size: 2.2rem;
      }

      .cta-title {
        font-size: 2.2rem;
      }

      .feature-card,
      .category-card {
        margin-bottom: 2rem;
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
<section class="hero-section">
  <!-- Floating Elements -->
  <div class="floating-element">
    <i class="fas fa-plane text-white" style="font-size: 2rem; opacity: 0.3;"></i>
  </div>
  <div class="floating-element">
    <i class="fas fa-map-marker-alt text-white" style="font-size: 1.5rem; opacity: 0.3;"></i>
  </div>
  <div class="floating-element">
    <i class="fas fa-camera text-white" style="font-size: 1.8rem; opacity: 0.3;"></i>
  </div>

  <div class="container">
    <div class="row align-items-center min-vh-100">
      <div class="col-lg-6 hero-content">
        <h1 class="hero-title fade-in-up">Explore the World with TravelExplorer</h1>
        <p class="hero-subtitle fade-in-up">
          Discover amazing destinations, view stunning photos, and read authentic reviews from fellow travelers. Your next adventure starts here.
        </p>
        <div class="hero-buttons fade-in-up">
          <a href="search" class="btn btn-hero btn-hero-primary">
            <i class="fas fa-search me-2"></i>Start Exploring
          </a>
          <c:if test="${sessionScope.token == null}">
            <a href="register" class="btn btn-hero btn-hero-secondary">
              <i class="fas fa-user-plus me-2"></i>Join Community
            </a>
          </c:if>
        </div>
      </div>
      <div class="col-lg-6 hero-image">
        <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80"
             class="img-fluid" alt="Travel Adventure">
      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section class="features-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">Why Choose TravelExplorer?</h2>
        <p class="section-subtitle">Discover what makes us the perfect companion for your travel journey</p>
      </div>
    </div>

    <div class="row g-4">
      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-search"></i>
          </div>
          <h5 class="feature-title">Smart Search Technology</h5>
          <p class="feature-description">
            Our advanced search algorithm helps you discover the perfect destinations based on your preferences, interests, and travel style.
          </p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-images"></i>
          </div>
          <h5 class="feature-title">Authentic Visual Stories</h5>
          <p class="feature-description">
            Browse through thousands of real photos shared by experienced travelers and local guides to get a true feel of each destination.
          </p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-star"></i>
          </div>
          <h5 class="feature-title">Trusted Reviews & Ratings</h5>
          <p class="feature-description">
            Make informed decisions with honest reviews and detailed ratings from our community of verified travelers and local experts.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Categories Section -->
<section class="categories-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">Explore by Category</h2>
        <p class="section-subtitle">Find exactly what you're looking for with our organized categories</p>
      </div>
    </div>

    <div class="row g-4">
      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=RESTAURANT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-utensils text-danger"></i>
            </div>
            <h6 class="category-title">Restaurants</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=HOTEL" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-bed text-info"></i>
            </div>
            <h6 class="category-title">Hotels</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=ATTRACTION" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-mountain text-success"></i>
            </div>
            <h6 class="category-title">Attractions</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=ENTERTAINMENT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-gamepad text-primary"></i>
            </div>
            <h6 class="category-title">Entertainment</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=SHOPPING" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-shopping-bag text-warning"></i>
            </div>
            <h6 class="category-title">Shopping</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=TRANSPORT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-bus text-secondary"></i>
            </div>
            <h6 class="category-title">Transport</h6>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Call to Action Section -->
<section class="cta-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="cta-content">
          <h2 class="cta-title">Ready for Your Next Adventure?</h2>
          <p class="cta-subtitle">
            Join thousands of travelers who trust TravelExplorer to discover amazing destinations worldwide
          </p>
          <a href="search" class="btn btn-cta">
            <i class="fas fa-compass me-2"></i>Start Your Journey
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h6 class="footer-title">
          <i class="fas fa-compass me-2"></i>TravelExplorer
        </h6>
        <p class="footer-text">
          Your trusted companion for discovering amazing destinations around the world.
          Explore with confidence, guided by authentic experiences from fellow travelers.
        </p>
      </div>
      <div class="col-md-6 text-md-end">
        <div class="footer-bottom">
          <p class="footer-text mb-0">&copy; 2025 TravelExplorer. All rights reserved.</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Navbar scroll effect
  window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 100) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  // Intersection Observer for animations
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  };

  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.animationPlayState = 'running';
      }
    });
  }, observerOptions);

  // Observe all fade-in elements
  document.querySelectorAll('.fade-in-up').forEach(el => {
    observer.observe(el);
  });

  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });

  // Add loading animation
  window.addEventListener('load', function() {
    document.body.classList.add('loaded');
  });
</script>
</body>
</html><%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:18 PM
  Modern Travel Service Home Page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TravelExplorer - Discover Amazing Places</title>
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
      --gradient-hero: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
      --gradient-card: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
    }

    * {
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: var(--bg-light);
      color: var(--text-dark);
      overflow-x: hidden;
    }

    /* Navigation Styles */
    .navbar {
      background: rgba(255, 255, 255, 0.95) !important;
      backdrop-filter: blur(15px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      border-bottom: 1px solid rgba(255, 255, 255, 0.2);
      transition: all 0.3s ease;
    }

    .navbar.scrolled {
      background: rgba(255, 255, 255, 0.98) !important;
      box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.8rem;
      color: var(--primary-color) !important;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      transition: all 0.3s ease;
    }

    .navbar-brand:hover {
      transform: scale(1.05);
    }

    .nav-link {
      color: var(--text-dark) !important;
      font-weight: 500;
      transition: all 0.3s ease;
      border-radius: 25px;
      padding: 10px 20px !important;
      margin: 0 5px;
      position: relative;
      overflow: hidden;
    }

    .nav-link::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: var(--gradient-primary);
      transition: left 0.3s ease;
      z-index: -1;
    }

    .nav-link:hover::before {
      left: 0;
    }

    .nav-link:hover {
      color: white !important;
      transform: translateY(-2px);
    }

    /* Hero Section */
    .hero-section {
      background: var(--gradient-hero);
      min-height: 100vh;
      display: flex;
      align-items: center;
      position: relative;
      overflow: hidden;
    }

    .hero-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="rgba(255,255,255,0.1)"/><stop offset="100%" stop-color="rgba(255,255,255,0)"/></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)"/><circle cx="800" cy="300" r="150" fill="url(%23a)"/><circle cx="600" cy="700" r="120" fill="url(%23a)"/></svg>');
      opacity: 0.6;
    }

    .hero-content {
      position: relative;
      z-index: 2;
    }

    .hero-title {
      font-size: 4rem;
      font-weight: 700;
      color: white;
      margin-bottom: 1.5rem;
      line-height: 1.2;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .hero-subtitle {
      font-size: 1.4rem;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: 2.5rem;
      font-weight: 400;
      line-height: 1.6;
    }

    .hero-buttons {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .btn-hero {
      padding: 15px 35px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 30px;
      transition: all 0.3s ease;
      border: none;
      position: relative;
      overflow: hidden;
    }

    .btn-hero-primary {
      background: rgba(255, 255, 255, 0.2);
      color: white;
      backdrop-filter: blur(10px);
      border: 2px solid rgba(255, 255, 255, 0.3);
    }

    .btn-hero-primary:hover {
      background: white;
      color: var(--primary-color);
      transform: translateY(-3px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }

    .btn-hero-secondary {
      background: transparent;
      color: white;
      border: 2px solid rgba(255, 255, 255, 0.5);
    }

    .btn-hero-secondary:hover {
      background: rgba(255, 255, 255, 0.1);
      color: white;
      transform: translateY(-3px);
      border-color: white;
    }

    .hero-image {
      position: relative;
      z-index: 2;
    }

    .hero-image img {
      border-radius: 25px;
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
      transition: transform 0.3s ease;
    }

    .hero-image:hover img {
      transform: scale(1.02) rotate(1deg);
    }

    /* Floating Elements */
    .floating-element {
      position: absolute;
      animation: float 6s ease-in-out infinite;
    }

    .floating-element:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
    .floating-element:nth-child(2) { top: 60%; right: 15%; animation-delay: 2s; }
    .floating-element:nth-child(3) { bottom: 30%; left: 5%; animation-delay: 4s; }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-20px) rotate(5deg); }
    }

    /* Features Section */
    .features-section {
      padding: 100px 0;
      background: white;
      position: relative;
    }

    .section-title {
      font-size: 3rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 1rem;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .section-subtitle {
      font-size: 1.2rem;
      color: var(--text-light);
      text-align: center;
      margin-bottom: 4rem;
    }

    .feature-card {
      background: var(--gradient-card);
      border: none;
      border-radius: 25px;
      padding: 2.5rem;
      height: 100%;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .feature-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 5px;
      background: var(--gradient-primary);
      transform: scaleX(0);
      transition: transform 0.3s ease;
    }

    .feature-card:hover::before {
      transform: scaleX(1);
    }

    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
    }

    .feature-icon {
      width: 80px;
      height: 80px;
      background: var(--gradient-primary);
      color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2rem;
      margin: 0 auto 1.5rem;
      transition: all 0.3s ease;
    }

    .feature-card:hover .feature-icon {
      transform: scale(1.1) rotate(10deg);
    }

    .feature-title {
      font-size: 1.4rem;
      font-weight: 600;
      margin-bottom: 1rem;
      text-align: center;
    }

    .feature-description {
      color: var(--text-light);
      text-align: center;
      line-height: 1.6;
    }

    /* Categories Section */
    .categories-section {
      padding: 100px 0;
      background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    }

    .category-card {
      background: white;
      border: none;
      border-radius: 20px;
      padding: 2rem 1rem;
      height: 100%;
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .category-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: var(--gradient-primary);
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .category-card:hover::before {
      opacity: 0.1;
    }

    .category-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      text-decoration: none;
    }

    .category-icon {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      transition: all 0.3s ease;
    }

    .category-card:hover .category-icon {
      transform: scale(1.2);
    }

    .category-title {
      font-size: 1.1rem;
      font-weight: 600;
      color: var(--text-dark);
      margin: 0;
    }

    /* CTA Section */
    .cta-section {
      padding: 100px 0;
      background: var(--gradient-secondary);
      position: relative;
      overflow: hidden;
    }

    .cta-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="b" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="rgba(255,255,255,0.1)"/><stop offset="100%" stop-color="rgba(255,255,255,0)"/></radialGradient></defs><circle cx="100" cy="100" r="80" fill="url(%23b)"/><circle cx="900" cy="200" r="120" fill="url(%23b)"/><circle cx="200" cy="800" r="100" fill="url(%23b)"/><circle cx="800" cy="900" r="90" fill="url(%23b)"/></svg>');
    }

    .cta-content {
      position: relative;
      z-index: 2;
      text-align: center;
      color: white;
    }

    .cta-title {
      font-size: 3rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .cta-subtitle {
      font-size: 1.3rem;
      margin-bottom: 2.5rem;
      opacity: 0.9;
    }

    .btn-cta {
      background: rgba(255, 255, 255, 0.2);
      color: white;
      border: 2px solid rgba(255, 255, 255, 0.3);
      padding: 15px 40px;
      font-size: 1.2rem;
      font-weight: 600;
      border-radius: 30px;
      backdrop-filter: blur(10px);
      transition: all 0.3s ease;
    }

    .btn-cta:hover {
      background: white;
      color: var(--primary-color);
      transform: translateY(-3px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }

    /* Footer */
    .footer {
      background: #1a1a1a;
      color: white;
      padding: 60px 0 30px;
    }

    .footer-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 1rem;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .footer-text {
      color: #888;
      line-height: 1.6;
    }

    .footer-bottom {
      border-top: 1px solid #333;
      padding-top: 2rem;
      margin-top: 3rem;
    }

    /* Animations */
    .fade-in-up {
      opacity: 0;
      transform: translateY(30px);
      animation: fadeInUp 0.8s ease forwards;
    }

    .fade-in-up:nth-child(1) { animation-delay: 0.1s; }
    .fade-in-up:nth-child(2) { animation-delay: 0.2s; }
    .fade-in-up:nth-child(3) { animation-delay: 0.3s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .hero-title {
        font-size: 2.5rem;
      }

      .hero-subtitle {
        font-size: 1.1rem;
      }

      .hero-buttons {
        justify-content: center;
      }

      .section-title {
        font-size: 2.2rem;
      }

      .cta-title {
        font-size: 2.2rem;
      }

      .feature-card,
      .category-card {
        margin-bottom: 2rem;
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
<section class="hero-section">
  <!-- Floating Elements -->
  <div class="floating-element">
    <i class="fas fa-plane text-white" style="font-size: 2rem; opacity: 0.3;"></i>
  </div>
  <div class="floating-element">
    <i class="fas fa-map-marker-alt text-white" style="font-size: 1.5rem; opacity: 0.3;"></i>
  </div>
  <div class="floating-element">
    <i class="fas fa-camera text-white" style="font-size: 1.8rem; opacity: 0.3;"></i>
  </div>

  <div class="container">
    <div class="row align-items-center min-vh-100">
      <div class="col-lg-6 hero-content">
        <h1 class="hero-title fade-in-up">Explore the World with TravelExplorer</h1>
        <p class="hero-subtitle fade-in-up">
          Discover amazing destinations, view stunning photos, and read authentic reviews from fellow travelers. Your next adventure starts here.
        </p>
        <div class="hero-buttons fade-in-up">
          <a href="search" class="btn btn-hero btn-hero-primary">
            <i class="fas fa-search me-2"></i>Start Exploring
          </a>
          <c:if test="${sessionScope.token == null}">
            <a href="register" class="btn btn-hero btn-hero-secondary">
              <i class="fas fa-user-plus me-2"></i>Join Community
            </a>
          </c:if>
        </div>
      </div>
      <div class="col-lg-6 hero-image">
        <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80"
             class="img-fluid" alt="Travel Adventure">
      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section class="features-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">Why Choose TravelExplorer?</h2>
        <p class="section-subtitle">Discover what makes us the perfect companion for your travel journey</p>
      </div>
    </div>

    <div class="row g-4">
      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-search"></i>
          </div>
          <h5 class="feature-title">Smart Search Technology</h5>
          <p class="feature-description">
            Our advanced search algorithm helps you discover the perfect destinations based on your preferences, interests, and travel style.
          </p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-images"></i>
          </div>
          <h5 class="feature-title">Authentic Visual Stories</h5>
          <p class="feature-description">
            Browse through thousands of real photos shared by experienced travelers and local guides to get a true feel of each destination.
          </p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="card feature-card fade-in-up">
          <div class="feature-icon">
            <i class="fas fa-star"></i>
          </div>
          <h5 class="feature-title">Trusted Reviews & Ratings</h5>
          <p class="feature-description">
            Make informed decisions with honest reviews and detailed ratings from our community of verified travelers and local experts.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Categories Section -->
<section class="categories-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">Explore by Category</h2>
        <p class="section-subtitle">Find exactly what you're looking for with our organized categories</p>
      </div>
    </div>

    <div class="row g-4">
      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=RESTAURANT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-utensils text-danger"></i>
            </div>
            <h6 class="category-title">Restaurants</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=HOTEL" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-bed text-info"></i>
            </div>
            <h6 class="category-title">Hotels</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=ATTRACTION" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-mountain text-success"></i>
            </div>
            <h6 class="category-title">Attractions</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=ENTERTAINMENT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-gamepad text-primary"></i>
            </div>
            <h6 class="category-title">Entertainment</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=SHOPPING" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-shopping-bag text-warning"></i>
            </div>
            <h6 class="category-title">Shopping</h6>
          </div>
        </a>
      </div>

      <div class="col-lg-2 col-md-4 col-6">
        <a href="search?category=TRANSPORT" class="category-card card text-center">
          <div class="card-body">
            <div class="category-icon">
              <i class="fas fa-bus text-secondary"></i>
            </div>
            <h6 class="category-title">Transport</h6>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Call to Action Section -->
<section class="cta-section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="cta-content">
          <h2 class="cta-title">Ready for Your Next Adventure?</h2>
          <p class="cta-subtitle">
            Join thousands of travelers who trust TravelExplorer to discover amazing destinations worldwide
          </p>
          <a href="search" class="btn btn-cta">
            <i class="fas fa-compass me-2"></i>Start Your Journey
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h6 class="footer-title">
          <i class="fas fa-compass me-2"></i>TravelExplorer
        </h6>
        <p class="footer-text">
          Your trusted companion for discovering amazing destinations around the world.
          Explore with confidence, guided by authentic experiences from fellow travelers.
        </p>
      </div>
      <div class="col-md-6 text-md-end">
        <div class="footer-bottom">
          <p class="footer-text mb-0">&copy; 2025 TravelExplorer. All rights reserved.</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Navbar scroll effect
  window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 100) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  // Intersection Observer for animations
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  };

  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.animationPlayState = 'running';
      }
    });
  }, observerOptions);

  // Observe all fade-in elements
  document.querySelectorAll('.fade-in-up').forEach(el => {
    observer.observe(el);
  });

  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });

  // Add loading animation
  window.addEventListener('load', function() {
    document.body.classList.add('loaded');
  });
</script>
</body>
</html>