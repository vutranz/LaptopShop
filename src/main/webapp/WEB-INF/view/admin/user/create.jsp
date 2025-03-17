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
                    <li class="breadcrumb-item active">Create </li>
                </ol>

                <div class="d-flex justify-content-center align-items-center vh-100">
                    <div class="custom-form-container">
                        <form:form action="/admin/user/create" method="post" modelAttribute="newUser" enctype="multipart/form-data" class="custom-form">
                        <h2 class="form-title text-center">🚀 Create User</h2>
                        <p class="form-subtitle text-center">Join us today! Fill in the details below.</p>

                        <!-- Full Name & Email -->
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <c:set var="errorfullname">
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                </c:set>
                                <label for="fullName" class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <form:input path="fullName" id="fullName" class="form-control
                    ${not empty errorfullname ? 'is-invalid' : (not empty newUser.fullName ? 'is-valid' : '')}"
                                                placeholder="Full Name"/>
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    <div class="valid-feedback">✔ Looks good!</div> <!-- Dấu tích xanh -->
                                </div>
                                    ${errorfullname}
                            </div>

                            <div class="col-md-6">
                                <c:set var="erroremail">
                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                </c:set>
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <form:input path="email" id="email" class="form-control
                    ${not empty erroremail ? 'is-invalid' : (not empty newUser.email ? 'is-valid' : '')}"
                                                placeholder="Email Address"/>
                                    <form:errors path="email" cssClass="invalid-feedback"/>
                                    <div class="valid-feedback">✔ Looks good!</div>
                                </div>
                                    ${erroremail}
                            </div>
                        </div>

                        <!-- Password & Phone -->
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <c:set var="errorpassword">
                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                </c:set>
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <form:password path="password" id="password" class="form-control
                    ${not empty errorpassword ? 'is-invalid' : (not empty newUser.password ? 'is-valid' : '')}"
                                                   placeholder="Password"/>
                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                    <div class="valid-feedback">✔ Looks good!</div>
                                </div>
                                    ${errorpassword}
                            </div>

                            <div class="col-md-6">
                                <c:set var="errorphone">
                                    <form:errors path="phone" cssClass="invalid-feedback"/>
                                </c:set>
                                <label for="phone" class="form-label">Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <form:input path="phone" id="phone" class="form-control
                    ${not empty errorphone ? 'is-invalid' : (not empty newUser.phone ? 'is-valid' : '')}"
                                                placeholder="Phone Number"/>
                                    <form:errors path="phone" cssClass="invalid-feedback"/>
                                    <div class="valid-feedback">✔ Looks good!</div>
                                </div>
                                    ${errorphone}
                            </div>


                        <!-- Address -->
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <c:set var="erroraddress">
                                    <form:errors path="address" cssClass="invalid-feedback"/>
                                </c:set>
                                <label for="address" class="form-label">Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                    <form:input path="address" id="address" class="form-control
                    ${not empty erroraddress ? 'is-invalid' : (not empty newUser.address ? 'is-valid' : '')}"
                                                placeholder="Enter your address"/>
                                    <form:errors path="address" cssClass="invalid-feedback"/>
                                    <div class="valid-feedback">✔ Looks good!</div>
                                </div>
                                    ${erroraddress}
                            </div>
                        </div>

                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Role</label>
                                    <div>
                                        <form:select class="form-select" path="role.name">
                                            <form:option value="ADMIN">ADMIN</form:option>
                                            <form:option value="USER">USER</form:option>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Avatar</label>
                                    <input type="file" class="form-control" id="imageUpload" accept=".png, .jpg, .jpeg"
                                           name="hoidanitFile"
                                           onchange="previewImage(event)"/>
                                </div>
                            </div>
                            <!-- Hiển thị ảnh sau khi tải lên -->
                            <div class="mb-3 text-center">
                                <img id="imagePreview" src="#" alt="Uploaded Image" class="img-thumbnail d-none" style="max-width: 200px; max-height: 200px;">
                            </div>


                            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                        </form:form>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function previewImage(event) {
                        let reader = new FileReader();
                        reader.onload = function () {
                            let output = document.getElementById('imagePreview');
                            output.src = reader.result;
                            output.classList.remove('d-none'); // Hiển thị ảnh
                        };
                        reader.readAsDataURL(event.target.files[0]);
                    }
                </script>


            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>

</body>
</html>
