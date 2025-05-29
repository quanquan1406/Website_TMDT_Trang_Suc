
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lỗi thanh toán</title>
        <style>
            .return a{
                padding:10px;
                background: linear-gradient(90deg, #fff7ad, #ffa9f9);
                color:black;
                border-radius:5px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../layout/header.jsp"%>
        <%@ include file="../layout/navbar1.jsp"%>
        <section class="section main text-center">
        <div class="container">
          <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
              <h1 style="margin-left: 30px">Lỗi thanh toán! 😥</h1>
              <h1>Có vẻ như bạn chưa chọn địa chỉ để nhận hàng</h1>
              <br/>
              <br/>
              <br/>
              <div class="return">
                  <a href="<%= request.getContextPath() %>/index.jsp">Quay về trang chủ</a>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <a href="<%= request.getContextPath() %>/cart-user">Quay về giỏ hàng</a>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <a href="<%= request.getContextPath() %>/address">Cập nhật địa chỉ</a>
              </div>
            </div>
          </div>
        </div>
        </section>
        <%@ include file="../layout/footer.jsp"%>
    </body>
</html>
