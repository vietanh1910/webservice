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
    <title>${not empty place ? 'Edit' : 'Add'} Place - TravelGuide Pro</title>
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
        }

        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #1e293b;
        }

        /* Navigation Styles */
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            padding: 1rem 0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-color) !important;
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
            color: var(--primary-color) !important;
        }

        .nav-link:hover {
            background-color: rgba(37, 99, 235, 0.1);
            transform: translateY(-1px);
        }

        /* Main Container */
        .main-container {
            background: var(--light-bg);
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            margin-top: 2rem;
            min-height: calc(100vh - 120px);
            padding: 2rem 0;
        }

        /* Back Button */
        .back-button {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: var(--border-radius);
            padding: 0.75rem 1.5rem;
            color: var(--secondary-color);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: var(--card-shadow);
        }

        .back-button:hover {
            color: var(--primary-color);
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: var(--card-shadow-hover);
            background: #f8fafc;
        }

        /* Alert Improvements */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            font-weight: 500;
            box-shadow: var(--card-shadow);
            backdrop-filter: blur(10px);
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(254, 226, 226, 0.9), rgba(254, 202, 202, 0.9));
            color: #991b1b;
            border-left: 4px solid var(--danger-color);
        }

        /* Form Card */
        .form-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow-hover);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }

        .form-card .card-header {
            background: var(--gradient-bg);
            color: white;
            padding: 2rem;
            border-bottom: none;
        }

        .form-card .card-header h4 {
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .form-card .card-header i {
            font-size: 1.5rem;
            color: #fbbf24;
        }

        .form-card .card-body {
            padding: 2.5rem;
        }

        /* Form Controls */
        .form-label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control, .form-select {
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #fafbfc;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            background: white;
        }

        .form-text {
            color: var(--secondary-color);
            font-size: 0.85rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-text i {
            color: var(--info-color);
        }

        /* Image Preview */
        .image-preview-container {
            border: 2px dashed #cbd5e1;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            background: #f8fafc;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .image-preview-container.has-image {
            border-color: var(--success-color);
            background: rgba(16, 185, 129, 0.05);
        }

        .image-preview-container img {
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease;
        }

        .image-preview-container img:hover {
            transform: scale(1.02);
        }

        .upload-placeholder {
            color: var(--secondary-color);
            padding: 2rem;
        }

        .upload-placeholder i {
            font-size: 3rem;
            color: #cbd5e1;
            margin-bottom: 1rem;
        }

        /* Buttons */
        .btn {
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            padding: 0.75rem 1.5rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: var(--gradient-bg);
            border: none;
            box-shadow: var(--card-shadow);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #f1f5f9;
            color: var(--secondary-color);
            border: 2px solid #e2e8f0;
        }

        .btn-secondary:hover {
            background: #e2e8f0;
            color: #475569;
            transform: translateY(-1px);
        }

        .btn-lg {
            padding: 1rem 2rem;
            font-size: 1.1rem;
        }

        /* Form Animation */
        .form-group {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease forwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Required Field Indicator */
        .required-field::after {
            content: '*';
            color: var(--danger-color);
            margin-left: 0.25rem;
            font-weight: bold;
        }

        /* Character Counter */
        .char-counter {
            font-size: 0.8rem;
            color: var(--secondary-color);
            text-align: right;
            margin-top: 0.25rem;
        }

        .char-counter.warning {
            color: var(--warning-color);
        }

        .char-counter.danger {
            color: var(--danger-color);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-container {
                margin-top: 1rem;
                border-radius: 0;
            }

            .form-card .card-header {
                padding: 1.5rem;
            }

            .form-card .card-body {
                padding: 1.5rem;
            }

            .btn-group-responsive {
                flex-direction: column;
                gap: 0.5rem;
            }

            .btn-group-responsive .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
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

<div class="main-container">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">

                <!-- Back Button -->
                <div class="mb-4">
                    <a href="home" class="back-button">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>

                <!-- Error Message -->
                <c:if test="${error != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Form Card -->
                <div class="card form-card">
                    <div class="card-header">
                        <h4>
                            <i class="fas fa-${not empty place ? 'edit' : 'plus'}"></i>
                            ${not empty place ? 'Edit Destination' : 'Add New Destination'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data" action="${not empty place ? 'edit-place' : 'add-place'}">
                            <!-- Hidden ID nếu cập nhật -->
                            <c:if test="${not empty place}">
                                <input type="hidden" name="id" value="${place.id}" />
                            </c:if>

                            <!-- Name -->
                            <div class="mb-4 form-group">
                                <label for="placeName" class="form-label required-field">Destination Name</label>
                                <input type="text" class="form-control" id="placeName" name="placeName"
                                       required maxlength="255"
                                       value="${place.placeName != null ? place.placeName : ''}"
                                       placeholder="Enter the destination name">
                            </div>

                            <!-- Address -->
                            <div class="mb-4 form-group">
                                <label for="address" class="form-label required-field">Location</label>
                                <input type="text" class="form-control" id="address" name="address"
                                       required maxlength="255"
                                       value="${place.address != null ? place.address : ''}"
                                       placeholder="e.g., Hanoi, Vietnam">
                            </div>

                            <!-- Description -->
                            <div class="mb-4 form-group">
                                <label for="description" class="form-label required-field">Description</label>
                                <textarea class="form-control" id="description" name="description"
                                          rows="5" required maxlength="1000"
                                          placeholder="Describe this destination">${place.description != null ? place.description : ''}</textarea>
                            </div>

                            <!-- Ảnh hiện có (khi update) -->
                            <c:if test="${not empty place.imageUrls}">
                                <div class="mb-3">
                                    <label class="form-label">Current Image:</label>
                                    <img src="${pageContext.request.contextPath}/${place.imageUrls[0]}"
                                         class="img-fluid rounded" style="max-height: 300px;"
                                         alt="Current Image" />
                                </div>
                            </c:if>

                            <!-- Upload ảnh mới -->
                            <div class="mb-4 form-group">
                                <label for="image" class="form-label">Upload New Image</label>
                                <input type="file" class="form-control" id="image" name="image"
                                       accept="image/*" onchange="previewImage(this)">
                                <div class="form-text">
                                    ${not empty place ? 'Upload a new image to replace the current one' : 'Upload a destination photo (optional)'}
                                </div>

                                <!-- Preview ảnh vừa chọn -->
                                <div class="mt-3" id="imagePreview" style="display: none;">
                                    <label class="form-label">Preview:</label>
                                    <img id="preview" src="" alt="Preview"
                                         style="max-width: 100%; max-height: 300px;" />
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="home" class="btn btn-secondary btn-lg">
                                    <i class="fas fa-times"></i> Cancel
                                </a>
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-save"></i>
                                    ${not empty place ? 'Update Destination' : 'Create Destination'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Image Preview Function
    function previewImage(input) {
        const preview = document.getElementById('preview');
        const placeholder = document.getElementById('uploadPlaceholder');
        const container = document.getElementById('imagePreview');

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                placeholder.style.display = 'none';
                container.classList.add('has-image');
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            preview.style.display = 'none';
            placeholder.style.display = 'block';
            container.classList.remove('has-image');
        }
    }

    // Character Counter
    document.addEventListener('DOMContentLoaded', function() {
        const textarea = document.getElementById('description');
        const counter = document.getElementById('charCounter');

        function updateCounter() {
            const length = textarea.value.length;
            const maxLength = 1000;
            counter.textContent = `${length}/${maxLength}`;

            // Update counter color based on usage
            counter.classList.remove('warning', 'danger');
            if (length > maxLength * 0.8) {
                counter.classList.add('warning');
            }
            if (length > maxLength * 0.95) {
                counter.classList.add('danger');
            }
        }

        textarea.addEventListener('input', updateCounter);
        updateCounter(); // Initial count
    });

    // Form Enhancement
    document.addEventListener('DOMContentLoaded', function() {
        // Add floating labels effect
        const formControls = document.querySelectorAll('.form-control');
        formControls.forEach(control => {
            control.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            control.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });

        // Smooth scroll to form on page load
        if (window.location.hash === '') {
            document.querySelector('.form-card').scrollIntoView({
                behavior: 'smooth',
                block: 'center'
            });
        }
    });

    // Form Validation Enhancement
    document.querySelector('form').addEventListener('submit', function(e) {
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;

        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
        submitBtn.disabled = true;

        // Re-enable button after 3 seconds if form submission fails
        setTimeout(() => {
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;
        }, 3000);
    });
</script>
</body>
</html>