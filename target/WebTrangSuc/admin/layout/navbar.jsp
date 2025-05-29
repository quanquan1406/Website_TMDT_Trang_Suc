<%-- 
    Document   : navbar
    Created on : Dec 3, 2024, 2:46:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/static/AdminCss/styles.css" rel="stylesheet" type="text/css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/listCategory">
                                <i class="fas fa-tags" style="margin-right: 8px;"></i>
                                  Quản lý danh mục sản phẩm
                            </a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/listProduct">
                                <i class="fas fa-box" style="margin-right: 8px;"></i>
                                  Quản lý sản phẩm
                            </a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/listOrder">
                                
                                <i class="fas fa-shopping-cart" style="margin-right: 8px;"></i>
                                  Quản lý đơn hàng
                            </a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/listUser">
                                <i class="fas fa-users" style="margin-right: 8px;"></i>
                                  Quản lý khách hàng
                            </a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/listAddress">
                                <i class="fas fa-map-marker-alt" style="margin-right: 8px;"></i>
                                  Quản lý địa chỉ khách hàng
                            </a>
                             
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Administrator
                    </div>
                </nav>
            </div>
        </div>  
    </body>
</html>
