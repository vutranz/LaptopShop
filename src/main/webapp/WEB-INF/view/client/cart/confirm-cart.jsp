<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Laptopshop - TheCode</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <%--    <link href="/client/js/main.js" rel="stylesheet">--%>
</head>
<body>

<jsp:include page="../layout/header.jsp"/>





<div class="container mt-5">
    <h2 class="text-center text-primary">Xác nhận Thanh toán</h2>

    <div class="row">
        <!-- Cột bên trái: Bảng sản phẩm + Hình shipper -->
        <div class="col-md-6">
            <table class="table table-bordered">
                <thead class="table-dark">
                <tr>
                    <th>STT</th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cartDetail" items="${cartDetails}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${cartDetail.product.name}</td>
                        <td> <fmt:formatNumber type="number" value="${cartDetail.product.price} "/> VNĐ</td>
                        <td>${cartDetail.quantity}</td>
                        <td><fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity} "/> VNĐ</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Hình ảnh shipper bên dưới bảng sản phẩm -->
            <div class="text-center mt-4">
                <img style="width: 500px;height: 400px;border:#0c4128" src="https://adp.net.vn/wp-content/uploads/2022/05/TIENPHONG-CHINH-SACH-1.jpg" alt="Shipper giao hàng" class="img-fluid rounded shadow">
                <p class="mt-2 text-muted">Shipper đang trên đường giao hàng!</p>
            </div>
        </div>

        <!-- Cột bên phải: Form thông tin khách hàng -->
        <div class="col-md-6">
            <h4>Thông tin khách hàng</h4>
            <form:form action="/process-checkout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <input hidden="hidden" name="id" value="${id}">
                <div class="mb-3">
                    <label for="fullName" class="form-label">Họ và tên:</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${fullName}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="${email}" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại:</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${phone}" required>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ:</label>
                    <textarea class="form-control" id="address" name="address" rows="2" required>${address}</textarea>
                </div>

                <h5 class="mt-3">Tổng tiền:
                    <strong class="text-danger">
                        <fmt:formatNumber type="number" value="${totalPrice}" /> VNĐ
                    </strong>
                </h5>

                <button type="submit" class="btn btn-success w-100 mt-3">
                    Xác nhận thanh toán
                </button>
            </form:form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>







<jsp:include page="../layout/footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>
</html>