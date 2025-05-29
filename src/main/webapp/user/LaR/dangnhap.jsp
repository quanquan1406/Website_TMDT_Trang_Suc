<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng nhập</title>
        <style>
            .login1 input{
                width:300px;
                font-size:30px;
                margin-top:10px;
                color:black;
                border-radius:5px;
            }
            .login1 input::placeholder{
                font-size:15px;
                text-align:center;
                color:black;
                font-weight:500;
            }
            .login1 button{
                padding:10px;
                background: linear-gradient(90deg, #fff7ad, #ffa9f9);
                color:black;
                border-radius:5px;
                margin-left:220px;
            }
            .login_form{
                border:2px solid black;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                width: 400px;
                margin: 0 auto; 
            }
        </style>
    </head>
    <body>
    <%@ include file="../layout/header.jsp"%>
    <%@ include file="../layout/navbar.jsp"%>
<section class="section main">
  <div class="container">
    <div class="row">
      <div class="col-3"></div>
      <div class="col-6">
        <h1 style="margin-left:190px">ĐĂNG NHẬP</h1>
        <div class="login1">
          <form action="../../login" method="post" class="login_form">
            <h4>Email</h4>
            <label style="margin-left:25px"><input type="text" name="emailOrUsername" required></label>
            <br/>
            <h4>Mật khẩu</h4>
            <label style="margin-left:25px"><input type="password" name="password" required></label>
            <br/>
            <br/>
            <button type="submit"  style="margin-left: 130px">Đăng nhập</button>
            <br/>
            <h5 style="margin-left:50px"> Bạn đã chưa có tài khoản <a href="dangki.jsp">Đăng kí ngay</a></h5>
            </form>
        </div>
      </div>
    </div>
  </div>
</section>

    <%@ include file="../layout/footer.jsp"%>
  </body>
</html>
