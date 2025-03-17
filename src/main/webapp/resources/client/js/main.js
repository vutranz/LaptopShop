(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });


    // Product Quantity
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




})(jQuery);

