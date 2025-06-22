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
    <title>Gallery Management - Travel Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary-color: #64748b;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --warning-color: #f59e0b;
            --info-color: #06b6d4;
            --light-bg: #f8fafc;
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --card-shadow-hover: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --border-radius: 12px;
            --gradient-bg: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gallery-overlay: linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 100%);
        }

        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--light-bg);
            color: #1e293b;
        }

        /* Navigation Styles */
        .navbar {
            background: var(--gradient-bg) !important;
            padding: 1rem 0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand i {
            font-size: 1.8rem;
            color: #fbbf24;
        }

        .nav-link {
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 8px;
            padding: 0.5rem 1rem !important;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-1px);
        }

        /* Breadcrumb Section */
        .breadcrumb-section {
            background: white;
            border-radius: var(--border-radius);
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--card-shadow);
            border-left: 4px solid var(--primary-color);
        }

        .breadcrumb {
            background: none;
            padding: 0;
            margin: 0;
        }

        .breadcrumb-item a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb-item.active {
            color: var(--secondary-color);
        }

        /* Header Section */
        .gallery-header {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--card-shadow);
            position: relative;
            overflow: hidden;
        }

        .gallery-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2, #f093fb, #f5576c);
        }

        .gallery-header h2 {
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .gallery-header .subtitle {
            color: var(--secondary-color);
            font-size: 1.1rem;
        }

        .header-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }

        /* Alert Improvements */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            font-weight: 500;
            box-shadow: var(--card-shadow);
            border-left: 4px solid;
        }

        .alert-success {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
            border-left-color: var(--success-color);
        }

        .alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
            border-left-color: var(--danger-color);
        }

        /* Button Styles */
        .btn {
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            padding: 0.6rem 1.2rem;
        }

        .btn-primary {
            background: var(--gradient-bg);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .btn-success:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
        }

        .btn-outline-secondary {
            border: 2px solid var(--secondary-color);
            color: var(--secondary-color);
        }

        .btn-outline-danger {
            border: 2px solid var(--danger-color);
            color: var(--danger-color);
        }

        /* Gallery Grid Styles */
        .gallery-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .gallery-item {
            background: white;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: all 0.4s ease;
            position: relative;
            group: hover;
        }

        .gallery-item:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: var(--card-shadow-hover);
        }

        .gallery-image-container {
            position: relative;
            height: 280px;
            overflow: hidden;
        }

        .gallery-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: all 0.4s ease;
            cursor: pointer;
        }

        .gallery-item:hover .gallery-image {
            transform: scale(1.1);
        }

        .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--gallery-overlay);
            opacity: 0;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
        }

        .gallery-item:hover .image-overlay {
            opacity: 1;
        }

        .gallery-content {
            padding: 1.5rem;
        }

        .gallery-description {
            color: var(--secondary-color);
            line-height: 1.6;
            margin-bottom: 1rem;
            min-height: 50px;
        }

        .gallery-stats {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .rating-display {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: white;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .reviews-count {
            color: var(--secondary-color);
            font-size: 0.9rem;
        }

        .gallery-actions {
            text-align: center;
            padding-top: 1rem;
            border-top: 1px solid #e2e8f0;
        }

        .delete-btn {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
            background: linear-gradient(135deg, #dc2626, #b91c1c);
        }

        /* Empty State */
        .empty-gallery {
            background: white;
            border-radius: var(--border-radius);
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            border: 2px dashed #cbd5e1;
            margin: 2rem 0;
        }

        .empty-gallery i {
            color: #cbd5e1;
            margin-bottom: 1.5rem;
        }

        .empty-gallery h4 {
            color: #64748b;
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .empty-gallery p {
            color: #94a3b8;
            margin-bottom: 2rem;
        }

        /* Modal Improvements */
        .modal-content {
            border-radius: var(--border-radius);
            border: none;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .modal-header {
            background: var(--gradient-bg);
            color: white;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            border-bottom: none;
            padding: 1.5rem;
        }

        .modal-header .btn-close {
            filter: invert(1);
        }

        .modal-body {
            padding: 2rem;
        }

        .modal-footer {
            padding: 1.5rem;
            border-top: 1px solid #e2e8f0;
        }

        /* Form Improvements */
        .form-label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #e2e8f0;
            padding: 0.75rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .image-preview {
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--card-shadow);
        }

        /* Upload Area */
        .upload-area {
            border: 2px dashed #cbd5e1;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        .upload-area:hover {
            border-color: var(--primary-color);
            background: #f1f5f9;
        }

        .upload-area.dragover {
            border-color: var(--success-color);
            background: #ecfdf5;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .gallery-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .gallery-header {
                padding: 1.5rem;
                text-align: center;
            }

            .gallery-header h2 {
                font-size: 1.5rem;
                justify-content: center;
            }

            .btn-group {
                flex-direction: column;
                gap: 0.5rem;
            }
        }

        /* Loading Animation */
        .loading-placeholder {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        /* Image View Modal Styles */
        .image-view-modal .modal-dialog {
            max-width: 90vw;
        }

        .image-view-modal .modal-body {
            padding: 0;
        }

        .image-view-modal img {
            border-radius: 0 0 var(--border-radius) var(--border-radius);
        }

        .image-description-panel {
            padding: 1.5rem;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
        }

        /* File Input Styling */
        .custom-file-input {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .custom-file-input input[type="file"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-input-label {
            display: block;
            padding: 0.75rem 1rem;
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .file-input-label:hover {
            border-color: var(--primary-color);
            background: #f8fafc;
        }

        .file-input-label i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="home">
            <i class="fas fa-compass"></i>
            <span>TravelGuide Pro</span>
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="../logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- Breadcrumb -->
    <div class="breadcrumb-section">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="home"><i class="fas fa-home me-1"></i>Dashboard</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    <i class="fas fa-images me-1"></i>Gallery Management
                </li>
            </ol>
        </nav>
    </div>

    <!-- Alert Messages -->
    <c:if test="${param.success != null}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i> ${param.success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i> ${param.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Header Section -->
    <div class="gallery-header">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2>
                    <div class="header-icon">
                        <i class="fas fa-camera"></i>
                    </div>
                    Gallery Management
                </h2>
                <p class="subtitle mb-0">Create stunning visual experiences for your destination</p>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#addImageModal">
                    <i class="fas fa-plus me-2"></i> Add New Image
                </button>
            </div>
        </div>
    </div>

    <!-- Gallery Grid -->
    <c:if test="${not empty images}">
        <div class="gallery-container">
            <c:forEach var="image" items="${images}">
                <div class="gallery-item">
                    <div class="gallery-image-container">
                        <img src="data:image/jpeg;base64,${image.imageData}"
                             class="gallery-image" alt="Destination Image"
                             onclick="showImageModal('data:image/jpeg;base64,${image.imageData}', '${image.description}')">
                        <div class="image-overlay">
                            <i class="fas fa-search-plus"></i>
                        </div>
                    </div>

                    <div class="gallery-content">
                        <p class="gallery-description">
                            <c:choose>
                                <c:when test="${not empty image.description}">
                                    ${image.description}
                                </c:when>
                                <c:otherwise>
                                    <em class="text-muted">No description provided</em>
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <div class="gallery-stats">
                            <div class="rating-display">
                                <i class="fas fa-star"></i>
                                <span>${image.averageRating}/5</span>
                            </div>
                            <div class="reviews-count">
                                    ${image.totalRatings} reviews
                            </div>
                        </div>

                        <div class="gallery-actions">
                            <button type="button" class="delete-btn"
                                    onclick="confirmDeleteImage(${image.id}, '${image.description}')">
                                <i class="fas fa-trash me-2"></i> Remove Image
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <!-- Empty State -->
    <c:if test="${empty images}">
        <div class="empty-gallery">
            <i class="fas fa-camera fa-5x"></i>
            <h4>Start Building Your Gallery</h4>
            <p>Upload beautiful images to showcase this destination and attract more visitors</p>
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#addImageModal">
                <i class="fas fa-upload me-2"></i> Upload Your First Image
            </button>
        </div>
    </c:if>
</div>

<!-- Add Image Modal -->
<div class="modal fade" id="addImageModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-upload me-2"></i>
                    Add New Gallery Image
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="placeId" value="${placeId}">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="image" class="form-label">
                                    <i class="fas fa-image me-2"></i>Choose Image *
                                </label>
                                <div class="custom-file-input">
                                    <input type="file" class="form-control" id="image" name="image"
                                           accept="image/*" required onchange="previewAddImage(this)">
                                    <label for="image" class="file-input-label">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                        Click to select image or drag & drop
                                    </label>
                                </div>
                                <div class="form-text">Maximum file size: 15MB. Supported formats: JPG, PNG, GIF</div>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">
                                    <i class="fas fa-align-left me-2"></i>Description
                                </label>
                                <textarea class="form-control" id="description" name="description"
                                          rows="4" maxlength="500"
                                          placeholder="Describe this image to help visitors understand what they're seeing..."></textarea>
                                <div class="form-text">
                                    <span id="charCount">0</span>/500 characters
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Image Preview -->
                            <div id="addImagePreview" class="mb-3" style="display: none;">
                                <label class="form-label">
                                    <i class="fas fa-eye me-2"></i>Preview
                                </label>
                                <div class="image-preview">
                                    <img id="addPreview" src="" alt="Preview"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-upload me-2"></i> Upload Image
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Image View Modal -->
<div class="modal fade image-view-modal" id="imageViewModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-image me-2"></i>Image Gallery View
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <img id="fullImage" src="" alt="Full Image" style="width: 100%; height: auto; max-height: 70vh; object-fit: contain;">
                <div class="image-description-panel">
                    <h6><i class="fas fa-info-circle me-2"></i>Description</h6>
                    <p id="fullImageDescription" class="mb-0"></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Delete Image Confirmation Modal -->
<div class="modal fade" id="deleteImageModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Confirm Image Deletion
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-3">
                    <i class="fas fa-trash-alt fa-3x text-danger mb-3"></i>
                    <h6>Are you sure you want to delete this image?</h6>
                </div>
                <div class="alert alert-warning">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <strong>Image:</strong> <span id="imageDescriptionToDelete"></span>
                </div>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <strong>Warning:</strong> This action cannot be undone. The image will be permanently removed from your gallery.
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Cancel
                </button>
                <form id="deleteImageForm" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="placeId" value="${placeId}">
                    <input type="hidden" name="imageId" id="imageIdToDelete">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash me-2"></i> Delete Permanently
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Image preview functionality
    function previewAddImage(input) {
        const preview = document.getElementById('addPreview');
        const previewDiv = document.getElementById('addImagePreview');

        if (input.files && input.files[0]) {
            const file = input.files[0];

            // Validate file size (15MB)
            if (file.size > 15 * 1024 * 1024) {
                alert('File size too large. Please select a file smaller than 15MB.');
                input.value = '';
                previewDiv.style.display = 'none';
                return;
            }

            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                previewDiv.style.display = 'block';
            };
            reader.readAsDataURL(file);
        } else {
            previewDiv.style.display = 'none';
        }
    }

    // Show full image modal
    function showImageModal(imageSrc, description) {
        document.getElementById('fullImage').src = imageSrc;
        document.getElementById('fullImageDescription').textContent = description || 'No description provided';
        new bootstrap.Modal(document.getElementById('imageViewModal')).show();
    }

    // Confirm delete image
    function confirmDeleteImage(imageId, description) {
        document.getElementById('imageIdToDelete').value = imageId;
        document.getElementById('imageDescriptionToDelete').textContent = description || 'No description';
        new bootstrap.Modal(document.getElementById('deleteImageModal')).show();
    }

    // Character counter for description
    document.getElementById('description').addEventListener('input', function() {
        const charCount = this.value.length;
        document.getElementById('charCount').textContent = charCount;

        // Change color based on character count
        const counter = document.getElementById('charCount');
        if (charCount > 450) {
            counter.style.color = '#ef4444';
        } else if (charCount > 350) {
            counter.style.color = '#f59e0b';
        } else {
            counter.style.color = '#10b981';
        }
    });

    // Drag and drop functionality
    const uploadArea = document.querySelector('.custom-file-input');
    const fileInput = document.getElementById('image');

    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        uploadArea.addEventListener(eventName, preventDefaults, false);
        document.body.addEventListener(eventName, preventDefaults, false);
    });

    ['dragenter', 'dragover'].forEach(eventName => {
        uploadArea.addEventListener(eventName, highlight, false);
    });

    ['dragleave', 'drop'].forEach(eventName => {
        uploadArea.addEventListener(eventName, unhighlight, false);
    });

    uploadArea.addEventListener('drop', handleDrop, false);

    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    function highlight(e) {
        uploadArea.classList.add('dragover');
    }

    function unhighlight(e) {
        uploadArea.classList.remove('dragover');
    }

    function handleDrop(e) {
        const dt = e.dataTransfer;
        const files = dt.files;

        if (files.length > 0) {
            fileInput.files = files;
            previewAddImage(fileInput);
        }
    }

    // Auto-dismiss alerts after 5 seconds
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert-dismissible');
        alerts.forEach(function(alert) {
            setTimeout(function() {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }, 5000);
        });
    });

    // Enhanced file validation
    function validateFile(file) {
        const maxSize = 15 * 1024 * 1024; // 15MB
        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];

        if (file.size > maxSize) {
            showNotification('File size too large. Please select a file smaller than 15MB.', 'error');
            return false;
        }

        if (!allowedTypes.includes(file.type)) {
            showNotification('Invalid file type. Please select a JPG, PNG, GIF, or WebP image.', 'error');
            return false;
        }

        return true;
    }

    // Show notification function
    function showNotification(message, type = 'info') {
        const alertClass = type === 'error' ? 'alert-danger' : 'alert-success';
        const icon = type === 'error' ? 'fa-exclamation-circle' : 'fa-check-circle';

        const notification = document.createElement('div');
        notification.className = `alert ${alertClass} alert-dismissible fade show position-fixed`;
        notification.style.cssText = 'top: 20px; right: 20px; z-index: 9999; max-width: 400px;';
        notification.innerHTML = `
        <i class="fas ${icon} me-2"></i> ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

        document.body.appendChild(notification);

        // Auto remove after 5 seconds
        setTimeout(() => {
            if (notification.parentNode) {
                const bsAlert = new bootstrap.Alert(notification);
                bsAlert.close();
            }
        }, 5000);
    }

    // Enhanced image preview with loading state
    function previewAddImage(input) {
        const preview = document.getElementById('addPreview');
        const previewDiv = document.getElementById('addImagePreview');
        const fileLabel = document.querySelector('.file-input-label');

        if (input.files && input.files[0]) {
            const file = input.files[0];

            // Validate file
            if (!validateFile(file)) {
                input.value = '';
                previewDiv.style.display = 'none';
                fileLabel.innerHTML = '<i class="fas fa-cloud-upload-alt"></i> Click to select image or drag & drop';
                return;
            }

            // Show loading state
            fileLabel.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Loading preview...';

            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                previewDiv.style.display = 'block';
                fileLabel.innerHTML = `<i class="fas fa-check text-success"></i> ${file.name}`;

                // Add file info
                const fileInfo = document.createElement('div');
                fileInfo.className = 'mt-2 text-muted small';
                fileInfo.innerHTML = `
                <i class="fas fa-info-circle me-1"></i>
                Size: ${formatFileSize(file.size)} | Type: ${file.type}
            `;

                // Remove existing file info
                const existingInfo = fileLabel.nextElementSibling;
                if (existingInfo && existingInfo.classList.contains('text-muted')) {
                    existingInfo.remove();
                }

                fileLabel.parentNode.insertBefore(fileInfo, fileLabel.nextSibling);
            };

            reader.onerror = function() {
                showNotification('Error reading file. Please try again.', 'error');
                previewDiv.style.display = 'none';
                fileLabel.innerHTML = '<i class="fas fa-cloud-upload-alt"></i> Click to select image or drag & drop';
            };

            reader.readAsDataURL(file);
        } else {
            previewDiv.style.display = 'none';
            fileLabel.innerHTML = '<i class="fas fa-cloud-upload-alt"></i> Click to select image or drag & drop';
        }
    }

    // Format file size helper
    function formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }

    // Enhanced modal functionality
    function showImageModal(imageSrc, description) {
        const modal = document.getElementById('imageViewModal');
        const fullImage = document.getElementById('fullImage');
        const descriptionElement = document.getElementById('fullImageDescription');

        // Show loading state
        fullImage.style.opacity = '0.5';
        fullImage.src = '';

        // Load image
        const img = new Image();
        img.onload = function() {
            fullImage.src = imageSrc;
            fullImage.style.opacity = '1';
        };
        img.onerror = function() {
            showNotification('Error loading image', 'error');
        };
        img.src = imageSrc;

        descriptionElement.textContent = description || 'No description provided';
        new bootstrap.Modal(modal).show();
    }

    // Enhanced delete confirmation
    function confirmDeleteImage(imageId, description) {
        const modal = document.getElementById('deleteImageModal');
        const descElement = document.getElementById('imageDescriptionToDelete');
        const idInput = document.getElementById('imageIdToDelete');

        idInput.value = imageId;
        descElement.textContent = description || 'Untitled Image';

        new bootstrap.Modal(modal).show();
    }

    // Form submission with loading state
    document.addEventListener('DOMContentLoaded', function() {
        const forms = document.querySelectorAll('form');

        forms.forEach(form => {
            form.addEventListener('submit', function(e) {
                const submitBtn = this.querySelector('button[type="submit"]');
                if (submitBtn) {
                    // Store original content
                    const originalContent = submitBtn.innerHTML;

                    // Show loading state
                    submitBtn.disabled = true;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i> Processing...';

                    // Re-enable after delay (in case of validation errors)
                    setTimeout(() => {
                        submitBtn.disabled = false;
                        submitBtn.innerHTML = originalContent;
                    }, 3000);
                }
            });
        });
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // ESC to close modals
        if (e.key === 'Escape') {
            const openModals = document.querySelectorAll('.modal.show');
            openModals.forEach(modal => {
                bootstrap.Modal.getInstance(modal)?.hide();
            });
        }

        // Ctrl/Cmd + U to open upload modal
        if ((e.ctrlKey || e.metaKey) && e.key === 'u') {
            e.preventDefault();
            const uploadModal = document.getElementById('addImageModal');
            new bootstrap.Modal(uploadModal).show();
        }
    });

    // Gallery item animations on scroll
    function animateOnScroll() {
        const galleryItems = document.querySelectorAll('.gallery-item');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });

        galleryItems.forEach((item, index) => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(30px)';
            item.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
            observer.observe(item);
        });
    }

    // Image lazy loading for better performance
    function setupLazyLoading() {
        const images = document.querySelectorAll('.gallery-image');

        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.classList.add('loaded');
                        imageObserver.unobserve(img);
                    }
                });
            });

            images.forEach(img => imageObserver.observe(img));
        }
    }

    // Initialize all functionality when DOM is loaded
    document.addEventListener('DOMContentLoaded', function() {
        animateOnScroll();
        setupLazyLoading();

        // Initialize tooltips if Bootstrap tooltips are available
        if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        }
    });

    // Image compression before upload (optional)
    function compressImage(file, maxWidth = 1920, quality = 0.8) {
        return new Promise((resolve) => {
            const canvas = document.createElement('canvas');
            const ctx = canvas.getContext('2d');
            const img = new Image();

            img.onload = function() {
                const ratio = Math.min(maxWidth / img.width, maxWidth / img.height);
                canvas.width = img.width * ratio;
                canvas.height = img.height * ratio;

                ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                canvas.toBlob(resolve, 'image/jpeg', quality);
            };

            img.src = URL.createObjectURL(file);
        });
    }

    // Search and filter functionality (if needed)
    function filterGallery(searchTerm) {
        const galleryItems = document.querySelectorAll('.gallery-item');
        const lowercaseSearch = searchTerm.toLowerCase();

        galleryItems.forEach(item => {
            const description = item.querySelector('.gallery-description').textContent.toLowerCase();
            const isVisible = description.includes(lowercaseSearch);

            item.style.display = isVisible ? 'block' : 'none';
        });
    }

    // Export functions for global access
    window.galleryFunctions = {
        previewAddImage,
        showImageModal,
        confirmDeleteImage,
        filterGallery,
        compressImage
    };
</script>