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
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card-custom {
            max-width: 500px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 1.3rem;
            font-weight: bold;
        }
        .card-body p {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }
        .btn-back {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card shadow-lg border-0 rounded-lg">
                        <!-- Header -->
                        <div class="card-header bg-gradient-primary text-white text-center">
                            <h2 class="mb-0"><i class="fas fa-box-open"></i> Product Detail</h2>
                        </div>

                        <!-- Nội dung sản phẩm -->
                        <div class="card-body p-4">
                            <div class="row align-items-center">
                                <!-- Ảnh sản phẩm -->
                                <div class="col-md-5 text-center">
                                    <img src="/images/product/${product.image}"
                                         alt="${product.name}"
                                         class="img-fluid rounded shadow-sm product-img"
                                         width="100%">
                                </div>

                                <!-- Thông tin sản phẩm -->
                                <div class="col-md-7">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"><strong>ID:</strong> #${product.id}</li>
                                        <li class="list-group-item"><strong>Name:</strong> ${product.name}</li>
                                        <li class="list-group-item"><strong>Price:</strong>
                                            <span class="text-success fw-bold">
                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                                        </span>
                                        </li>
                                        <li class="list-group-item"><strong>Description:</strong> ${product.detailDesc}</li>
                                        <li class="list-group-item"><strong>Short Description:</strong> ${product.shortDesc}</li>
                                        <li class="list-group-item"><strong>Quantity:</strong> ${product.quantity}</li>
                                        <li class="list-group-item"><strong>Sold:</strong> ${product.sold}</li>
                                        <li class="list-group-item"><strong>Factory:</strong> ${product.factory}</li>
                                        <li class="list-group-item"><strong>Target:</strong> ${product.target}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Footer với nút điều hướng -->
                        <div class="card-footer text-center">
                            <a href="/admin/product" class="btn btn-outline-secondary btn-lg mx-2">
                                <i class="fas fa-arrow-left"></i> Quay lại
                            </a>
                            <a href="/admin/product/update/${product.id}" class="btn btn-primary btn-lg mx-2">
                                <i class="fas fa-edit"></i> Chỉnh sửa
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="../layout/footer.jsp"/>
    </div>

    <!-- CSS tùy chỉnh -->
    <style>
        .bg-gradient-primary {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        }
        .product-img {
            transition: 0.3s ease-in-out;
        }
        .product-img:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }
        .btn-lg {
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 8px;
        }
    </style>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>


</body>

</html>