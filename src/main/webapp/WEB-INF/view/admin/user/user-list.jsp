<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <h1 class="mt-4 text-primary">Dashboard</h1>
                <ol class="breadcrumb mb-4 bg-light p-3 rounded shadow-sm">
                    <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item active">User</li>
                </ol>

                <div class="container mt-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h2 class="text-center text-secondary"><i class="fas fa-users"></i> User List</h2>
                        <a href="/admin/user/create" class="btn btn-primary shadow-sm">
                            <i class="fas fa-user-plus"></i> Add New User
                        </a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover text-center align-middle shadow-sm">
                            <thead class="table-dark">
                            <tr>
                                <th>STT</th>
                                <th>Avatar</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td hidden>${user.id}</td>
                                    <td>
                                        <img class="avatar-img rounded-circle shadow-sm" src="/images/avatar/${user.avatar}" alt="Avatar">
                                    </td>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.address}</td>
                                    <td>
                                                <span class="badge ${user.role.name eq 'Admin' ? 'bg-danger' : 'bg-secondary'}">
                                                        ${user.role.name}
                                                </span>
                                    </td>
                                    <td>
                                        <a href="/admin/user/view/${user.id}" class="btn btn-sm btn-success">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                        <a href="/admin/user/update/${user.id}" class="btn btn-sm btn-warning text-white">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <a href="/admin/user/delete/${user.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".table tbody tr").forEach(row => {
            row.addEventListener("mouseenter", function () {
                this.style.backgroundColor = "#f8f9fa";
            });
            row.addEventListener("mouseleave", function () {
                this.style.backgroundColor = "";
            });
        });
    });
</script>

<style>
    .avatar-img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border: 2px solid #ddd;
    }
</style>
</body>


</html>