<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/19/2025
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Images - Travel Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="home">
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
    <!-- Back Button -->
    <div class="mb-3">
        <a href="home" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Return to place list
        </a>
    </div>

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

    <!-- Header Section -->
    <div class="row mb-4">
        <div class="col-md-8">
            <h2><i class="fas fa-images"></i> Manage Images</h2>
            <p class="text-muted">Add and manage images for place</p>
        </div>
        <div class="col-md-4 text-end">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addImageModal">
                <i class="fas fa-plus"></i> Add Image
            </button>
        </div>
    </div>

    <!-- Images Grid -->
    <div class="row">
        <c:forEach var="image" items="${images}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100">
                    <img src="data:image/jpeg;base64,${image.imageData}"
                         class="card-img-top" alt="Image"
                         style="height: 250px; object-fit: cover; cursor: pointer;"
                         onclick="showImageModal('data:image/jpeg;base64,${image.imageData}', '${image.description}')">

                    <div class="card-body">
                        <p class="card-text">${image.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted">
                                <i class="fas fa-star"></i> ${image.averageRating}/5
                                (${image.totalRatings} Ratings)
                            </small>
                            <button type="button" class="btn btn-outline-danger btn-sm"
                                    onclick="confirmDeleteImage(${image.id}, '${image.description}')">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Empty State -->
    <c:if test="${empty images}">
        <div class="text-center py-5">
            <i class="fas fa-images fa-4x text-muted mb-3"></i>
            <h4 class="text-muted">Nothing to show</h4>
            <p class="text-muted">Add more images for place</p>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addImageModal">
                <i class="fas fa-plus"></i> Add image
            </button>
        </div>
    </c:if>
</div>

<!-- Add Image Modal -->
<div class="modal fade" id="addImageModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Image</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="placeId" value="${placeId}">

                    <div class="mb-3">
                        <label for="image" class="form-label">Choose Image *</label>
                        <input type="file" class="form-control" id="image" name="image"
                               accept="image/*" required onchange="previewAddImage(this)">
                        <div class="form-text">15MB Max</div>
                    </div>

                    <!-- Image Preview -->
                    <div id="addImagePreview" class="mb-3" style="display: none;">
                        <img id="addPreview" src="" alt="Preview"
                             style="max-width: 100%; max-height: 200px; border-radius: 8px;">
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description"
                                  rows="3" maxlength="500" placeholder="Describe about this image..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Add Image
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Image View Modal -->
<div class="modal fade" id="imageViewModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">view Image</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img id="fullImage" src="" alt="Full Image" style="max-width: 100%; height: auto;">
                <p class="mt-3" id="fullImageDescription"></p>
            </div>
        </div>
    </div>
</div>

<!-- Delete Image Confirmation Modal -->
<div class="modal fade" id="deleteImageModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this image</p>
                <p class="text-muted" id="imageDescriptionToDelete"></p>
                <p class="text-danger">
                    <i class="fas fa-exclamation-triangle"></i>
                    This action cant be redone
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteImageForm" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="placeId" value="${placeId}">
                    <input type="hidden" name="imageId" id="imageIdToDelete">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function previewAddImage(input) {
        const preview = document.getElementById('addPreview');
        const previewDiv = document.getElementById('addImagePreview');

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
                previewDiv.style.display = 'block';
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            previewDiv.style.display = 'none';
        }
    }

    function showImageModal(imageSrc, description) {
        document.getElementById('fullImage').src = imageSrc;
        document.getElementById('fullImageDescription').textContent = description || 'Không có mô tả';
        new bootstrap.Modal(document.getElementById('imageViewModal')).show();
    }

    function confirmDeleteImage(imageId, description) {
        document.getElementById('imageIdToDelete').value = imageId;
        document.getElementById('imageDescriptionToDelete').textContent = description || 'Không có mô tả';
        new bootstrap.Modal(document.getElementById('deleteImageModal')).show();
    }
</script>
</body>
</html>
