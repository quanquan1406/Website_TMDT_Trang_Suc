<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile</title>
    <style>
        .profile_form{
            border:2px solid black;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            margin: 0 auto;
        }
        .center{
            text-align: center !important;
        }
        .left{
            text-align: left !important;
        }
        .color{
            background: linear-gradient(90deg, #fff7ad, #ffa9f9)!important;
            color:black !important;
        }
    </style>
</head>
<body>
<%@ include file="layout/header.jsp"%>
<%@ include file="layout/navbar1.jsp"%>
<section class="section main">
  <div class="container">
    <div class="row">
      <div class="col-3"></div>
      <div class="col-6">
          <div class="center" ><h1>Thông tin cá nhân</h1></div>
    <div class="center">
    <!-- Hiển thị thông báo -->
    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    <!-- Form chỉnh sửa thông tin -->
    <form action="<%= request.getContextPath() %>/userProfile" method="post" class="profile_form">

        <h3 for="email" class="left">Email: ${user.email}</h3><br/>
        <h3 for="password" class="left">Password: ${user.password}</h3><br/>
        <h3 for="fullname" class="left">Họ và tên: ${user.fullname}</h3><br/>
        <h3 for="phoneNumber" class="left">Số điện thoại: ${user.phone_number}</h3><br/>
        <h3 for="gender" class="left">Giới tính: 
            <c:choose>
                <c:when test="${user.gender == 1}">Nam</c:when>
                <c:when test="${user.gender == 0}">Nữ</c:when>
            </c:choose>
        </h3><br/>
        
        <button type="button" data-toggle="modal" data-target="#edit" class=" color btn btn-primary"">
            <i class="fas fa-edit"></i> Chỉnh sửa thông tin cá nhân
        </button>
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Chỉnh sửa thông tin cá nhân</h2>
                    </div> 
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/userProfile" method="post">
                            <div class="mb-3">
                            <div class="text-start"><h4 for="email">Email:</h4></div>
                            <input type="email" id="email" name="email" value="${user.email}" required><br><br>
                            </div>
                            
                            <div class="mb-3">
                            <div class="text-start"><h4 for="text">Mật khẩu:</h4></div>
                            <input type="text" id="password" name="password" value="${user.password}" required><br><br>
                            </div>
                            
                            <div class="mb-3">
                            <div class="text-start"><h4 for="fullname">Tên đầy đủ:</h4></div>
                            <input type="text" id="fullname" name="fullname" value="${user.fullname}" required><br><br>
                            </div>
                            
                            <div class="mb-3">
                            <div class="text-start"><h4 for="phoneNumber">Số điện thoại:</h4></div>
                            <input type="text" id="phone_number" name="phone_number" value="${user.phone_number}" required><br><br>
                            </div>
                            
                            <div class="mb-3">
                            <div class="text-start"><h4 for="gender">Giới tính:</h4></div>
                            <select id="gender" name="gender" class="form-select" value="${users.gender}" style="height: 50px; font-size: 15px !important;" required >
                                <option value="1">Nam</option>
                                <option value="0">Nữ</option>
                            </select><br><br>
                            </div>
                            
                            <button type="submit" class="color btn btn-primary" style="margin: -70px">Cập nhật thông tin cá nhân</button>
                        </form>
                    </div>
                    <br/>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div> 
            </div>
        </div>
    </form>
        </div>
    </div>
  </div>
</div>
<br/>
<br/>
</section>

<%@ include file="layout/footer.jsp"%>
</body>
</html>