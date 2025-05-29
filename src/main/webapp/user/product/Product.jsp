<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Danh sách sản phẩm</title>
    <link href="<%= request.getContextPath() %>/static/UserCss/product1.css" rel="stylesheet" type="text/css"/>
    <script src="<%= request.getContextPath() %>/static/js/product1.js" type="text/javascript"></script>
</head>
<body>
    <%@ include file="../layout/header.jsp" %>
    <%@ include file="../layout/navbar.jsp" %>
    <section class="section main">
        <div class="container">
            <div class="text-center">
                <h1>Danh sách sản phẩm</h1>
            </div>
            <!-- Form lọc -->
            <form class="filter-form">
                <div class="filter-group">
                    <h3>Loại sản phẩm</h3>
                    <label><input type="checkbox" value="1" onchange="filterProducts()"> Khuyên tai</label>
                    <label><input type="checkbox" value="2" onchange="filterProducts()"> Vòng cổ</label>
                    <label><input type="checkbox" value="3" onchange="filterProducts()"> Vòng tay</label>
                    <label><input type="checkbox" value="4" onchange="filterProducts()"> Nhẫn</label>
                    <label><input type="checkbox" value="5" onchange="filterProducts()"> Dây chuyền</label>
                </div>
                <div class="filter-group">
                    <h3>Khoảng giá</h3>
                    <label><input type="checkbox" name="price" value="1000000-2000000" onchange="filterProducts()"> 1,000,000 - 2,000,000 VND</label>
                    <label><input type="checkbox" name="price" value="2000000-3000000" onchange="filterProducts()"> 2,000,000 - 3,000,000 VND</label>
                    <label><input type="checkbox" name="price" value="3000000-4000000" onchange="filterProducts()"> 3,000,000 - 4,000,000 VND</label>
                    <label><input type="checkbox" name="price" value="4000000-5000000" onchange="filterProducts()"> 4,000,000 - 5,000,000 VND</label>
                    <label><input type="checkbox" name="price" value="5000000-10000000" onchange="filterProducts()"> Từ 5,000,000 VND trở lên</label>
                </div>
            </form>

            <!-- Danh sách sản phẩm -->
            <div class="product">
                <c:forEach var="product" items="${products}">
                    <div class="product-card" data-category="${product.categoryId}" data-price="${product.price}">
                        <a onclick="window.location.href='product-details?productId=${product.id}'">
                            <img src="<%= request.getContextPath() %>/static/img/products/${product.image}" alt="${product.name}">
                            <h3 class="content-product-h3">${product.name}</h3>
                        </a>
                        <p><span class="money">Giá: ${product.price} VND</span></p>
                        <button onclick="window.location.href='add-to-cart?productId=${product.id}'">Mua</button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <%@ include file="../layout/footer.jsp" %>
</body>
</html>
