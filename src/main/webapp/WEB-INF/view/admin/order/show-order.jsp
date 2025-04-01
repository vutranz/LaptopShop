<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Dashboard - Hỏi Dân IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold text-primary">Dashboard</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded">
                    <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none text-dark">Dashboard</a></li>
                    <li class="breadcrumb-item active">Order</li>
                </ol>

                <div class="container mt-5">
                    <h2 class="text-center mb-4 fw-bold text-secondary">📜 Order Management</h2>

                    <table class="table table-bordered table-hover text-center shadow-sm rounded">
                        <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Role</th>
                            <th>Total Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white">
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td class="fw-bold">${order.id}</td>
                                <td>${order.user.fullName}</td>
                                <td>${order.user.role.name}</td>
                                <td>
                                    <span class="badge bg-info text-dark">
                                        <fmt:formatNumber type="number" value="${order.totalPrice}"/> VND
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status == 'Completed'}">
                                            <span class="badge bg-success">Completed</span>
                                        </c:when>
                                        <c:when test="${order.status == 'Pending'}">
                                            <span class="badge bg-warning text-dark">Pending</span>
                                        </c:when>
                                        <c:when test="${order.status == 'Shipped'}">
                                            <span class="badge bg-primary">Shipped</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Cancelled</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="/admin/order/view/${order.id}" class="btn btn-sm btn-success">
                                        <i class="fas fa-eye me-1"></i> View
                                    </a>
                                    <a href="/admin/order/update/${order.id}" class="btn btn-sm btn-warning">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </a>
                                    <a href="/admin/order/delete/${order.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                        <i class="fas fa-trash me-1"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <!-- Nút Previous -->
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <!-- Tạo danh sách số trang động -->
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="/admin/order?page=${i}">${i}</a>
                                </li>
                            </c:forEach>

                            <!-- Nút Next -->
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>

<!-- Custom CSS -->
<style>
    table {
        border-radius: 8px;
        overflow: hidden;
    }

    .table-hover tbody tr:hover {
        background-color: #f8f9fa;
    }

    .btn i {
        font-size: 14px;
    }

    .breadcrumb {
        font-size: 1.1rem;
    }

    .fw-bold {
        font-weight: bold;
    }

    .badge {
        font-size: 0.9rem;
        padding: 6px 10px;
    }
</style>

</body>


</html>