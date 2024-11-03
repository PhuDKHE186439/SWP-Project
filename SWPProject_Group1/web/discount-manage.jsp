<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý mã giảm giá</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Quản lý mã giảm giá</h2>
        
        <!-- Search and Filter Form -->
        <div class="card mb-4">
            <div class="card-body">
                <form action="discount-manage" method="GET" class="row g-3" id="searchForm">
                    <div class="col-md-4">
                        <label class="form-label">Tìm mã giảm giá</label>
                        <input type="text" class="form-control" name="searchCode" value="${searchCode}" placeholder="Nhập mã giảm giá...">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trạng thái</label>
                        <select class="form-select" name="status">
                            <option value="">Tất cả</option>
                            <option value="1" ${status == '1' ? 'selected' : ''}>Đang hoạt động</option>
                            <option value="0" ${status == '0' ? 'selected' : ''}>Đã khóa</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">&nbsp;</label>
                        <div>
                            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                            <button type="button" class="btn btn-success ms-2" onclick="showAll()">Hiện tất cả</button>
                            <button type="button" class="btn btn-info ms-2" data-bs-toggle="modal" data-bs-target="#discountModal">
                                <i class="fas fa-plus"></i> Thêm mới
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bảng danh sách mã giảm giá -->
        <div class="card">
            <div class="card-header">
                <h5>Danh sách mã giảm giá</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
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
                                        <div class="btn-group">
                                            <button class="btn btn-sm btn-warning me-1" onclick="editDiscount(${discount.discountID}, '${discount.code}', ${discount.discountPercent}, '${discount.startDate}', '${discount.endDate}', ${discount.maxUsage})">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger me-1" onclick="deleteDiscount(${discount.discountID})">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                            <form action="discount-manage" method="POST" style="display: inline;">
                                                <input type="hidden" name="action" value="toggle-status">
                                                <input type="hidden" name="discountId" value="${discount.discountID}">
                                                <button type="submit" class="btn btn-sm ${discount.status == 1 ? 'btn-danger' : 'btn-success'}">
                                                    ${discount.status == 1 ? 'Khóa' : 'Mở khóa'}
                                                </button>
                                            </form>
                                        </div>
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
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="discount-manage?page=${currentPage - 1}&searchCode=${searchCode}&status=${status}">Trước</a>
                                </li>
                            </c:if>
                            
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="discount-manage?page=${i}&searchCode=${searchCode}&status=${status}">${i}</a>
                                </li>
                            </c:forEach>
                            
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="discount-manage?page=${currentPage + 1}&searchCode=${searchCode}&status=${status}">Sau</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Discount Modal (Add/Edit) -->
    <div class="modal fade" id="discountModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Thêm mã giảm giá mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="discount-manage" method="POST" id="discountForm" onsubmit="return validateForm()">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add" id="formAction">
                        <input type="hidden" name="discountId" id="discountId">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Mã giảm giá</label>
                                    <input type="text" class="form-control" name="code" id="code" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Phần trăm giảm</label>
                                    <input type="number" class="form-control" name="discountPercent" id="discountPercent" min="0" max="100" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Số lượt sử dụng tối đa</label>
                                    <input type="number" class="form-control" name="maxUsage" id="maxUsage" min="1" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Ngày bắt đầu</label>
                                    <input type="date" class="form-control" name="startDate" id="startDate" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Ngày kết thúc</label>
                                    <input type="date" class="form-control" name="endDate" id="endDate" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary" id="submitBtn">Thêm mã giảm giá</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Xác nhận xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa mã giảm giá này?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <form action="discount-manage" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="discountId" id="deleteDiscountId">
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const discountModal = new bootstrap.Modal(document.getElementById('discountModal'));
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        const existingCodes = [
            <c:forEach items="${discountList}" var="discount" varStatus="status">
                '${discount.code}'${!status.last ? ',' : ''}
            </c:forEach>
        ];

        function editDiscount(id, code, percent, startDate, endDate, maxUsage) {
            document.getElementById('modalTitle').textContent = 'Chỉnh sửa mã giảm giá';
            document.getElementById('formAction').value = 'edit';
            document.getElementById('discountId').value = id;
            document.getElementById('code').value = code;
            document.getElementById('discountPercent').value = percent;
            document.getElementById('startDate').value = startDate;
            document.getElementById('endDate').value = endDate;
            document.getElementById('maxUsage').value = maxUsage;
            document.getElementById('submitBtn').textContent = 'Cập nhật';
            
            discountModal.show();
        }

        function deleteDiscount(id) {
            document.getElementById('deleteDiscountId').value = id;
            deleteModal.show();
        }

        function showAll() {
            document.querySelector('input[name="searchCode"]').value = '';
            document.querySelector('select[name="status"]').value = '';
            document.getElementById('searchForm').submit();
        }

        // Reset form when modal is hidden
        document.getElementById('discountModal').addEventListener('hidden.bs.modal', function () {
            document.getElementById('discountForm').reset();
            document.getElementById('formAction').value = 'add';
            document.getElementById('discountId').value = '';
            document.getElementById('modalTitle').textContent = 'Thêm mã giảm giá mới';
            document.getElementById('submitBtn').textContent = 'Thêm mã giảm giá';
        });

        function validateForm() {
            const startDate = new Date(document.getElementById('startDate').value);
            const endDate = new Date(document.getElementById('endDate').value);
            const code = document.getElementById('code').value;
            const formAction = document.getElementById('formAction').value;
            const currentId = document.getElementById('discountId').value;
            
            if (endDate < startDate) {
                alert('Ngày kết thúc phải sau ngày bắt đầu');
                return false;
            }

            // Check for duplicate code only when adding new or editing with a different code
            if (formAction === 'add' || (formAction === 'edit' && code !== existingCodes[currentId])) {
                if (existingCodes.includes(code)) {
                    alert('Mã giảm giá này đã tồn tại');
                    return false;
                }
            }

            return true;
        }
    </script>
</body>
</html>