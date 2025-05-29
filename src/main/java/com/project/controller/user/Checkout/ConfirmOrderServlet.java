
package com.project.controller.user.Checkout;

import com.project.model.DAO.CartDAO;
import com.project.model.DAO.OrderDAO;
import com.project.model.Order;
import com.project.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/confirmOrder")
public class ConfirmOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser != null) {
            try {
                int addressId = Integer.parseInt(request.getParameter("addressId"));
                int totalAmount = (int) session.getAttribute("totalAmount");

                // Tạo hóa đơn
                Order order = new Order();
                order.setUserId(loggedInUser.getId());
                order.setAddressId(addressId);
                order.setTotalPrice(totalAmount);
                order.setStatus(0);

                OrderDAO orderDAO = new OrderDAO();
                boolean orderSaved = orderDAO.saveOrder(order);

                if (orderSaved) {
                    // Cập nhật trạng thái giỏ hàng
                    CartDAO cartDAO = new CartDAO();
                    boolean cartUpdated = cartDAO.clearCartByUserId(loggedInUser.getId());

                    if (cartUpdated) {
                        // Xóa giỏ hàng khỏi session
                        session.removeAttribute("cartItems");
                        session.removeAttribute("totalAmount");

                        // Chuyển hướng đến trang thành công
                        response.sendRedirect("user/checkout/orderSuccess.jsp");
                    } else {
                        response.sendRedirect("user/checkout/orderError.jsp");
                    }
                } else {
                    response.sendRedirect("user/checkout/orderError.jsp");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("user/checkout/orderError.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/user/LaR/dangnhap.jsp");
        }
    }
}

