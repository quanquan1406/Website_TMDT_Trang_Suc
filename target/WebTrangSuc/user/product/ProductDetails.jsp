

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chi tiết sản phẩm</title>
    <link href="<%= request.getContextPath() %>/static/UserCss/productdetail.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar.jsp"%>
<section class="section main text-center gradient-border">
    <div class="container">
    <div class="product-details">
        <div class="content">
        <img src="<%= request.getContextPath() %>/static/img/products/${product.image}" alt="${product.name}" class="img-prd">
        </div>
        <div class="sidebar">
            <div class="title">
                <h1 class="content-product-h4">${product.name}</h1>
            </div>
            <br/>
            <div class="discription">
                <h4>${product.description}</h4>
            </div>
            <br/>
            <div class="price">
                <h4>Giá: ${product.price} VND</h4><br/>
                <h4>Còn lại: ${product.quantity}</h4><br/>
            </div>
            <div>
            <form action="add-to-cart" method="post">
                <div>
                <label for="quantity"><h4>Số lượng:</h4></label>
                <input type="number" id="quantity" name="quantity" min="1" max="${product.quantity}" style="width: 75px;border-radius: 5px" required>
                <input type="hidden" name="productId" value="${product.id}">
                </div>
                <div class="text-center">
                <button type="submit" style="width: 300px; background: linear-gradient(90deg, #fff7ad, #ffa9f9);">Thêm vào giỏ hàng</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    </div>
</section>
<%@ include file="../layout/footer.jsp"%>
            <div id="chatTooltip">Xin chào, bạn cần tôi giúp gì không?</div>
            <div id="chatLauncher" onclick="toggleChat()"></div>

            <div id="chatContainer">
                <h4 style="text-align: center; margin: 10px;">💬 Chatbot Web-TMĐT Nhóm 5</h4>
                <div id="chatbox"></div>
                <div style="display: flex; align-items: center;">
                    <input type="text" id="userInput" placeholder="Nhập tin nhắn...">
                    <button id="sendButton" onclick="sendMessage()">Gửi</button>
                </div>
            </div>
</body>
</html>
