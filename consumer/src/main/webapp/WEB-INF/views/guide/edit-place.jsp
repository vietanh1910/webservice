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
    <title>Edit Place - Travel Service</title>
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
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- Back Button -->
            <div class="mb-3">
                <a href="home" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Return
                </a>
            </div>

            <!-- Error Message -->
            <c:if test="${error != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Form Card -->
            <div class="card">
                <div class="card-header">
                    <h4><i class="fas fa-plus"></i> Add New Place</h4>
                </div>
                <div class="card-body">
                    <form method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="name" class="form-label">Place's Name *</label>
                            <input type="text" class="form-control" id="name" name="name"
                                   required maxlength="255" value="${param.name}">
                        </div>

                        <div class="mb-3">
                            <label for="location" class="form-label">Location *</label>
                            <input type="text" class="form-control" id="location" name="location"
                                   required maxlength="255" value="${param.location}">
                            <div class="form-text">Ví dụ: Hà Nội, Việt Nam</div>
                        </div>

                        <div class="mb-3">
                            <label for="category" class="form-label">Category *</label>
                            <select class="form-select" id="category" name="category" required>
                                <option value="">Chọn danh mục</option>
                                <option value="Tourist Attraction" ${param.category == 'Tourist Attraction' ? 'selected' : ''}>
                                    Tourist Attraction
                                </option>
                                <option value="Restaurant" ${param.category == 'Restaurant' ? 'selected' : ''}>
                                    Restaurant
                                </option>
                                <option value="Hotel" ${param.category == 'Hotel' ? 'selected' : ''}>
                                    Hotel
                                </option>
                                <option value="Shopping" ${param.category == 'Shopping' ? 'selected' : ''}>
                                    Shopping
                                </option>
                                <option value="Entertainment" ${param.category == 'Entertainment' ? 'selected' : ''}>
                                    Entertainment
                                </option>
                                <option value="Nature" ${param.category == 'Nature' ? 'selected' : ''}>
                                    Nature
                                </option>
                                <option value="Culture" ${param.category == 'Culture' ? 'selected' : ''}>
                                    Culture
                                </option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả *</label>
                            <textarea class="form-control" id="description" name="description"
                                      rows="4" required maxlength="1000">${param.description}</textarea>
                            <div class="form-text">Detailed Description</div>
                        </div>

                        <div class="mb-3">
                            <label for="image" class="form-label">Avatar</label>
                            <input type="file" class="form-control" id="image" name="image"
                                   accept="image/*" onchange="previewImage(this)">
                            <div class="form-text">Choose avatar for place</div>

                            <!-- Image Preview -->
                            <div id="imagePreview" class="mt-3" style="display: none;">
                                <img id="preview" src="" alt="Preview"
                                     style="max-width: 100%; max-height: 300px; border-radius: 8px;">
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="home" class="btn btn-secondary">Hủy</a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Submit
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function previewImage(input) {
        const preview = document.getElementById('preview');
        const previewDiv = document.getElementById('imagePreview');

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
</script>
</body>
</html>
