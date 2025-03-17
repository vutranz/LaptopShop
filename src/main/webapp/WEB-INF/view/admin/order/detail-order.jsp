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
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Order</li>
                    <li class="breadcrumb-item active">View</li>
                </ol>

                <div class="container mt-5">
                    <div class="card card-custom">
                        <div class="card-header text-center bg-primary text-white fw-bold">
                            🛒 Order Details
                        </div>
                        <div class="card-body">
                            <p><i class="fas fa-barcode text-primary"></i> <strong>ID:</strong> ${order.id}</p>
                            <p><i class="fas fa-money-bill-wave text-success"></i> <strong>Tổng tiền:</strong> <fmt:formatNumber type="number" value="${order.totalPrice}"/> VND</p>
                            <p><i class="fas fa-user-tag text-warning"></i> <strong>Role:</strong> ${order.user.role.name}</p>
                            <p>
                                <i class="fas fa-clipboard-check text-info"></i> <strong>Trạng thái:</strong>
                                <span class="badge
                                    ${order.status == 'Completed' ? 'bg-success' :
                                    (order.status == 'Pending' ? 'bg-warning text-dark' :
                                    (order.status == 'Shipped' ? 'bg-primary' :
                                    (order.status == 'Canceled' ? 'bg-danger' : 'bg-secondary')))}">
                                    ${order.status}
                                </span>
                            </p>

                        </div>

                        <div class="card-footer text-center">
                            <a href="/admin/order" class="btn btn-outline-primary">
                                <i class="fas fa-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>


</body>

</html>