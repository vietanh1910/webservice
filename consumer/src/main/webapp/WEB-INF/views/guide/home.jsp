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

        /* Header Section */
        .header-section {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--card-shadow);
            border-left: 4px solid var(--primary-color);
        }

        .header-section h2 {
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .header-section .subtitle {
            color: var(--secondary-color);
            font-size: 1.1rem;
        }

        /* Stats Cards */
        .stats-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .stats-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-shadow-hover);
        }

        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1rem;
        }

        .stats-icon.places { background: linear-gradient(135deg, #667eea, #764ba2); }
        .stats-icon.ratings { background: linear-gradient(135deg, #f093fb, #f5576c); }
        .stats-icon.views { background: linear-gradient(135deg, #4facfe, #00f2fe); }

        /* Alert Improvements */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            font-weight: 500;
            box-shadow: var(--card-shadow);
        }

        .alert-success {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
        }

        .alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
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

        .btn-outline-primary {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline-primary:hover {
            background: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-outline-info {
            border: 2px solid var(--info-color);
            color: var(--info-color);
        }

        .btn-outline-danger {
            border: 2px solid var(--danger-color);
            color: var(--danger-color);
        }

        /* Card Improvements */
        .place-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }

        .place-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--card-shadow-hover);
        }

        .place-card .card-img-top {
            border-radius: 0;
            position: relative;
            overflow: hidden;
        }

        .place-card .card-img-top::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.1) 100%);
        }

        .place-card .card-body {
            padding: 1.5rem;
        }

        .place-card .card-title {
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.75rem;
            font-size: 1.1rem;
        }

        .place-card .card-text {
            color: var(--secondary-color);
            line-height: 1.6;
        }

        .rating-badge {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }

        .place-address {
            color: var(--secondary-color);
            font-size: 0.9rem;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .place-address i {
            color: var(--primary-color);
        }

        .card-footer {
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
            padding: 1rem 1.5rem;
        }

        .btn-group .btn {
            font-size: 0.85rem;
            padding: 0.4rem 0.8rem;
        }

        /* Empty State */
        .empty-state {
            background: white;
            border-radius: var(--border-radius);
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            border: 2px dashed #cbd5e1;
        }

        .empty-state i {
            color: #cbd5e1;
            margin-bottom: 1.5rem;
        }

        .empty-state h4 {
            color: #64748b;
            margin-bottom: 1rem;
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
        }

        .modal-header .btn-close {
            filter: invert(1);
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

        /* Responsive Improvements */
        @media (max-width: 768px) {
            .header-section {
                padding: 1.5rem;
                text-align: center;
            }

            .btn-group {
                flex-direction: column;
            }

            .btn-group .btn {
                border-radius: 8px !important;
                margin-bottom: 0.25rem;
            }
        }

        /* Add some micro-interactions */
        .place-card .btn:hover {
            transform: scale(1.05);
        }

        .stats-card .stats-icon {
            transition: transform 0.3s ease;
        }

        .stats-card:hover .stats-icon {
            transform: rotate(5deg) scale(1.1);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
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

    <c:if test="${error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i> ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Header Section -->
    <div class="header-section">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2><i class="fas fa-map-marker-alt me-2"></i> Destination Management</h2>
                <p class="subtitle mb-0">Curate amazing travel experiences for your visitors</p>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <a href="add-place" class="btn btn-success btn-lg">
                    <i class="fas fa-plus me-2"></i> Add New Destination
                </a>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-4">
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <div class="stats-icon places">
                    <i class="fas fa-map-marked-alt"></i>
                </div>
                <h4 class="mb-1">${not empty places ? places.size() : 0}</h4>
                <p class="text-muted mb-0">Total Destinations</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <div class="stats-icon ratings">
                    <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-1">
                    <c:set var="totalRatings" value="0"/>
                    <c:forEach var="place" items="${places}">
                        <c:set var="totalRatings" value="${totalRatings + place.totalRatings}"/>
                    </c:forEach>
                    ${totalRatings}
                </h4>
                <p class="text-muted mb-0">Total Reviews</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <div class="stats-icon views">
                    <i class="fas fa-eye"></i>
                </div>
                <h4 class="mb-1">
                    <fmt:formatNumber value="${(not empty places ? places.size() : 0) * 1247}" pattern="#,###"/>
                </h4>
                <p class="text-muted mb-0">Total Views</p>
            </div>
        </div>
    </div>

    <!-- Places Grid -->
    <div class="row">
        <c:forEach var="place" items="${places}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card place-card h-100">
                    <c:if test="${place.imageUrls != null}">
                        <img src="data:image/jpeg;base64,${place.imageUrls[0]}"
                             class="card-img-top" alt="${place.placeName}"
                             style="height: 220px; object-fit: cover;">
                    </c:if>
                    <c:if test="${place.imageUrls == null}">
                        <div class="card-img-top bg-light d-flex align-items-center justify-content-center loading-placeholder"
                             style="height: 220px;">
                            <i class="fas fa-mountain fa-3x text-muted"></i>
                        </div>
                    </c:if>

                    <div class="card-body">
                        <h5 class="card-title">${place.placeName}</h5>
                        <div class="place-address">
                            <i class="fas fa-map-pin"></i>
                            <span>${place.address}</span>
                        </div>
                        <p class="card-text">${place.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="rating-badge">
                                <i class="fas fa-star"></i>
                                <span>${place.averageRating}/5</span>
                            </div>
                            <small class="text-muted">
                                    ${place.totalRatings} reviews
                            </small>
                        </div>
                    </div>

                    <div class="card-footer">
                        <div class="btn-group w-100" role="group">
                            <a href="edit-place?id=${place.id}" class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="manage-images?placeId=${place.id}" class="btn btn-outline-info btn-sm">
                                <i class="fas fa-images"></i> Gallery
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
        <div class="empty-state">
            <i class="fas fa-compass fa-5x"></i>
            <h4>Start Your Journey</h4>
            <p class="text-muted mb-4">Create your first destination to begin showcasing amazing travel experiences to your visitors.</p>
            <a href="add-place" class="btn btn-primary btn-lg">
                <i class="fas fa-plus me-2"></i> Add Your First Destination
            </a>
        </div>
    </c:if>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Confirm Deletion
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p class="mb-3">Are you sure you want to permanently delete <strong id="placeName"></strong>?</p>
                <div class="alert alert-warning">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <strong>Warning:</strong> This action cannot be undone. All associated data will be permanently removed.
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Cancel
                </button>
                <form id="deleteForm" method="post" action="delete-place" style="display: inline;">
                    <input type="hidden" name="placeId" id="placeIdToDelete">
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
    function confirmDelete(placeId, placeName) {
        document.getElementById('placeIdToDelete').value = placeId;
        document.getElementById('placeName').textContent = placeName;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
    }

    // Add smooth scroll behavior
    document.documentElement.style.scrollBehavior = 'smooth';

    // Add loading state simulation for images
    document.addEventListener('DOMContentLoaded', function() {
        const images = document.querySelectorAll('.card-img-top');
        images.forEach(img => {
            if (img.tagName === 'IMG') {
                img.addEventListener('load', function() {
                    this.style.opacity = '0';
                    this.style.transition = 'opacity 0.3s ease';
                    setTimeout(() => {
                        this.style.opacity = '1';
                    }, 100);
                });
            }
        });
    });

    // Add hover effect for stats cards
    document.querySelectorAll('.stats-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px) scale(1.02)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
</script>
</body>
</html>