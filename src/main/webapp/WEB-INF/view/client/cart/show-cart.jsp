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

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Products</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cartDetail" items="${cartDetails}">
                <tr>
                    <th scope="row">
                        <div class="d-flex align-items-center">
                            <img src="/images/product/${cartDetail.product.image}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                        </div>
                    </th>
                    <td>
                        <p class="mb-0 mt-4">
                                <a href="/product/${cartDetail.product.id}" target="_blank">
                                        ${cartDetail.product.name}
                                </a>

                        </p>
                    </td>
                    <td>
                        <p class="mb-0 mt-4">
                            <fmt:formatNumber type="number"
                                    value="${cartDetail.product.price} "/> VND

                        </p>
                    </td>
                    <td>
                        <div class="input-group quantity mt-4" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0"
                                   value="${cartDetail.quantity}"
                                    data-cart-detail-id="${cartDetail.id}"
                                   data-cart-detail-price="${cartDetail.price}"
                            >

                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </td>
                    <td>
                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                            <fmt:formatNumber type="number" value=" ${cartDetail.quantity *cartDetail.price}"/> VND
                        </p>

                    </td>
                    <td>
                        <form method="post" action="/delete-cart-product/${cartDetail.id}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                <i class="fa fa-times text-danger"></i>
                            </button>
                        </form>

                    </td>


                </tr>

                </c:forEach>
                </tbody>

            </table>
        </div>

        <div class="row g-4 justify-content-end">
            <div class="col-8"></div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">Tổng Giỏ hàng <span class="fw-normal"></span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Tạm tính:</h5>
                            <p class="mb-0" data-cart-total-price="${totalPrice}">
                                <fmt:formatNumber type="number" value=" ${totalPrice}"/> VND
                            </p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Vận chuyển</h5>
                            <div class="">
                                <p class="mb-0">Free: 0 VND</p>
                            </div>
                        </div>
                        <p class="mb-0 text-end">Giao tận nơi.</p>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Tổng tiền</h5>
                        <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                            <fmt:formatNumber type="number" value="${totalPrice}"/> VND
                        </p>

                    </div>
                    <form:form action="/confirm-checkout" method="get" class="text-center">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <c:forEach var="cartDetail" items="${cartDetails}">
                            <input type="hidden" name="cartDetailId" value="${cartDetail.cart.id}">
                            <input type="hidden" name="totalPrice" value="${totalPrice}">
                            <input type="hidden" name="quantity" value="${cartDetail.quantity}">
                        </c:forEach>

                        <button type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4">
                            Thanh toán
                        </button>
                    </form:form>






                </div>
            </div>
        </div>
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".quantity button").on("click", function () {
                var button = $(this);
                var input = button.closest(".quantity").find("input");
                var oldValue = parseInt(input.val());
                var newVal = oldValue;

                // Kiểm tra nút được nhấn là tăng hay giảm
                if (button.hasClass("btn-plus")) {
                    newVal = oldValue + 1;
                } else if (button.hasClass("btn-minus") && oldValue > 1) {
                    newVal = oldValue - 1;
                }

                // Cập nhật giá trị số lượng trong ô input
                input.val(newVal);

                // Lấy thông tin sản phẩm
                var price = parseFloat(input.attr("data-cart-detail-price")); // Giá tiền mỗi sản phẩm
                var id = input.attr("data-cart-detail-id"); // ID sản phẩm trong giỏ hàng

                // Cập nhật giá tiền của sản phẩm đó
                var priceElement = $("p[data-cart-detail-id='" + id + "']");
                if (priceElement.length) {
                    var newPrice = price * newVal;
                    priceElement.text(formatCurrency(newPrice) + " VND");
                }

                // Cập nhật tổng tiền giỏ hàng
                updateTotalPrice();
            });

            function updateTotalPrice() {
                var total = 0;

                // Duyệt qua từng sản phẩm để tính tổng tiền
                $("p[data-cart-detail-id]").each(function () {
                    var priceText = $(this).text().replace(/\D/g, ""); // Lấy số từ chuỗi (loại bỏ ký tự khác số)
                    var price = parseFloat(priceText) || 0;
                    total += price;
                });

                // Cập nhật tổng tiền giỏ hàng
                $("p[data-cart-total-price]").text(formatCurrency(total) + " VND");
            }

            function formatCurrency(value) {
                return new Intl.NumberFormat("vi-VN", {
                    style: "decimal",
                    minimumFractionDigits: 0,
                }).format(value);
            }
        });

    </script>


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