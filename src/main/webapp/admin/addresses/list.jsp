<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý địa chỉ khách hàng</title>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="../layout/header.jsp"%>
        <div id="layoutSidenav">
            <%@ include file="../layout/navbar.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý  địa chỉ khách hàng</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách địa chỉ khách hàng
                            </div>
                            <div class="card-body">
                                <div class="mb-3 text-center" style="">
                                    <form id="sortForm" method="get" action="SortAddress">
                                        <div class="input-group" style="max-width: 300px; float: right; height: 30px">
                                            <select id="sortBy" name="sortBy" class="form-select">
                                                <option value="">Sắp xếp theo ID</option>
                                                <option value="user-name-asc" 
                                                    <%= "user-name-asc".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Tên khách hàng</option>
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
                                            <th>Địa chỉ nhận hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th class="text-center">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <c:forEach var="address" items="${addresses}">
                                                <tr class="text-center">
                                                    <td>${address.id}</td>
                                                    <td>${address.address}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${address.userId == 1}">Ahihi</c:when>
                                                            <c:when test="${address.userId == 2}">Amumu</c:when>
                                                            <c:when test="${address.userId == 3}">John Doe</c:when>
                                                            <c:when test="${address.userId == 4}">Jane Smith</c:when>
                                                            <c:when test="${address.userId == 5}">Lê Trần</c:when>
                                                            <c:when test="${address.userId == 5}">Hồ Văn Khoa</c:when>
                                                            <c:otherwise>Anh Tu</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${address.addressDefault == 1 ? 'Địa chỉ mặc định' : 'Địa chỉ mới'}</td>
                                                    <td class="text-center">
                                                        <button type="button" data-toggle="modal" data-target="#edit-${address.id}" class="btn btn-sm btn-warning mx-1">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <div class="modal fade" id="edit-${address.id}" tabindex="-1" role="dialog" aria-labelledby="editLabel-${address.id}" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h2>Chỉnh sửa địa chỉ khách hàng</h2>
                                                                </div> 
                                                                <div class="modal-body">
                                                                <form action="editAddress" method="post">
                                                                    <input type="hidden" name="id" value="${address.id}" />
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="address" class="form-label">Địa chỉ nhận hàng</label></div>
                                                                        <input type="text" id="address" name="address" class="form-control" value="${address.address}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="userId" class="form-label">ID khách hàng</label></div>
                                                                        <input type="number" id="userId" name="userId" class="form-control" value="${address.userId}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="addressDefault" class="form-label">Địa chỉ hiện tại</label></div>
                                                                        <select id="addressDefault" name="addressDefault" class="form-select" value="${address.addressDefault}" required >
                                                                            <option value="1">Địa chỉ mặc định</option>
                                                                            <option value="0">Địa chỉ mới</option>
                                                                        </select>
                                                                      </div>
                                                                    <div class="text-end">
                                                                    <button type="submit" class="btn btn-primary" >Cập nhật địa chỉ khách hàng</button></div>
                                                                </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                </div>
                                                                </div> 
                                                            </div>
                                                        </div>
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
