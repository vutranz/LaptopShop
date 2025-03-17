<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    <li class="breadcrumb-item active">User</li>
                    <li class="breadcrumb-item active">UserDetail</li>
                </ol>

                <div class="container mt-5">
                    <div class="card card-custom">
                        <div class="card-header text-center">
                            👤 User Detail
                        </div>
                        <div class="card-body">
                            <div style="display: flex; justify-content: center; align-items: center;">
                                <img
                                        class="avatar-img"
                                        src="/images/avatar/${user.avatar}"
                                        alt="Avatar"
                                        style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;
                   border: 2px solid #ddd; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);">
                            </div>

                            <p><i class="fas fa-id-badge text-primary"></i> <strong>ID:</strong> ${user.id}</p>
                            <p><i class="fas fa-crown text-warning"></i> <strong>ID:</strong> ${user.role.name}</p>
                            <p><i class="fas fa-user text-success"></i> <strong>Full Name:</strong> ${user.fullName}</p>
                            <p><i class="fas fa-envelope text-warning"></i> <strong>Email:</strong> ${user.email}</p>
                            <p><i class="fas fa-phone text-info"></i> <strong>Phone:</strong> ${user.phone}</p>
                            <p><i class="fas fa-map-marker-alt text-danger"></i> <strong>Address:</strong> ${user.address}</p>
                        </div>

                        <div class="card-footer text-center">
                            <a href="/admin/user" class="btn btn-outline-primary btn-back">
                                <i class="fas fa-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>


</body>

</html>