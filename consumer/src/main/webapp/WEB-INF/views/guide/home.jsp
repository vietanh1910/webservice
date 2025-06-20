<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/19/2025
  Time: 5:51 PM
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
    <title>Guide Dashboard - Travel Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-map-marked-alt"></i> Travel Service - Guide
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="../logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Alert Messages -->
    <c:if test="${param.success != null}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> ${param.success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> ${param.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <c:if test="${error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Header Section -->
    <div class="row mb-4">
        <div class="col-md-8">
            <h2><i class="fas fa-map-marker-alt"></i> Manage Your Places</h2>
            <p class="text-muted">Add, edit and manage information about tourist attraction</p>
        </div>
        <div class="col-md-4 text-end">
            <a href="add-place" class="btn btn-success">
                <i class="fas fa-plus"></i> Add New Place
            </a>
        </div>
    </div>

    <!-- Places Grid -->
    <div class="row">
        <c:forEach var="place" items="${places}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100">
                    <c:if test="${place.imageUrls != null}">
                        <img src="data:image/jpeg;base64,${place.imageUrls[0]}"
                             class="card-img-top" alt="${place.placeName}"
                             style="height: 200px; object-fit: cover;">
                    </c:if>
                    <c:if test="${place.imageUrls == null}">
                        <div class="card-img-top bg-light d-flex align-items-center justify-content-center"
                             style="height: 200px;">
                            <i class="fas fa-image fa-3x text-muted"></i>
                        </div>
                    </c:if>

                    <div class="card-body">
                        <h5 class="card-title">${place.placeName}</h5>
                        <p class="card-text">
                            <small class="text-muted">
                                <i class="fas fa-map-pin"></i> ${place.address}
                            </small>
                        </p>
                        <p class="card-text">${place.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted">
                                <i class="fas fa-star"></i> ${place.averageRating}/5
                                (${place.totalRatings} ratings)
                            </small>
                        </div>
                    </div>

                    <div class="card-footer">
                        <div class="btn-group w-100" role="group">
                            <a href="edit-place?id=${place.id}" class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="manage-images?placeId=${place.id}" class="btn btn-outline-info btn-sm">
                                <i class="fas fa-images"></i> Image
                            </a>
                            <button type="button" class="btn btn-outline-danger btn-sm"
                                    onclick="confirmDelete(${place.id}, '${place.placeName}')">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Empty State -->
    <c:if test="${empty places}">
        <div class="text-center py-5">
            <i class="fas fa-map-marked-alt fa-4x text-muted mb-3"></i>
            <h4 class="text-muted">Noting to show</h4>
            <p class="text-muted">Add your place to show for tourist</p>
            <a href="add-place" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add place
            </a>
        </div>
    </c:if>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this? <strong id="placeName"></strong>?</p>
                <p class="text-danger">
                    <i class="fas fa-exclamation-triangle"></i>
                    This action cant be redone
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteForm" method="post" action="delete-place" style="display: inline;">
                    <input type="hidden" name="placeId" id="placeIdToDelete">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash"></i> Xóa
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(placeId, placeName) {
        document.getElementById('placeIdToDelete').value = placeId;
        document.getElementById('placeName').textContent = placeName;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
    }
</script>
</body>
</html>
