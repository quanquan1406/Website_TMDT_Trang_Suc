
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JB643</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/UserCss/product.css"/>
    </head>
    <body>
        <%@ include file="../../user/layout/header.jsp"%>
        <%@ include file="../../user/layout/navbar.jsp"%>
        <!--    Phần nội dung-->
<section class="section main">
    <div class="container">
        <div class="content">
            <img src="<%= request.getContextPath() %>/static/img/Home/khuyentai6.jpg" alt="#" class="img-prd"/>
        </div>

        <div class="sidebar">
            <div class="title">
                <h1 class="content-product-h3">Buffalo Horn Earrings - JB643</h1>
            </div>
            <div class="discription">
                <h5>DESCRIPTION & DETAILS</h5>
                <h6>Not gold cuff bracelet, this Dasmoto quintuple cuff bracelet uses superior horn material for a distinctive and mysterious look. The item is covered by a solid dark color. Wear it on their own or mix and match with Jasmino necklaces and earrings to get the best performance. All materials are hypoallergenic and eco-friendly.</h6>
            </div>
            <div class="product-detail">
                <ul>
                    <li> Trademark: DASMOTO</li>
                    <li> Product’name: JB5643</li>
                    <li> Material: Superior buffalo horn</li>
                    <li> Made in: Viet Nam</li>
                    <li> Made by: Skilled craftsman</li>
                    <li> Insurance: 6 months</li>
                </ul>
            </div><h3>Price: </h3>
            <div class="price">
                <span class="money"> 28$ </span>
            </div>
            <div>
                <button type="submit" class="btn-cart">ADD TO CARD</button>
            </div>

        </div>
    </div>

</section>
<!--    Hết phần nội dung-->
        <%@ include file="../../user/layout/footer.jsp"%>
    </body>
</html>
