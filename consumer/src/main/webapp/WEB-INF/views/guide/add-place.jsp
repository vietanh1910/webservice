<%--
  Created by IntelliJ IDEA.
  User: Quang Minh
  Date: 6/19/2025
  Time: 5:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Destination - TravelGuide Pro</title>
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
            background-color: var(--light-bg);
            color: #1e293b;
            min-height: 100vh;
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

        /* Form Container */
        .form-container {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            margin-top: 2rem;
            border: 1px solid #e2e8f0;
        }

        .form-header {
            background: var(--gradient-bg);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .form-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="white" stroke-width="0.5" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
        }

        .form-header h2 {
            position: relative;
            z-index: 2;
            margin: 0;
            font-weight: 700;
            font-size: 2rem;
        }

        .form-header p {
            position: relative;
            z-index: 2;
            margin: 0.5rem 0 0 0;
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .form-header i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #fbbf24;
        }

        /* Back Button */
        .back-button {
            background: white;
            border: 2px solid #e2e8f0;
            color: var(--secondary-color);
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-button:hover {
            background: #f1f5f9;
            border-color: var(--primary-color);
            color: var(--primary-color);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.15);
        }

        /* Form Styles */
        .form-body {
            padding: 2.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--primary-color);
            width: 16px;
        }

        .form-control, .form-select {
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            outline: none;
        }

        .form-text {
            color: var(--secondary-color);
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .form-text i {
            color: var(--info-color);
        }

        /* Image Upload Section */
        .image-upload-section {
            background: #f8fafc;
            border: 2px dashed #cbd5e1;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .image-upload-section:hover {
            border-color: var(--primary-color);
            background: rgba(37, 99, 235, 0.05);
        }

        .image-upload-section.has-image {
            border-style: solid;
            border-color: var(--success-color);
            background: rgba(16, 185, 129, 0.05);
        }

        .upload-icon {
            font-size: 3rem;
            color: #cbd5e1;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .image-upload-section:hover .upload-icon {
            color: var(--primary-color);
            transform: scale(1.1);
        }

        .image-preview {
            max-width: 100%;
            max-height: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .image-preview:hover {
            transform: scale(1.02);
        }

        /* Button Styles */
        .btn {
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            padding: 0.75rem 2rem;
            font-size: 1rem;
        }

        .btn-primary {
            background: var(--gradient-bg);
            border: none;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #6b7280;
            color: white;
        }

        .btn-secondary:hover {
            background: #4b5563;
            transform: translateY(-1px);
        }

        /* Alert Styles */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            font-weight: 500;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
        }

        .alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }

        /* Progress Steps */
        .form-steps {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
            padding: 1rem;
            background: #f8fafc;
            border-radius: 10px;
        }

        .step {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            background: white;
            color: var(--secondary-color);
            font-weight: 500;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .step.active {
            background: var(--primary-color);
            color: white;
        }

        .step i {
            font-size: 1.1rem;
        }

        /* Character Counter */
        .char-counter {
            text-align: right;
            font-size: 0.8rem;
            color: var(--secondary-color);
            margin-top: 0.25rem;
        }

        .char-counter.warning {
            color: var(--warning-color);
        }

        .char-counter.danger {
            color: var(--danger-color);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-body {
                padding: 1.5rem;
            }

            .form-header {
                padding: 1.5rem;
            }

            .form-header h2 {
                font-size: 1.5rem;
            }

            .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .form-steps {
                flex-direction: column;
                gap: 0.5rem;
            }
        }

        /* Loading Animation */
        .uploading {
            position: relative;
            overflow: hidden;
        }

        .uploading::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            animation: shimmer 1.5s infinite;
        }

        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="home">
            <i class="fas fa-compass"></i>
            <span>TravelGuide Pro</span>
        </a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-10 col-lg-8">
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
            <div class="form-container">
                <div class="form-header">
                    <i class="fas fa-map-marked-alt"></i>
                    <h2>Create New Destination</h2>
                    <p>Share amazing places with travelers around the world</p>
                </div>

                <div class="form-body">
                    <!-- Progress Steps -->
                    <div class="form-steps">
                        <div class="step active">
                            <i class="fas fa-info-circle"></i>
                            <span>Basic Info</span>
                        </div>
                        <div class="step">
                            <i class="fas fa-image"></i>
                            <span>Photos</span>
                        </div>
                        <div class="step">
                            <i class="fas fa-check-circle"></i>
                            <span>Review</span>
                        </div>
                    </div>

                    <form method="post" enctype="multipart/form-data" id="destinationForm">
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label for="name" class="form-label">
                                    <i class="fas fa-map-marker-alt"></i>
                                    Destination Name *
                                </label>
                                <input type="text" class="form-control" id="name" name="name"
                                       required maxlength="255" value="${param.name}"
                                       placeholder="Enter destination name...">
                                <div class="form-text">
                                    <i class="fas fa-info-circle"></i>
                                    Choose a memorable and descriptive name
                                </div>
                                <div class="char-counter" id="nameCounter">0/255</div>
                            </div>

                            <div class="col-md-6 mb-4">
                                <label for="location" class="form-label">
                                    <i class="fas fa-globe"></i>
                                    Location *
                                </label>
                                <input type="text" class="form-control" id="location" name="location"
                                       required maxlength="255" value="${param.location}"
                                       placeholder="City, Country">
                                <div class="form-text">
                                    <i class="fas fa-lightbulb"></i>
                                    Example: Hanoi, Vietnam
                                </div>
                                <div class="char-counter" id="locationCounter">0/255</div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="category" class="form-label">
                                <i class="fas fa-tags"></i>
                                Category *
                            </label>
                            <select class="form-select" id="category" name="category" required>
                                <option value="">Choose a category...</option>
                                <option value="Tourist Attraction" ${param.category == 'Tourist Attraction' ? 'selected' : ''}>
                                    🏛 Tourist Attraction
                                </option>
                                <option value="Restaurant" ${param.category == 'Restaurant' ? 'selected' : ''}>
                                    🍽 Restaurant
                                </option>
                                <option value="Hotel" ${param.category == 'Hotel' ? 'selected' : ''}>
                                    🏨 Hotel
                                </option>
                                <option value="Shopping" ${param.category == 'Shopping' ? 'selected' : ''}>
                                    🛍 Shopping
                                </option>
                                <option value="Entertainment" ${param.category == 'Entertainment' ? 'selected' : ''}>
                                    🎭 Entertainment
                                </option>
                                <option value="Nature" ${param.category == 'Nature' ? 'selected' : ''}>
                                    🌲 Nature
                                </option>
                                <option value="Culture" ${param.category == 'Culture' ? 'selected' : ''}>
                                    🏛 Culture
                                </option>
                            </select>
                            <div class="form-text">
                                <i class="fas fa-filter"></i>
                                Help travelers find your destination easier
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="form-label">
                                <i class="fas fa-align-left"></i>
                                Description *
                            </label>
                            <textarea class="form-control" id="description" name="description"
                                      rows="5" required maxlength="1000"
                                      placeholder="Describe what makes this destination special...">${param.description}</textarea>
                            <div class="form-text">
                                <i class="fas fa-pen"></i>
                                Paint a vivid picture that inspires travelers to visit
                            </div>
                            <div class="char-counter" id="descCounter">0/1000</div>
                        </div>

                        <div class="mb-4">
                            <label for="information" class="form-label">
                                <i class="fas fa-align-left"></i>
                                Detail information *
                            </label>
                            <textarea class="form-control" id="information" name="information"
                                      rows="5" required maxlength="1000"
                                      placeholder="Detail Information ... ">${param.information}</textarea>
                            <div class="form-text">
                                <i class="fas fa-pen"></i>
                                Paint a vivid picture that inspires travelers to visit
                            </div>
                            <div class="char-counter" id="infoCounter">0/1000</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">
                                <i class="fas fa-camera"></i>
                                Featured Photo
                            </label>
                            <div class="image-upload-section" onclick="document.getElementById('image').click()">
                                <input type="file" class="form-control" id="image" name="image"
                                       accept="image/*" onchange="previewImage(this)">

                                <div id="uploadPlaceholder">
                                    <div class="upload-icon">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </div>
                                    <h5>Click to upload your best photo</h5>
                                    <p class="text-muted mb-0">PNG, JPG up to 10MB</p>
                                </div>

                                <!-- Image Preview -->
                                <div id="imagePreview" style="display: none;">
                                    <img id="preview" src="" alt="Preview" class="image-preview">
                                    <p class="mt-3 mb-0 text-success">
                                        <i class="fas fa-check-circle"></i>
                                        Photo uploaded successfully!
                                    </p>
                                </div>
                            </div>
                            <div class="form-text">
                                <i class="fas fa-magic"></i>
                                Choose a stunning photo that showcases your destination
                            </div>
                        </div>

                        <div class="d-flex flex-column flex-md-row gap-3 justify-content-end">
                            <a href="home" class="btn btn-secondary">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn btn-primary" id="submitBtn">
                                <i class="fas fa-rocket me-2"></i>Create Destination
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
    // Character counters
    function updateCharCounter(inputId, counterId, maxLength) {
        const input = document.getElementById(inputId);
        const counter = document.getElementById(counterId);

        function update() {
            const length = input.value.length;
            counter.textContent = ${length}/${maxLength};

            if (length > maxLength * 0.9) {
                counter.className = 'char-counter danger';
            } else if (length > maxLength * 0.8) {
                counter.className = 'char-counter warning';
            } else {
                counter.className = 'char-counter';
            }
        }

        input.addEventListener('input', update);
        update();
    }

    // Initialize character counters
    updateCharCounter('name', 'nameCounter', 255);
    updateCharCounter('location', 'locationCounter', 255);
    updateCharCounter('description', 'descCounter', 1000);
    updateCharCounter('information', 'infoCounter', 1000);

    // Image preview function
    function previewImage(input) {
        const preview = document.getElementById('preview');
        const previewDiv = document.getElementById('imagePreview');
        const placeholder = document.getElementById('uploadPlaceholder');
        const uploadSection = document.querySelector('.image-upload-section');

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            // Add loading state
            uploadSection.classList.add('uploading');

            reader.onload = function(e) {
                preview.src = e.target.result;
                placeholder.style.display = 'none';
                previewDiv.style.display = 'block';
                uploadSection.classList.add('has-image');
                uploadSection.classList.remove('uploading');
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            placeholder.style.display = 'block';
            previewDiv.style.display = 'none';
            uploadSection.classList.remove('has-image');
        }
    }

    // Form validation and submission
    document.getElementById('destinationForm').addEventListener('submit', function(e) {
        const submitBtn = document.getElementById('submitBtn');

        // Add loading state
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Creating...';
        submitBtn.disabled = true;

        // Re-enable button after 3 seconds in case of error
        setTimeout(() => {
            submitBtn.innerHTML = '<i class="fas fa-rocket me-2"></i>Create Destination';
            submitBtn.disabled = false;
        }, 3000);
    });

    // Smooth animations
    document.addEventListener('DOMContentLoaded', function() {
        // Animate form elements on load
        const elements = document.querySelectorAll('.form-body > *');
        elements.forEach((el, index) => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';

            setTimeout(() => {
                el.style.transition = 'all 0.6s ease';
                el.style.opacity = '1';
                el.style.transform = 'translateY(0)';
            }, index * 100);
        });
    });

    // Add focus effects
    document.querySelectorAll('.form-control, .form-select').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-2px)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    });
</script>
</body>
</html>