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
    <meta name="description" content="TheCode - Dự án laptopshop" />
    <title>Dashboard</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        /* Căn giữa nội dung của bảng */
        .table {
            width: 100%;
            text-align: center;
            vertical-align: middle;
        }

        .table th,
        .table td {
            vertical-align: middle !important; /* Căn giữa theo chiều dọc */
        }

        /* Avatar đẹp hơn */
        .avatar-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ddd;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            display: block; /* Giúp căn giữa */
            margin: 0 auto; /* Căn giữa hình ảnh */
        }

        /* Hiệu ứng hover cho hàng */
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Canh giữa nội dung trong ô */
        .text-center {
            text-align: center;
        }
    </style>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <!-- Tiêu đề -->
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <h1 class="fw-bold text-primary">📊 Product Dashboard</h1>
                    <a href="/admin/product/create" class="btn btn-success btn-lg">
                        <i class="fas fa-plus-circle"></i> Add New Product
                    </a>
                </div>

                <!-- Breadcrumbs -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-light p-3 mt-3 rounded shadow-sm">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Product</li>
                    </ol>
                </nav>

                <!-- Bảng danh sách sản phẩm -->
                <div class="card shadow-lg border-0 rounded-lg mt-4">
                    <div class="card-header bg-gradient-primary text-white">
                        <h3 class="mb-0 text-center"><i class="fas fa-box"></i> Product List</h3>
                    </div>
                    <div class="card-body p-4">
                        <table class="table table-hover table-bordered text-center align-middle">
                            <thead class="table-dark">
                            <tr>
                                <th>STT</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Short Desc</th>
                                <th>Quantity</th>
                                <th>Factory</th>
                                <th>Target</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td hidden>${product.id}</td>
                                    <td>
                                        <img src="/images/product/${product.image}"
                                             alt="Product Image"
                                             class="rounded shadow-sm img-thumbnail product-img">
                                    </td>
                                    <td class="fw-bold text-primary">${product.name}</td>
                                    <td class="text-success fw-bold">
                                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                                    </td>
                                    <td>${product.shortDesc}</td>
                                    <td>${product.quantity}</td>
                                    <td>${product.factory}</td>
                                    <td>${product.target}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="/admin/product/view/${product.id}" class="btn btn-sm btn-outline-success">
                                                <i class="fas fa-eye"></i> View
                                            </a>
                                            <a href="/admin/product/update/${product.id}" class="btn btn-sm btn-outline-warning">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <a href="/admin/product/delete/${product.id}"
                                               class="btn btn-sm btn-outline-danger"
                                               onclick="return confirm('Are you sure you want to delete this product?')">
                                                <i class="fas fa-trash"></i> Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<!-- Bootstrap & JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>

<!-- CSS tùy chỉnh -->
<style>
    .bg-gradient-primary {
        background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    }
    .product-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        transition: transform 0.3s ease-in-out;
    }
    .product-img:hover {
        transform: scale(1.1);
    }
    .btn-group .btn {
        margin: 2px;
    }
    .breadcrumb a {
        text-decoration: none;
    }
</style>
</body>


</html>