<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <link href="<%= request.getContextPath() %>/static/UserCss/order.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@ include file="../layout/header.jsp"%>
        <%@ include file="../layout/navbar1.jsp"%>
        <section class="section main text-center gradient-border">
        <div class="container">
        <h1>Thanh toán</h1>

        <form action="confirmOrder" method="post">
            <h3>Chọn địa chỉ giao hàng:</h3>
            <c:forEach var="address" items="${userAddresses}">
                <div>
                    <input type="radio" name="addressId" value="${address.id}" />
                    <span>${address.address}</span>
                </div>
            </c:forEach>

            <h3>Thông tin giỏ hàng:</h3>
            <table class="order-history">
                <thead>
                    <tr>
                        <th class="th-order-history" style="width: 40%">Tên sản phẩm</th>
                        <th class="th-order-history" style="width: 20%">Giá</th>
                        <th class="th-order-history" style="width: 20%">Số lượng</th>
                        <th class="th-order-history" style="width: 20%">Tổng giá</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cartItem" items="${cartItems}">
                        <tr>
                            <td>${cartItem.productName}</td>
                            <td>${cartItem.price} VND</td>
                            <td>${cartItem.quantity}</td>
                            <td>${cartItem.totalPrice} VND</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3>Tổng tiền: ${totalAmount} VND</h3>
            <br/>
            <br/>
            <button type="submit" class="button-cart1">Xác nhận mua</button>
        </form>
        </div>
        </section>
        <%@ include file="../layout/footer.jsp"%>
    </body>
</html>
