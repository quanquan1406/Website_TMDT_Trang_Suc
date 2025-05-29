<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="static/UserCss/index.css"/>
</head>
<body>
<%@ include file="user/layout/header.jsp"%>
<%@ include file="user/layout/navbar.jsp"%>
<!--    Phần nội dung-->

    <section class="section main">
        <div class="container">
            <h2>KHUYẾN MÃI</h2>
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%= request.getContextPath() %>/static/img/Home/sale.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="<%= request.getContextPath() %>/static/img/Home/sale2.jpg" class="d-block w-100" alt="...">
                    </div>

                </div>
            </div>
            <h2>SẢN PHẨM NỔI BẬT</h2>
            <div class="owl-carousel owl-theme text-warning border-warning">
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/vongco/vongco8.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/vongco5.jpg"/></a></div>
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/vongco/vongco9.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/vongco6.jpg"/></a></div>
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/khuyentai/khuyentai3.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/khuyentai3.jpg"/></a></div>
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/khuyentai/khuyentai6.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/khuyentai6.jpg"/></a></div>
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/vongtay/vongtay9.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/vongtay7.jpg"/></a></div>
                <div class="item"><a href="<%= request.getContextPath() %>/beforelogin/vongtay/vongtay10.jsp"><img src="<%= request.getContextPath() %>/static/img/Home/vongtay8-1.jpg"/></a></div>

            </div>
            <h2> DANH MỤC SẢN PHẨM</h2>
            <div class="catalog">
                <div class="row">
                    <div class="col-4 cata1">
                        <a href="<%= request.getContextPath() %>/products-user"><button type="button" class="glow-on-hover">Vòng Tay</button></a>
                    </div>
                    <div class="col-4 cata2">
                        <a href="<%= request.getContextPath() %>/products-user"><button type="button" class="glow-on-hover">Khuyên tai</button></a>
                    </div>
                    <div class="col-4 cata3">
                        <a href="<%= request.getContextPath() %>/products-user"><button type="button" class="glow-on-hover">Vòng cổ</button></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!--    Hết phần nội dung-->
<%@ include file="user/layout/footer.jsp"%>
</body>
</html>
