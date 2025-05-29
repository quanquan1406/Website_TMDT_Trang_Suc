
package com.project.controller.user.Cart;

import com.project.model.Cart;
import com.project.model.DAO.CartDAO;
import com.project.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser == null) {
            response.sendRedirect("/user/LaR/dangnhap.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

          if (cartDAO.updateCartItem(loggedInUser.getId(), productId, quantity)) {
        // Lấy lại danh sách giỏ hàng từ database sau khi cập nhật
        session.setAttribute("cartItems", cartDAO.getCartByUserId(loggedInUser.getId()));

        // Tính lại tổng tiền giỏ hàng
        int totalAmount = 0;
        for (Cart item : (List<Cart>) session.getAttribute("cartItems")) {
            totalAmount += item.getTotalPrice();
        }
        session.setAttribute("totalAmount", totalAmount);

        // Chuyển hướng lại trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/cart-user");
    } else {
        response.sendRedirect(request.getContextPath() + "/cart-user?error=update_failed");
    }
    }
}
