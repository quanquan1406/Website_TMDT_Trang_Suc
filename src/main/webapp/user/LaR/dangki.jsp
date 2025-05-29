<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng kí</title>
        <style>
            .register input{
                width:300px;
                font-size:30px;
                margin-top:10px;
                color:black;
                border-radius:5px;
            }
            .register input::placeholder{
                font-size:15px;
                text-align:center;
                color:black;
                font-weight:500;
            }
            .register button{
                padding:10px;
                background: linear-gradient(90deg, #fff7ad, #ffa9f9);
                color:black;
                border-radius:5px;
                margin-left:220px;
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
        <h1 style="text-align: center !important">ĐĂNG KÝ</h1>
        <div class="register">
          <form action="../../register" method="post" style="border:2px solid black;background-color: white; padding: 20px; border-radius: 10px;width: 400px; margin: 0 auto; ">
            <h4>Email</h4>
            <label style="margin-left:25px"><input type="email" name="email" required></label>
            <br/>
            <h4>Mật khẩu</h4>
            <label style="margin-left:25px"><input type="password" name="password" required></label>
            <br/>
            <h4>Họ và tên</h4>
            <label style="margin-left:25px"><input type="text" name="fullname" required></label>
            <br/>
            <h4>Số điện thoại</h4>
            <label style="margin-left:25px"><input type="text" name="phone_number" required></label>
            <br/>
            <br/>
                <select name="gender"  style="width:70px; height: 40px; border-radius:5px ">
                    <option value="1">Nam</option>
                    <option value="0">Nữ</option>
                </select>            
            <br/>
            <br/>
            <button type="submit" style="margin-left: 140px">Đăng ký</button>
            <br/>
            <h5 style="text-align: center !important"> Bạn đã có tài khoản <a href="dangnhap.jsp">Đăng nhập ngay</a></h5>
            </form>
        </div>
      </div>
    </div>
  </div>
  <br/>
  <br/>
</section>

    <%@ include file="../layout/footer.jsp"%>
  </body>
</html>
