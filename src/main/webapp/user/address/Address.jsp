
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="java.util.List"%>
<%@page import="com.project.model.User"%>
<%@page import="com.project.model.Address"%>
<%@page import="com.project.model.DAO.AddressDAO"%>
<%@page import="java.sql.Connection"%>

<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("user/LaR/dangnhap.jsp");
        return;
    }

    AddressDAO addressDAO = new AddressDAO();
    List<Address> addressList = addressDAO.getAddressByUserId(loggedInUser.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>Địa chỉ</title>
    <link href="<%= request.getContextPath() %>/static/UserCss/order.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar1.jsp"%>
<section class="section main text-center gradient-border">
    <div class="container">
    <h1>Địa chỉ của bạn</h1>
        <div class="text-start">
            <button type="button" data-toggle="modal" data-target="#add" class="button-address">
                <i class="fas fa-plus"></i> Thêm địa chỉ mới
            </button>
        </div>
        <div class="text-center" style="margin: auto !important; max-width: 400px;">
            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addLabel" aria-hidden="true">
                
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>Thêm địa chỉ mới</h2>
                        </div> 
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/address" method="post" style="font-size: 15px;">
                                <div>
                                <input type="text" name="address" placeholder="Nhập địa chỉ mới" class="input-address1" required>
                                </div>
                                <div>
                                <br/>
                                <label>
                                    <input type="checkbox" name="address_default" value="1"> Đặt làm địa chỉ ban đầu
                                </label>
                                </div>
                                <br/>
                                <div style="margin-left: -170px !important;">
                                <button type="submit" name="action" value="add" class="button-address2">Thêm</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                
            </div>
        
    </div>    
    <h3>Danh sách địa chỉ:</h3>
    <table class="order-history">
        <thead>
            <tr>
                <th class="th-order-history" style="width: 40%;">Địa chỉ</th>
                <th class="th-order-history" style="width: 20%;">Loại</th>
                <th class="th-order-history" style="width: 40%;">Điều chỉnh</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (addressList != null && !addressList.isEmpty()) {
                    for (Address addr : addressList) {
            %>
            <tr>
<!--                <td><%= addr.getId() %></td>-->
                <td><%= addr.getAddress() %></td>
                <td><%= addr.getAddressDefault() == 1 ? "Địa chỉ ban đầu" : "Địa chỉ mới" %></td>
                <td>
                    
                                        <form action="<%= request.getContextPath() %>/address" method="post"  style="font-size: 15px;">

                                            <input type="hidden" name="id" value="<%= addr.getId() %>">
                                            <div>
                                            <input type="text" name="address" value="<%= addr.getAddress() %>" class="input-address">
                                            </div>
                                            <div>
                                            <label>
                                                <input type="checkbox" name="address_default" value="1" <%= addr.getAddressDefault() == 1 ? "checked" : "" %>> Đặt làm ban đầu
                                            </label>
                                            </div>
                                            <div>
                                            <button type="submit" name="action" value="update" class="button-address3">Cập nhật</button>
                                            </div>
                                        </form>
                                    
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">Bạn chưa thêm địa chỉ nào.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>
</section>
<%@ include file="../layout/footer.jsp"%> 
</body>
</html>
