<%-- 
    Document   : navbar
    Created on : Dec 1, 2024, 12:17:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/UserCss/layout.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/fontawesome/css/all.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/bootstrap5.2/css/bootstrap.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.theme.default.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.theme.green.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/bootstrap5.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="section navigation">
            <div class="container">
                <div class="navigator">
                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">Trang Chủ</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <a class="nav-link" href="<%= request.getContextPath() %>/products-user">Sản phẩm</a>
                                    <a class="nav-link" href="<%= request.getContextPath() %>/user/aboutus/aboutus.jsp">Về Chúng Tôi</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="login">
                <!-- Dropdown -->
                    <a href="<%= request.getContextPath() %>/userProfile" >
                    <i class="fa-regular fa-user"></i>
                    </a>   
                </div>
                <div class="login">
                    <a href="<%= request.getContextPath() %>/cart-user" >
                    <i class="fa-solid fa-cart-plus"></i>
                    </a>
                </div>
            </div>
        </nav>
                        
    </body>
</html>
