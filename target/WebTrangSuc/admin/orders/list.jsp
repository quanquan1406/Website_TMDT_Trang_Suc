<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Order" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý đơn hàng</title>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="../layout/header.jsp"%>
        <div id="layoutSidenav">
            <%@ include file="../layout/navbar.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý đơn hàng</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách đơn hàng
                            </div>
                            <div class="card-body">
                                <div class="mb-3 text-center" style="">
                                    <form id="sortForm" method="get" action="SortOrders">
                                        <div class="input-group" style="max-width: 300px; float: right; height: 30px">
                                            <select id="sortBy" name="sortBy" class="form-select">
                                                <option value="">Sắp xếp theo ID</option>
                                                <option value="total-price-asc" 
                                                    <%= "total-price-asc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tổng tiền: Thấp - Cao</option>
                                                <option value="total-price-desc" 
                                                    <%= "total-price-desc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tổng tiền: Cao - Thấp</option>
                                                <option value="user-name-asc" 
                                                    <%= "user-name-asc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên khách hàng</option>
                                                <option value="date-desc" 
                                                    <%= "date-desc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Ngày tạo</option>
                                                <option value="status-asc" 
                                                    <%= "status-asc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Trạng thái</option>
                                            </select>
                                            <button type="submit" class="btn btn-primary">Sắp xếp</button>
                                        </div>
                                    </form>

                                </div>
                                <br/>
                                <br/>
                            <!-- Bảng dữ liệu -->
                            <div class="table-responsive">
                                <table id="datatablesSimple" class="table table-bordered table-hover">
                                    <thead class="custom-thead">
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Tổng tiền</th>
                                            <th>Ngày tạo</th>
                                            <th>Trạng thái</th>
                                            <th>Sửa trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr class="text-center">
                                                    <td>${order.id}</td>
                                                    <td>${order.userName}</td>
                                                    <td>${order.userAddress}</td>
                                                    <td>${order.totalPrice} VND</td>
                                                    <td>${order.createdAt}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${order.status == 0}">Chờ xử lý</c:when>
                                                            <c:when test="${order.status == 1}">Đang giao</c:when>
                                                            <c:when test="${order.status == 2}">Hoàn thành</c:when>
                                                            <c:otherwise>Đã hủy</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <!-- Thêm dropdown để thay đổi trạng thái -->
                                                        <form action="UpdateOrderStatus" method="post" >
                                                            <input type="hidden" name="orderId" value="${order.id}" />
                                                            <select name="status" class="form-control text-center">
                                                                <option value="0" <c:if test="${order.status == 0}">selected</c:if>>Chờ xử lý</option>
                                                                <option value="1" <c:if test="${order.status == 1}">selected</c:if>>Đang giao</option>
                                                                <option value="2" <c:if test="${order.status == 2}">selected</c:if>>Hoàn thành</option>
                                                                <option value="3" <c:if test="${order.status == 3}">selected</c:if>>Đã hủy</option>
                                                            </select>
                                                            <button type="submit" class="btn btn-primary btn-sm mt-2">Cập nhật</button>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
