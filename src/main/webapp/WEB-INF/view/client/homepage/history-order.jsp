<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
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
</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container mt-4">
    <div class="card shadow-lg p-4">
        <h2 class="text-center text-primary">
            <i class="fas fa-shopping-cart"></i> Lịch Sử Đơn Hàng
        </h2>

        <table class="table table-bordered table-hover text-center mt-3">
            <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Mã Đơn Hàng</th>
                <th>Số Tiền</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>MĐH${order.id}</td>
                    <td><fmt:formatNumber value="${order.totalPrice}" type="currency" currencyCode="VND"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 'Completed'}">
                                <span class="badge bg-success">Hoàn Thành</span>
                            </c:when>
                            <c:when test="${order.status == 'Pending'}">
                                <span class="badge bg-warning text-dark">Đang Xử Lý</span>
                            </c:when>
                            <c:when test="${order.status == 'Shipped'}">
                                <span class="badge bg-warning text-dark">Đang Xử Lý</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Đã Hủy</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <button class="btn btn-sm btn-primary shadow-sm" data-bs-toggle="collapse"
                                data-bs-target="#order-details-${order.id}" aria-expanded="false"
                                onclick="toggleIcon(${order.id})">
                            <i id="icon-${order.id}" class="fas fa-eye"></i> Xem Chi Tiết
                        </button>
                    </td>
                </tr>
                <!-- Chi tiết đơn hàng (ẩn mặc định) -->
                <tr id="order-details-${order.id}" class="collapse">
                    <td colspan="6">
                        <div class="card card-body">
                            <h5 class="text-primary">Chi Tiết Đơn Hàng:</h5>
                            <table class="table table-bordered">
                                <thead class="table-light">
                                <tr>
                                    <th>Sản Phẩm</th>
                                    <th>Số Lượng</th>
                                    <th>Giá</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="detail" items="${order.orderDetails}">
                                    <tr>
                                        <td><strong>${detail.product != null ? detail.product.name : 'Không có dữ liệu'}</strong></td>
                                        <td>${detail.quantity}</td>
                                        <td><fmt:formatNumber value="${detail.price}" type="currency" currencyCode="VND"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function toggleIcon(orderId) {
        let icon = document.getElementById("icon-" + orderId);
        if (icon.classList.contains("fa-eye")) {
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }
</script>








<%--<jsp:include page="../layout/footer.jsp"/>--%>




<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
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