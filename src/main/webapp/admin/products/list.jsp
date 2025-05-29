<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản lý sản phẩm</title>
        <script src="<%= request.getContextPath() %>/static/js/Product.js" type="text/javascript"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="../layout/header.jsp"%>
        <div id="layoutSidenav">
            <%@ include file="../layout/navbar.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý sản phẩm</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách sản phẩm
                            </div>
                            <div class="card-body">
                                
                            <div class="mb-3 text-center" style="">
                                <form id="sortForm" method="get" action="sort-product">
                                    <div class="input-group" style="max-width: 300px; float: right; height: 30px">
                                        <select id="sortOrder" name="sortOrder" class="form-select">
                                            <option value="">Sắp xếp theo ID</option>
                                            <option value="price-asc" 
                                                <%= "price-asc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Giá: Thấp - Cao</option>
                                            <option value="price-desc" 
                                                <%= "price-desc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Giá: Cao - Thấp</option>
                                            <option value="quantity-asc" 
                                                <%= "quantity-asc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Số lượng: Ít - Nhiều</option>
                                            <option value="quantity-desc" 
                                                <%= "quantity-desc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Số lượng: Nhiều - Ít</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary">Sắp xếp</button>
                                    </div>
                                </form>
                                <br/>
                                <br/>
                                <div class="input-group " style="max-width: 250px; float: right; height: 30px">
                                    <select id="categoryFilter" class="form-select">
                                        <option value="">Tất cả danh mục</option>
                                        <option value="1">Khuyên tai</option>
                                        <option value="2">Vòng cổ</option>
                                        <option value="3">Vòng tay</option>
                                        <option value="4">Nhẫn</option>
                                        <option value="5">Dây chuyền</option>
                                        <option value="other">Khác</option>
                                    </select>
                                    <button type="button" class="btn btn-primary" onclick="filterTable()">Lọc</button>
                                </div>
                                <br/>
                                <br/>
                                <div class="text-end">
                                <button type="button" data-toggle="modal" data-target="#add" class="btn btn-success" style="height: 40px">
                                    <i class="fas fa-plus"></i> Tạo mới
                                </button>
                                </div>
                                <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h2>Thêm sản phẩm mới</h2>
                                            </div> 
                                        <div class="modal-body">
                                            <form  method="post" action="addProduct">
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="name" class="form-label">Tên sản phẩm</label></div>
                                                    <input type="text" id="name" name="name" class="form-control" placeholder="Nhập tên sản phẩm" required>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="categoryId" class="form-label">ID Danh mục sản phẩm</label></div>
                                                    <input type="number" id="categoryId" name="categoryId" class="form-control" required>
                                                    </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="image" class="form-label">Hình ảnh</label></div>
                                                    <input type="file" id="image" name="image" class="form-control" required>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="price" class="form-label">Giá</label></div>
                                                    <input type="number" id="price" name="price" class="form-control" placeholder="Nhập giá sản phẩm" required>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="sku" class="form-label">SKU</label></div>
                                                    <input type="text" id="sku" name="sku" class="form-control" placeholder="Nhập mã SKU" required>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="quantity" class="form-label">Số lượng</label></div>
                                                    <input type="number" id="quantity" name="quantity" class="form-control" placeholder="Nhập số lượng" required>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="text-start">
                                                    <label for="description" class="form-label">Mô tả</label></div>
                                                    <textarea id="description" name="description" class="form-control" rows="4" placeholder="Nhập mô tả sản phẩm"></textarea>
                                                </div>
                                                <div class="text-end">
                                                <button type="submit" class="btn btn-success" >Thêm sản phẩm</button></div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
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
                                            <th>Tên sản phẩm</th>
                                            <th>Danh mục sản phẩm</th>
                                            <th>Hình ảnh</th>
                                            <th>Giá</th>
                                            <th>SKU</th>
                                            <th>Số lượng</th>
                                            <th>Mô tả</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <c:forEach var="product" items="${products}">
                                                <tr class="text-center" data-category-id="${product.categoryId}">
                                                    <td>${product.id}</td>
                                                    <td>${product.name}</td>
                                                    
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${product.categoryId == 1}">Khuyên tai</c:when>
                                                            <c:when test="${product.categoryId == 2}">Vòng cổ</c:when>
                                                            <c:when test="${product.categoryId == 3}">Vòng tay</c:when>
                                                            <c:when test="${product.categoryId == 4}">Nhẫn</c:when>
                                                            <c:when test="${product.categoryId == 5}">Dây chuyền</c:when>
                                                            <c:otherwise>Khác</c:otherwise>
                                                        </c:choose>
                                                    </td>        
                                                    <td><img src="<%= request.getContextPath() %>/static/img/products/${product.image}" alt="${product.name}" style="width: 50px; height: 50px;" /></td>
                                                    <td>${product.price}</td>
                                                    <td>${product.sku}</td>
                                                    <td>${product.quantity}</td>
                                                    <td>${product.description}</td>
                                                    <td class="text-center">
                                                        <button type="button" data-toggle="modal" data-target="#edit-${product.id}" class="btn btn-sm btn-warning mx-1">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <div class="modal fade" id="edit-${product.id}" tabindex="-1" role="dialog" aria-labelledby="editLabel-${product.id}" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h2>Chỉnh sửa thông tin sản phẩm</h2>
                                                                </div> 
                                                                <div class="modal-body">
                                                                <form action="editProduct" method="post">
                                                                    <input type="hidden" name="id" value="${product.id}" />
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="name" class="form-label">Tên sản phẩm</label></div>
                                                                        <input type="text" id="name" name="name" class="form-control" value="${product.name}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="categoryId" class="form-label">ID Danh mục sản phẩm</label></div>
                                                                        <input type="number" id="categoryId" name="categoryId" class="form-control" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="image" class="form-label">Hình ảnh</label></div>
                                                                        <input type="file" id="image" name="image" class="form-control" value="${product.image}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="price" class="form-label">Giá</label></div>
                                                                        <input type="number" id="price" name="price" class="form-control" value="${product.price}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="sku" class="form-label">Mã sản phẩm</label></div>
                                                                        <input type="text" id="sku" name="sku" class="form-control" value="${product.sku}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="quantity" class="form-label">Số lượng</label></div>
                                                                        <input type="number" id="quantity" name="quantity" class="form-control" value="${product.quantity}" required>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <div class="text-start">
                                                                        <label for="description" class="form-label">Mô tả</label></div>
                                                                        <textarea id="description" name="description" class="form-control" rows="4">${product.description}</textarea>
                                                                    </div>
                                                                    <div class="text-end">
                                                                    <button type="submit" class="btn btn-primary" >Cập nhật sản phẩm</button></div>
                                                                </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                </div>
                                                                </div> 
                                                            </div>
                                                        </div>   
                                                        <br/>
                                                        <br/>
                                                        <a href="deleteProduct?id=${product.id}" class="btn btn-sm btn-danger mx-1" 
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
