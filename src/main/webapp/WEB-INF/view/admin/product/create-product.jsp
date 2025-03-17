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
                    <li class="breadcrumb-item active">Product</li>
                    <li class="breadcrumb-item active">CreateProduct</li>
                </ol>

                <div class="d-flex justify-content-center align-items-center vh-100">
                    <div class="custom-form-container">
                        <form:form action="/admin/product/create" method="post" modelAttribute="newProduct" enctype="multipart/form-data" class="custom-form">
                            <h2 class="form-title text-center">🚀 Create Product</h2>
                            <p class="form-subtitle text-center">Join us today! Fill in the details below.</p>

                            <!-- Name & Price trên cùng một hàng -->
                            <div class="mb-3 row">
                                <div class="col-md-6">
                                    <c:set var="errorName">
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="name" class="form-label">Product Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-tag"></i></span>
                                        <form:input path="name" id="name" class="form-control
                    ${not empty errorName ? 'is-invalid' : (not empty newProduct.name ? 'is-valid' : '')}"
                                                    placeholder="Enter product name"/>
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                        <div class="valid-feedback">✔ Looks good!</div>
                                    </div>
                                        ${errorName}
                                </div>

                                <div class="col-md-6">
                                    <c:set var="errorPrice">
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="price" class="form-label">Price</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                        <form:input path="price" id="price" class="form-control
                    ${not empty errorPrice ? 'is-invalid' : (not empty newProduct.price ? 'is-valid' : '')}"
                                                    placeholder="Enter price"/>
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                        <div class="valid-feedback">✔ Looks good!</div>
                                    </div>
                                        ${errorPrice}
                                </div>
                            </div>

                            <!-- Detail Description & Short Description -->
                            <div class="mb-3 row">
                                <div class="col-md-6">
                                    <c:set var="errorDetailDesc">
                                        <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="detailDesc" class="form-label">Detail Description</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-align-left"></i></span>
                                        <form:textarea path="detailDesc" id="detailDesc" class="form-control
                    ${not empty errorDetailDesc ? 'is-invalid' : (not empty newProduct.detailDesc ? 'is-valid' : '')}"
                                                       placeholder="Enter detailed description" rows="3"/>
                                        <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                        <div class="valid-feedback">✔ Looks good!</div>
                                    </div>
                                        ${errorDetailDesc}
                                </div>

                                <div class="col-md-6">
                                    <c:set var="errorShortDesc">
                                        <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="shortDesc" class="form-label">Short Description</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-align-center"></i></span>
                                        <form:input path="shortDesc" id="shortDesc" class="form-control
                    ${not empty errorShortDesc ? 'is-invalid' : (not empty newProduct.shortDesc ? 'is-valid' : '')}"
                                                    placeholder="Enter short description"/>
                                        <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                        <div class="valid-feedback">✔ Looks good!</div>
                                    </div>
                                        ${errorShortDesc}
                                </div>
                            </div>

                            <!-- Quantity & Factory -->
                            <div class="mb-3 row">
                                <div class="col-md-6">
                                    <c:set var="errorQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="quantity" class="form-label">Quantity</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-cubes"></i></span>
                                        <form:input path="quantity" id="quantity" class="form-control
                    ${not empty errorQuantity ? 'is-invalid' : (not empty newProduct.quantity ? 'is-valid' : '')}"
                                                    placeholder="Enter quantity"/>
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                        <div class="valid-feedback">✔ Looks good!</div>
                                    </div>
                                        ${errorQuantity}
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Factory</label>
                                    <form:select class="form-select" path="factory">
                                        <form:option value="ADMIN">ADMIN</form:option>
                                        <form:option value="USER">USER</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <!-- Target & Image Upload -->
                            <div class="mb-3 row">
                                <div class="col-md-6">
                                    <label class="form-label">Target</label>
                                    <form:select class="form-select" path="target">
                                        <form:option value="ADMIN">ADMIN</form:option>
                                        <form:option value="USER">USER</form:option>
                                    </form:select>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Image</label>
                                    <input type="file" class="form-control" id="imageUpload" accept=".png, .jpg, .jpeg"
                                           name="hoidanitFile" onchange="previewImage(event)"/>
                                </div>
                            </div>

                            <!-- Hiển thị ảnh sau khi tải lên -->
                            <div class="mb-3 text-center">
                                <img id="imagePreview" src="#" alt="Uploaded Image" class="img-thumbnail d-none" style="max-width: 200px; max-height: 200px;">
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Add Product</button>
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
