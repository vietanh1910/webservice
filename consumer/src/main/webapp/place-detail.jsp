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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${place.name} - Detail</title>
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
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="search">Search</a></li>
            <li class="breadcrumb-item active">${place.name}</li>
        </ol>
    </nav>

    <!-- Place Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h1 class="card-title">${place.name}</h1>
                            <p class="text-muted">
                                <i class="fas fa-map-marker-alt"></i> ${place.address}
                            </p>
                            <span class="badge bg-info">${place.category}</span>
                        </div>
                        <div class="text-end">
                            <c:if test="${place.averageRating > 0}">
                                <div class="mb-2">
                                        <span class="text-warning fs-5">
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
                                    <div class="text-muted small">
                                        <fmt:formatNumber value="${place.averageRating}" pattern="0.0"/> / 5.0
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <p class="card-text mt-3">${place.description}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Images Section -->
        <div class="col-lg-8">
            <c:if test="${not empty images}">
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Image (${images.size()})</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <c:forEach var="image" items="${images}">
                        <div class="col-md-6 mb-3">
                            <div class="card">
                                <img src="${image.imageUrl}" class="card-img-top" alt="${image.caption}"
                                     style="height: 200px; object-fit: cover;">
                                <div class="card-body">
                                    <p class="card-text small">${image.caption}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            <fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </small>
                                    </div>
                                    <p class="mb-0 small">${comment.content}</p>
                                </div>
                                </c:forEach>
                            </div>
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
                            <h5 class="modal-title">Rating</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <form action="rating" method="post">
                            <div class="modal-body">
                                <input type="hidden" name="placeId" value="${place.id}">
                                <input type="hidden" name="imageId" id="imageId">
                                <input type="hidden" name="infoId" id="infoId">

                                <div class="mb-3">
                                    <label class="form-label">Place rating (1 to 5 stars)</label>
                                    <div class="rating-stars">
                                        <input type="radio" name="rating" value="1" id="star1">
                                        <label for="star1" class="star">★</label>
                                        <input type="radio" name="rating" value="2" id="star2">
                                        <label for="star2" class="star">★</label>
                                        <input type="radio" name="rating" value="3" id="star3">
                                        <label for="star3" class="star">★</label>
                                        <input type="radio" name="rating" value="4" id="star4">
                                        <label for="star4" class="star">★</label>
                                        <input type="radio" name="rating" value="5" id="star5">
                                        <label for="star5" class="star">★</label>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="comment" class="form-label">Feedback (optional)</label>
                                    <textarea class="form-control" name="comment" id="comment" rows="3"
                                              placeholder="Share your view..."></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Send feedback</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>

            <style>
                .rating-stars {
                    display: flex;
                    flex-direction: row-reverse;
                    justify-content: flex-end;
                }

                .rating-stars input[type="radio"] {
                    display: none;
                }

                .rating-stars label {
                    cursor: pointer;
                    font-size: 2rem;
                    color: #ddd;
                    transition: color 0.2s;
                }

                .rating-stars label:hover,
                .rating-stars label:hover ~ label,
                .rating-stars input[type="radio"]:checked ~ label {
                    color: #ffc107;
                }
            </style>

            <script>
                function showRatingModal(type, id, placeId) {
                    // Reset form
                    document.getElementById('imageId').value = '';
                    document.getElementById('infoId').value = '';

                    // Set appropriate ID based on type
                    if (type === 'image') {
                        document.getElementById('imageId').value = id;
                    } else if (type === 'info') {
                        document.getElementById('infoId').value = id;
                    }

                    // Show modal
                    var modal = new bootstrap.Modal(document.getElementById('ratingModal'));
                    modal.show();
                }
            </script>
</body>
</html>
