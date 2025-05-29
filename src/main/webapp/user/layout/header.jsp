<%-- 
    Document   : navbar
    Created on : Nov 30, 2024, 3:20:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/static/UserCss/layout.css" rel="stylesheet" type="text/css"/>
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
    <body style="background-color:#F8F5F1;;">
        <header class="section header">
            <div class="container">
                <div class="logo">
                    <a href="<%= request.getContextPath() %>/index.jsp"><img src="<%= request.getContextPath() %>/static/img/lg.png" alt="logo"/></a>
                </div>
                <div class="top-page">

                    <form method="get" action="#">
                        <label><input type="text" placeholder=" Search.."/></label>
                        <button type="button">SEARCH</button>
                    </form>
                </div>
            </div>
        </header>   
    </body>
</html>
