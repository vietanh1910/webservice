<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Travel Service - Home</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="traveller-home.jsp">
      <i class="fas fa-plane"></i> Travel Service
    </a>
    <div class="navbar-nav ms-auto">
      <a class="nav-link" href="search">Search</a>
      <c:choose>
        <c:when test="${sessionScope.token != null}">
          <a class="nav-link" href="logout">Logout</a>
        </c:when>
        <c:otherwise>
          <a class="nav-link" href="login">Login</a>
          <a class="nav-link" href="register">Register</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero-section bg-light py-5">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6">
        <h1 class="display-4 fw-bold text-primary">Explore the world with Travel Service</h1>
        <p class="lead text-muted">
          Search for travel destinations, view photos and details from our community of tour guides
        </p>
        <div class="d-flex gap-3">
          <a href="search" class="btn btn-primary btn-lg">
            <i class="fas fa-search"></i> Begin searching
          </a>
          <c:if test="${sessionScope.token == null}">
            <a href="register" class="btn btn-outline-primary btn-lg">
              <i class="fas fa-user-plus"></i> Register Now
            </a>
          </c:if>
        </div>
      </div>
      <div class="col-lg-6">
        <img src="https://via.placeholder.com/600x400/0d6efd/ffffff?text=Travel+Suite"
             class="img-fluid rounded shadow" alt="Travel Service">
      </div>
    </div>
  </div>
</div>

<!-- Features Section -->
<div class="container py-5">
  <div class="row text-center mb-5">
    <div class="col-12">
      <h2 class="fw-bold">Unique features</h2>
      <p class="text-muted">What Travel Service bring to you</p>
    </div>
  </div>

  <div class="row g-4">
    <div class="col-md-4">
      <div class="card h-100 text-center border-0 shadow-sm">
        <div class="card-body">
          <div class="feature-icon bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
               style="width: 64px; height: 64px;">
            <i class="fas fa-search fa-2x"></i>
          </div>
          <h5 class="card-title">Smart Search</h5>
          <p class="card-text text-muted">
            Search for tourist destinations by keyword, category with accurate and fast results
          </p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 text-center border-0 shadow-sm">
        <div class="card-body">
          <div class="feature-icon bg-success text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
               style="width: 64px; height: 64px;">
            <i class="fas fa-images fa-2x"></i>
          </div>
          <h5 class="card-title">Diversified Image</h5>
          <p class="card-text text-muted">
            See real photos from experienced tour guides
          </p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 text-center border-0 shadow-sm">
        <div class="card-body">
          <div class="feature-icon bg-warning text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
               style="width: 64px; height: 64px;">
            <i class="fas fa-star fa-2x"></i>
          </div>
          <h5 class="card-title">Rating & Comment</h5>
          <p class="card-text text-muted">
            Rate and share experiences about tourist destinations
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Categories Section -->
<div class="bg-light py-5">
  <div class="container">
    <div class="row text-center mb-5">
      <div class="col-12">
        <h2 class="fw-bold">Popular Category</h2>
        <p class="text-muted">Explore different types of tourist attractions</p>
      </div>
    </div>

    <div class="row g-3">
      <div class="col-md-2 col-6">
        <a href="search?category=RESTAURANT" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-utensils fa-2x text-danger mb-2"></i>
              <h6 class="card-title mb-0">Restaurant</h6>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-2 col-6">
        <a href="search?category=HOTEL" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-bed fa-2x text-info mb-2"></i>
              <h6 class="card-title mb-0">Hotel</h6>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-2 col-6">
        <a href="search?category=ATTRACTION" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-mountain fa-2x text-success mb-2"></i>
              <h6 class="card-title mb-0">Tourist Attraction</h6>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-2 col-6">
        <a href="search?category=ENTERTAINMENT" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-gamepad fa-2x text-purple mb-2"></i>
              <h6 class="card-title mb-0">Entertainment</h6>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-2 col-6">
        <a href="search?category=SHOPPING" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-shopping-bag fa-2x text-warning mb-2"></i>
              <h6 class="card-title mb-0">Shopping</h6>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-2 col-6">
        <a href="search?category=TRANSPORT" class="text-decoration-none">
          <div class="card text-center border-0 shadow-sm h-100">
            <div class="card-body py-4">
              <i class="fas fa-bus fa-2x text-secondary mb-2"></i>
              <h6 class="card-title mb-0">Transport</h6>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>

<!-- Call to Action -->
<div class="container py-5">
  <div class="row">
    <div class="col-12">
      <div class="card bg-primary text-white text-center">
        <div class="card-body py-5">
          <h2 class="fw-bold mb-3">Ready to explore?</h2>
          <p class="lead mb-4">
            Thousands of tourist destinations are waiting for you to explore
          </p>
          <a href="search" class="btn btn-light btn-lg">
            <i class="fas fa-compass"></i> Start your journey
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h6>Travel Suite</h6>
        <p class="text-muted mb-0">Explore the world with us!</p>
      </div>
      <div class="col-md-6 text-md-end">
        <p class="text-muted mb-0">&copy; 2025 Travel Service. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>
