<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý danh mục sản phẩm</title>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="../layout/header.jsp"%>
        <div id="layoutSidenav">
            <%@ include file="../layout/navbar.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý danh mục sản phẩm</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh mục sản phẩm
                            </div>
                            <div class="card-body">
                            <!-- Nút tạo mới -->
                            <div class="mb-3 text-end">
                                <button type="button" data-toggle="modal" data-target="#add" class="btn btn-success">
                                    <i class="fas fa-plus"></i> Tạo mới
                                </button>
                                
                                <div class="text-center">
                                <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h2>Thêm danh mục sản phẩm mới</h2>
                                            </div> 
                                        <div class="modal-body">
                                            <form  method="post" action="addCategory">
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="name" class="text-center" >Tên danh mục sản phẩm</label>
                                                    </div>
                                                    <input type="text" id="name" name="name" class="form-control" placeholder="Nhập tên sản phẩm" required>
                                                </div>
                                                <div class="text-end">
                                                <button type="submit" class="btn btn-success" >Thêm danh mục sản phẩm</button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                        </div>
                                        </div> 
                                    </div>
                                </div>   
                            </div>
                            </div>
                            <!-- Bảng dữ liệu -->
                            <div class="table-responsive">
                                <table id="datatablesSimple" class="table table-bordered table-hover">
                                    <thead class="custom-thead">
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên danh mục sản phẩm</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <c:forEach var="category" items="${categories}">
                                                <tr class="text-center">
                                                    <td>${category.id}</td>
                                                    <td>${category.name}</td>
                                                    
                                                    <td class="text-center">
                                                        <button type="button" data-toggle="modal" data-target="#edit-${category.id}" class="btn btn-sm btn-warning mx-1">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <div class="modal fade" id="edit-${category.id}" tabindex="-1" role="dialog" aria-labelledby="editLabel-${category.id}" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h2>Chỉnh sửa danh mục sản phẩm</h2>
                                                                </div> 
                                                                <div class="modal-body">
                                                                <form action="editCategory" method="post">
                                                                    <input type="hidden" name="id" value="${category.id}" />
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="name" class="text-start">Tên sản phẩm</label>
                                                                        </div>
                                                                        <input type="text" id="name" name="name" class="form-control" value="${category.name}" required>
                                                                    </div>
                                                                    <div class="text-end">
                                                                    <button type="submit" class="btn btn-primary" >Cập nhật danh mục sản phẩm</button>
                                                                    </div>
                                                                </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                </div>
                                                                </div> 
                                                            </div>
                                                        </div>    
                                                        <a href="deleteCategory?id=${category.id}" class="btn btn-sm btn-danger mx-1" 
                                                           onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">
                                                            <i class="fas fa-trash"></i> Xóa
                                                        </a>
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
