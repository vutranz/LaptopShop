<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
        .custom-form-container {
            max-width: 500px;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .preview-container {
            text-align: center;
            margin-top: 15px;
        }

        .preview-image {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none; /* Ẩn ảnh trước khi chọn */
        }
    </style>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item">Order</li>
                    <li class="breadcrumb-item active">Edit</li>
                </ol>

                <div class="d-flex justify-content-center align-items-center vh-100">
                    <div class="card shadow-lg p-4" style="max-width: 500px; width: 100%;">
                        <div class="card-body">
                            <h2 class="card-title text-center mb-4"><i class="fas fa-edit"></i> Edit Order</h2>
                            <form:form action="/admin/order/update" method="post" modelAttribute="newOrder">
                                <form:input path="id" type="hidden" />

                                <!-- Trạng thái đơn hàng -->
                                <div class="mb-3">
                                    <label for="orderStatus" class="form-label fw-bold">Order Status</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-tasks"></i></span>
                                        <form:select path="status" id="orderStatus" class="form-select">
                                            <form:option value="Pending">Pending</form:option>
                                            <form:option value="Completed">Completed</form:option>
                                            <form:option value="Shipped">Shipped</form:option>
                                            <form:option value="Canceled">Canceled</form:option>
                                        </form:select>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-save"></i> Update
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>


</html>
