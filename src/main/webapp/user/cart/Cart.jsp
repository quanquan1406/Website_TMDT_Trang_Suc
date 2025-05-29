<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Cart" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng</title>
    <link href="<%= request.getContextPath() %>/static/UserCss/order.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar1.jsp"%>
    <c:choose>
        <c:when test="${empty cartItems}">
            <section class="section main text-center">
            <div class="container">
              <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                  <h1>Giỏ hàng của bạn đang trống</h1>
                  <br/>
                  <br/>
                  <br/>
                  <div class="return">
                      <a href="<%= request.getContextPath() %>/index.jsp">Quay về trang chủ</a>
                      <br/>
                      <br/>
                      <br/>
                      <br/>
                      <a href="<%= request.getContextPath() %>/products-user">Quay về trang sản phẩm</a>

                  </div>
                </div>
              </div>
            </div>
            </section>
        </c:when>
        <c:otherwise>
            <section class="section main text-center gradient-border">
            <div class="container">
            <h1>Giỏ hàng của bạn</h1>
            <table class="order-history">
                <thead>
                    <tr>
                        <th class="th-order-history" style="width: 30%">Tên sản phẩm</th>
                        <th class="th-order-history" style="width: 10%">Giá</th>
                        <th class="th-order-history" style="width: 10%">Số lượng</th>
                        <th class="th-order-history" style="width: 10%">Tổng giá</th>
                        <th class="th-order-history" style="width: 40%">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cartItem" items="${cartItems}">
                        <tr>
                            <td>${cartItem.productName}</td>
                            <td>${cartItem.price} VND</td>
                            <td>${cartItem.quantity}</td>
                            <td>${cartItem.totalPrice} VND</td>
                            <td>
                                <form action="UpdateCartServlet" method="post" style="display: inline;">
                                    <input type="number" name="quantity" value="${cartItem.quantity}" min="1" class="input-cart"/>
                                    <input type="hidden" name="productId" value="${cartItem.productId}" />
                                    <button type="submit" class="button-cart">Điều chỉnh số lượng</button>
                                </form>
                                <form action="RemoveCartItemServlet" method="post" style="display: inline;">
                                    <input type="hidden" name="productId" value="${cartItem.productId}" />
                                    <button type="submit" class="button-cart">Xóa sản phẩm</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br/>
            <br/>
            <div class="total-amount">
                <h3>
                Tổng tiền: ${totalAmount} VND
                </h3>
            </div>
            <br/>
            <br/>    
            <!-- Nút thanh toán -->
            <form action="checkout" method="post">
                <button type="submit" class="button-cart1">Thanh toán</button>
            </form>
            </div>
            </section>
           </c:otherwise>
    </c:choose>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>
