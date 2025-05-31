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
                        <h1 class="mt-4">Báo cáo thống kê</h1>
                        <iframe title="dashboard_web" width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=b6d1a44e-2b6d-42d0-83a9-32f4a15e2ea9&autoAuth=true&ctid=e7572e92-7aee-4713-a3c4-ba64888ad45f" frameborder="0" allowFullScreen="true">
                            
                        </iframe>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>