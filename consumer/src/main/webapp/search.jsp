<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Search</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">Travel Service</a>
        <div class="navbar-nav ms-auto">
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

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0">Searching Tourist Attraction</h3>
                </div>
                <div class="card-body">
                    <!-- Error/Success Messages -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success">${success}</div>
                    </c:if>

                    <!-- Search Form -->
                    <form action="search" method="get">
                        <div class="mb-3">
                            <label for="keyword" class="form-label">Keyword</label>
                            <input type="text" class="form-control" id="keyword" name="keyword"
                                   placeholder="Enter place name, description..." required>
                        </div>

<%--                        <div class="mb-3">--%>
<%--                            <label for="category" class="form-label">Category</label>--%>
<%--                            <select class="form-select" id="category" name="category">--%>
<%--                                <option value="">All Category</option>--%>
<%--                                <option value="RESTAURANT">Restaurant</option>--%>
<%--                                <option value="HOTEL">Hotel</option>--%>
<%--                                <option value="ATTRACTION">Attraction</option>--%>
<%--                                <option value="ENTERTAINMENT">Entertainment</option>--%>
<%--                                <option value="SHOPPING">Shopping</option>--%>
<%--                                <option value="TRANSPORT">Transport</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search"></i> Search
                            </button>
                        </div>
                    </form>
                </div>
            </div>

<%--            <!-- Popular Places Section -->--%>
<%--            <div class="card mt-4">--%>
<%--                <div class="card-header">--%>
<%--                    <h5 class="mb-0">Popular Place</h5>--%>
<%--                </div>--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-md-4 mb-3">--%>
<%--                            <div class="card">--%>
<%--                                <div class="card-body text-center">--%>
<%--                                    <i class="fas fa-mountain fa-2x text-success mb-2"></i>--%>
<%--                                    <h6>Tourist Attraction</h6>--%>
<%--                                    <a href="search?category=ATTRACTION" class="btn btn-sm btn-outline-primary">See More</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 mb-3">--%>
<%--                            <div class="card">--%>
<%--                                <div class="card-body text-center">--%>
<%--                                    <i class="fas fa-utensils fa-2x text-danger mb-2"></i>--%>
<%--                                    <h6>Restaurant</h6>--%>
<%--                                    <a href="search?category=RESTAURANT" class="btn btn-sm btn-outline-primary">See More</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 mb-3">--%>
<%--                            <div class="card">--%>
<%--                                <div class="card-body text-center">--%>
<%--                                    <i class="fas fa-bed fa-2x text-info mb-2"></i>--%>
<%--                                    <h6>Hotel</h6>--%>
<%--                                    <a href="search?category=HOTEL" class="btn btn-sm btn-outline-primary">Xem thêm</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>
