<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="assets/jquery-1.11.3.min.js"></script>
        <jsp:include page="header1.jsp" />
    </head>

    <body>
    <div class="container" style="background-color: #f0f0f0; padding: 20px; border-radius: 10px;">
        <div class="header clearfix"></div>
        <h3 class="text-center" style="font-weight: bold;">Thanh toán đơn hàng</h3>
        <div class="header clearfix"></div>
        <div class="table-responsive">
            <form action="ajaxServlet" id="frmCreateOrder" method="post" style="background-color: #fff; padding: 20px; border: 1px solid #ddd; border-radius: 5px;">
                <div class="form-group">
                    <label for="amount" style="font-weight: bold; color: #333;font-size: 1.5em; display: block; margin-bottom: 10px;">Số tiền</label>
                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amountPRICE" type="number" value="${requestScope.prices}" readonly="true" style="border: 2px solid #ccc; border-radius: 5px; padding: 10px;"/>
                </div>
                <h4 style="margin-top: 20px; color: #5bc0de;">Chọn phương thức thanh toán</h4>
                <div class="form-group">
                    <h5 style="margin-bottom: 10px; color: #d9534f;">Phương thức 1: Qua Vnpay</h5>
                    <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                    <label for="bankCode" style="margin-right: 20px;">Cổng thanh toán VNPAY</label>
                    <br>
                    <h5 style="margin-top: 20px; color: #d9534f;">Cách 2: Phương thức thanh toán trực tiếp</h5>
                    <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                    <label for="bankCode" style="margin-right: 20px;">Thanh toán qua thẻ ATM/Tài khoản nội địa</label>
                    <br>
                    <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                    <label for="bankCode" style="margin-right: 20px;">Thanh toán qua thẻ quốc tế</label>
                    <br>
                </div>
                <button type="submit" class="btn btn-default" style="background-color: #5bc0de; color: #fff; border: none; padding: 10px 20px; border-radius: 5px;">Thanh toán</button>
            </form>
        </div>
        <p>&nbsp;</p>
    </div>
    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script>
    <script>
        $(document).ready(function () {
            /*****Fixed Menu******/
            var secondaryNav = $('.cd-secondary-nav'),
                secondaryNavTopPosition = secondaryNav.offset().top;
            $(window).on('scroll', function () {
                var navbar_height = document.querySelector('.navbar').offsetHeight;
                var top = 30;
                if ($(window).scrollTop() > secondaryNavTopPosition) {
                    secondaryNav.addClass('is-fixed');
                    $("body").css("padding-top", navbar_height);
                } else {
                    secondaryNav.removeClass('is-fixed');
                    $("body").css("padding-top", 0);
                }
            });
        });
        $("#menu-close").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        $(document).ready(function () {
            $('.ziehharmonika').ziehharmonika({
                collapsible: true,
                prefix: '★'
            });
        });
    </script>
    <script src="js/ziehharmonika.js"></script>
</body>

    <jsp:include page="footer1.jsp" />
</html>