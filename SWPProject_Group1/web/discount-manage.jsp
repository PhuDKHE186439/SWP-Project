<%-- 
    Document   : DiscountManage
    Created on : Nov 3, 2024, 6:50:53 PM
    Author     : P C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý mã giảm giá</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Quản lý mã giảm giá</h2>
        
        <!-- Form thêm mã giảm giá mới -->
        <div class="card mb-4">
            <div class="card-header">
                <h5>Thêm mã giảm giá mới</h5>
            </div>
            <div class="card-body">
                <form action="discount-manage" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Mã giảm giá</label>
                                <input type="text" class="form-control" name="code" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Phần trăm giảm</label>
                                <input type="number" class="form-control" name="discountPercent" min="0" max="100" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Số lượt sử dụng tối đa</label>
                                <input type="number" class="form-control" name="maxUsage" min="1" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" name="startDate" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Ngày kết thúc</label>
                                <input type="date" class="form-control" name="endDate" required>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm mã giảm giá</button>
                </form>
            </div>
        </div>

        <!-- Bảng danh sách mã giảm giá -->
        <div class="card">
            <div class="card-header">
                <h5>Danh sách mã giảm giá</h5>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Mã giảm giá</th>
                            <th>Phần trăm giảm</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Đã sử dụng</th>
                            <th>Tối đa</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${discountList}" var="discount">
                            <tr>
                                <td>${discount.discountID}</td>
                                <td>${discount.code}</td>
                                <td>${discount.discountPercent}%</td>
                                <td>${discount.startDate}</td>
                                <td>${discount.endDate}</td>
                                <td>${discount.currentUsage}</td>
                                <td>${discount.maxUsage}</td>
                                <td>
                                    <span class="badge ${discount.status == 1 ? 'bg-success' : 'bg-danger'}">
                                        ${discount.status == 1 ? 'Hoạt động' : 'Đã khóa'}
                                    </span>
                                </td>
                                <td>
                                    <form action="discount-manage" method="POST" style="display: inline;">
                                        <input type="hidden" name="action" value="toggle-status">
                                        <input type="hidden" name="discountId" value="${discount.discountID}">
                                        <button type="submit" class="btn btn-sm ${discount.status == 1 ? 'btn-danger' : 'btn-success'}">
                                            ${discount.status == 1 ? 'Khóa' : 'Mở khóa'}
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
