<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News Management</title>
    <!-- Bootstrap v5.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .modal-body pre {
            white-space: pre-wrap; /* Preserve whitespace and wrap lines */
            word-wrap: break-word; /* Allow long words to be broken */
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <h1 class="mb-4">News Management</h1>

        <!-- Display error message if any -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Search Form -->
<form action="${pageContext.request.contextPath}/news/search" method="get" class="mb-4" id="searchForm">
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <input type="text" class="form-control" placeholder="Search News" name="search" value="${param.search}">
        </div>
        <div class="col-auto">
            <select name="sortOrder" class="form-select" onchange="document.getElementById('searchForm').submit();">
                <option value="latest" ${param.sortOrder == 'latest' ? 'selected' : ''}>Latest</option>
                <option value="oldest" ${param.sortOrder == 'oldest' ? 'selected' : ''}>Oldest</option>
            </select>
        </div>
        <div class="col-auto">
            <select name="status"  class="form-select" onchange="document.getElementById('searchForm').submit();">
                <option value="" ${empty param.status ? 'selected' : '' }>All Status</option>
                <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
                <option value="2" ${param.status == '2' ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
        <div class="col-auto">
            <!-- Show All Button -->
            <a href="${pageContext.request.contextPath}/news/showAll" class="btn btn-secondary">Show All</a>
        </div>
    </div>
</form>


        <!-- News List -->
        <c:if test="${not empty newsList}">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Location</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.id}</td>
                                <td>${news.title}</td>
                                <td>${news.location}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${news.status == 1}">
                                            <span class="badge bg-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><fmt:formatDate value="${news.created_at}" pattern="yyyy-MM-dd    HH:mm"/></td>
                                <td><fmt:formatDate value="${news.updated_at}" pattern="yyyy-MM-dd     HH:mm"/></td>
                                <td>
                                <button class="btn btn-info btn-sm view-news" data-id="${news.id}">
                                        <i class="fas fa-eye"></i> View
                                    </button>
                                    <button class="btn btn-warning btn-sm edit-news" data-id="${news.id}">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                    <form action="${pageContext.request.contextPath}/news/delete" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${news.id}">
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this news?')">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="news/search?page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="news/search?page=${i}&search=${param.search}&sortOrder=${param.sortOrder}">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="news/search?page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}">Next</a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </c:if>

        <!-- Add New News Button -->
        <button class="btn btn-primary mb-4" id="addNewsBtn">Add New News</button>

        <!-- News Form Modal -->
        <div class="modal fade" id="newsModal" tabindex="-1" aria-labelledby="newsModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="newsModalLabel">News Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="newsForm" action="${pageContext.request.contextPath}/news/create" method="post">
                            <input type="hidden" id="newsId" name="id">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="mb-3">
                                <label for="content" class="form-label">Content</label>
                                <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="image" class="form-label">Image URL</label>
                                <input type="text" class="form-control" id="image" name="image">
                            </div>
                            <div class="mb-3">
                                <label for="location" class="form-label">Location</label>
                                <input type="text" class="form-control" id="location" name="location">
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {
            // Add New News
            $('#addNewsBtn').click(function () {
                $('#newsForm')[0].reset();
                $('#newsForm').attr('action', '${pageContext.request.contextPath}/news/create');
                $('#newsModalLabel').text('Add New News');
                $('#newsModal').modal('show');
            });

            // Edit News
            $('.edit-news').click(function () {
                var newsId = $(this).data('id');
                $.get('${pageContext.request.contextPath}/news/view?id=' + newsId, function (news) {
                    $('#newsId').val(news.id);
                    $('#title').val(news.title);
                    $('#content').val(news.content);
                    $('#image').val(news.image);
                    $('#location').val(news.location);
                    $('#status').val(news.status);
                    $('#newsForm').attr('action', '${pageContext.request.contextPath}/news/update');
                    $('#newsModalLabel').text('Edit News');
                    $('#newsModal').modal('show');
                });
            });
        });
 


$('.view-news').click(function() {
    var newsId = $(this).data('id');
    $.get('${pageContext.request.contextPath}/news/view?id=' + newsId, function(news) {
        var content = '<h2>' + news.title + '</h2>';
        content += '<p><strong>Location:</strong> ' + news.location + '</p>';
        content += '<p><strong>Status:</strong> ' + (news.status == 1 ? 'Active' : 'Inactive') + '</p>';
        content += '<p><strong>Created At:</strong> ' + news.created_at + '</p>';
        content += '<p><strong>Updated At:</strong> ' + news.updated_at + '</p>';
        if (news.image) {
            content += '<img src="' + news.image + '" class="img-fluid mb-3" alt="News Image">';
        }
        content += '<pre>' + news.content + '</pre>'; // Use <pre> to preserve formatting
        
        // Load the content into the modal and show it
        $('#viewNewsContent').html(content);
        $('#viewNewsModal').modal('show');
    });
});

    </script>
    <!-- View News Modal -->
<div class="modal fade" id="viewNewsModal" tabindex="-1" aria-labelledby="viewNewsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewNewsModalLabel">News Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="viewNewsContent">
                <!-- News content will be dynamically loaded here -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
