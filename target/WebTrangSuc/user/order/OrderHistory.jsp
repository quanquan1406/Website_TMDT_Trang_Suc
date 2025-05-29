<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <link href="<%= request.getContextPath() %>/static/UserCss/order.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar1.jsp"%>
<section class="section main text-center gradient-border">
    <div class="container">
    <h1>Lịch sử mua hàng của bạn</h1>
    <br/>
    <table class="order-history">
        <thead>
            <tr>
                <th class="th-order-history">ID Đơn hàng</th>
                <th class="th-order-history">Tên người nhận</th>
                <th class="th-order-history">Địa chỉ giao hàng</th>
                <th class="th-order-history">Tổng tiền</th>
                <th class="th-order-history">Ngày tạo</th>
                <th class="th-order-history">Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orderHistory}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.userName}</td>
                    <td>${order.userAddress}</td>
                    <td>${order.totalPrice} VND</td>
                    <td>${order.createdAt}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 0}">Chờ xử lý</c:when>
                            <c:when test="${order.status == 1}">Đang giao</c:when>
                            <c:when test="${order.status == 2}">Đã hoàn thành</c:when>
                            <c:otherwise>Đã hủy</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</section>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>

