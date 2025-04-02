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

<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<jsp:include page="../layout/header.jsp"/>



<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">Hãy mua sắm đi nào !!!</h1>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">
                    <div class="col-xl-3">
                        <div class="input-group w-100 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                    <div class="col-6"></div>
                    
                </div>
                <div class="row g-4">
                    <div class="col-lg-3">
                        <div class="row g-4">

                            <form method="get" action="/products">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4>Hãng sản xuất</h4>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="apple" name="brand" value="Apple">
                                                    <label class="form-check-label" for="apple">Apple</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="asus" name="brand" value="Asus">
                                                    <label class="form-check-label" for="asus">Asus</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="lenovo" name="brand" value="Lenovo">
                                                    <label class="form-check-label" for="lenovo">Lenovo</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="dell" name="brand" value="Dell">
                                                    <label class="form-check-label" for="dell">Dell</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="lg" name="brand" value="LG">
                                                    <label class="form-check-label" for="lg">LG</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="acer" name="brand" value="Acer">
                                                    <label class="form-check-label" for="acer">Acer</label>
                                                </div>
                                            </div>
                                        </div>
                            
                                        <h4 class="mt-4">Mục đích sử dụng</h4>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="gaming" name="usage" value="Gaming">
                                                    <label class="form-check-label" for="gaming">Gaming</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="student" name="usage" value="Student">
                                                    <label class="form-check-label" for="student">Sinh viên - Văn phòng</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="design" name="usage" value="Design">
                                                    <label class="form-check-label" for="design">Thiết kế đồ họa</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="light" name="usage" value="Light">
                                                    <label class="form-check-label" for="light">Mỏng nhẹ</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="business" name="usage" value="Business">
                                                    <label class="form-check-label" for="business">Doanh nhân</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4>Mức giá</h4>
                                        <div class="mb-2">
                                            <input type="checkbox" class="me-2" id="under10" name="price" value="under10">
                                            <label for="under10"> Dưới 10 triệu</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="checkbox" class="me-2" id="10to15" name="price" value="10to15">
                                            <label for="10to15"> Từ 10 đến 15 triệu</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="checkbox" class="me-2" id="15to20" name="price" value="15to20">
                                            <label for="15to20"> Từ 15 đến 20 triệu</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="checkbox" class="me-2" id="over20" name="price" value="over20">
                                            <label for="over20"> Trên 20 triệu</label>
                                        </div>
                                    </div>
                            
                                    <div class="mb-3">
                                        <h4>Sắp xếp giá</h4>
                                        <div class="mb-2">
                                            <input type="radio" class="me-2" id="sortAsc" name="sortPrice" value="asc">
                                            <label for="sortAsc">Giá tăng dần</label>
                                        </div>
                                        <div class="mb-2">
                                            <input type="radio" class="me-2" id="sortDesc" name="sortPrice" value="desc">
                                            <label for="sortDesc">Giá giảm dần</label>
                                        </div>
                                    </div>
                                </div>
                            
                                <button type="submit" class="btn btn-primary">Lọc sản phẩm</button>
                            </form>
                            
                        </div>
                    </div>

                    <div class="col-lg-9">
                        <div class="row g-4 justify-content-center">
                            <!-- Duyệt danh sách sản phẩm từ model -->
                            <c:forEach var="product" items="${productList}">
                                <div class="col-md-6 col-lg-6 col-xl-4">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top" alt="${product.name}">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                               vip pro
                                        </div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom text-center">
                                            <h4 class="text-center">${product.name}</h4>
                                            <p class="text-muted">${product.shortDesc}</p>

                                            <div class="d-flex flex-column align-items-center">
                                                <p class="text-dark fw-bold mb-2">
                                                    <fmt:formatNumber type="number" value="${product.price}" /> VND
                                                </p>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <button class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                        Add to card
                                                    </button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Phân trang -->
                            <div class="col-12">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <c:if test="${currentPage > 1}">
                                        <a href="?page=${currentPage - 1}" class="rounded">&laquo;</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''} rounded">${i}</a>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <a href="?page=${currentPage + 1}" class="rounded">&raquo;</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>

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