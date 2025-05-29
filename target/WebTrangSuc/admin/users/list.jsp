<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý khách hàng</title>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="../layout/header.jsp"%>
        <div id="layoutSidenav">
            <%@ include file="../layout/navbar.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý khách hàng</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách khách hàng
                            </div>
                            <div class="card-body">
                            
                            <!-- Bảng dữ liệu -->
                            <div class="table-responsive">
                                <table id="datatablesSimple" class="table table-bordered table-hover">
                                    <thead class="custom-thead">
                                        <tr>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Password</th>
                                            <th>Họ và tên</th>
                                            <th>Số điện thoại</th>
                                            <th>Giới tính</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <c:forEach var="users" items="${users}">
                                                <tr class="text-center">
                                                    <td>${users.id}</td>
                                                    <td>${users.email}</td>
                                                    <td>${users.password}</td>
                                                    <td>${users.fullname}</td>
                                                    <td>${users.phone_number}</td>
                                                    <td>${users.gender == 1 ? 'Nam' : 'Nữ'}</td>
                                                    <td class="text-center">
                                                        <button type="button" data-toggle="modal" data-target="#edit-${users.id}" class="btn btn-sm btn-warning mx-1">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <div class="modal fade" id="edit-${users.id}" tabindex="-1" role="dialog" aria-labelledby="editLabel-${users.id}" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h2>Chỉnh sửa khách hàng</h2>
                                                                </div> 
                                                                <div class="modal-body">
                                                                <form action="editUser" method="post">
                                                                    <input type="hidden" name="id" value="${users.id}" />
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="email" class="form-label">Email</label>
                                                                        </div>
                                                                        <input type="email" id="email" name="email" class="form-control" value="${users.email}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="password" class="form-label">Password</label>
                                                                        </div>
                                                                        <input type="text" id="password" name="password" class="form-control" value="${users.password}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="fullname" class="form-label">Họ và tên</label>
                                                                        </div>
                                                                        <input type="text" id="fullname" name="fullname" class="form-control" value="${users.fullname}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="phone_number" class="form-label">Số điện thoại</label>
                                                                        </div>
                                                                        <input type="number" id="phone_number" name="phone_number" class="form-control" value="${users.phone_number}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="gender" class="form-label">Giới tính</label>
                                                                        </div>
                                                                        <select id="gender" name="gender" class="form-select" value="${users.gender}" required >
                                                                            <option value="1">Nam</option>
                                                                            <option value="0">Nữ</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="text-end">       
                                                                    <button type="submit" class="btn btn-primary" >Cập nhật khách hàng</button>
                                                                    </div>
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
