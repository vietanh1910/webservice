<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/20/2025
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">Travel Service</a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="search">Search</a>
            <c:choose>
                <c:when test="${sessionScope.token != null}">
                    <a class="nav-link" href="logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link" href="login">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Search Summary -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5>Search result for: "<strong>${keyword}</strong>"</h5>
                    <c:if test="${not empty category}">
                        <p class="mb-0">Category: <span class="badge bg-secondary">${category}</span></p>
                    </c:if>
                    <p class="text-muted mb-0">Founded ${places.size()} results</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Results -->
    <div class="row">
        <c:choose>
            <c:when test="${empty places}">
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        <h5>Cannot find any result</h5>
                        <p>Try using different keyword or finding in category</p>
                        <a href="search" class="btn btn-primary">Search again</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="place" items="${places}">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="card h-100">
                            <c:if test="${not empty place.thumbnailUrl}">
                                <img src="${place.thumbnailUrl}" class="card-img-top" alt="${place.name}"
                                     style="height: 200px; object-fit: cover;">
                            </c:if>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${place.name}</h5>
                                <p class="card-text text-muted small">
                                    <i class="fas fa-map-marker-alt"></i> ${place.address}
                                </p>
                                <p class="card-text flex-grow-1">
                                    <c:choose>
                                        <c:when test="${place.description.length() > 100}">
                                            ${place.description.substring(0, 100)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${place.description}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <!-- Place Info -->
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-info">${place.category}</span>
                                    <div class="d-flex align-items-center">
                                        <c:if test="${place.averageRating > 0}">
                                                <span class="text-warning me-1">
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
                                                </span>
                                            <small class="text-muted">
                                                (<fmt:formatNumber value="${place.averageRating}" pattern="0.0"/>)
                                            </small>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="mt-auto d-flex justify-content-between">
                                    <a href="place-detail?id=${place.id}" class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i> See detail
                                    </a>
                                    <small class="text-muted align-self-center">
                                        <fmt:formatDate value="${place.createdAt}" pattern="dd/MM/yyyy"/>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Pagination (if needed) -->
    <div class="row mt-4">
        <div class="col-12 text-center">
            <a href="search" class="btn btn-outline-primary">
                <i class="fas fa-search"></i> Search
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
</body>
</html>
