package com.project.controller.user.Cart;

import com.project.model.Cart;
import com.project.model.DAO.CartDAO;
import com.project.model.User;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cart-user")
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null) {
            response.sendRedirect("user/LaR/dangnhap.jsp");  // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy danh sách giỏ hàng của người dùng từ cơ sở dữ liệu
        List<Cart> cartItems = cartDAO.getCartByUserId(loggedInUser.getId());
        // Tính tổng giá trị giỏ hàng
           int totalAmount = 0;
           for (Cart item : cartItems) {
               totalAmount += item.getTotalPrice();  // Giả sử mỗi Cart item đã có thuộc tính totalPrice
                                                    }
        // Lưu giỏ hàng và tổng tiền vào session
        session.setAttribute("cartItems", cartItems);
        session.setAttribute("totalAmount", totalAmount);

    
        // Chuyển hướng đến trang giỏ hàng (cart.jsp)
        request.getRequestDispatcher("/user/cart/Cart.jsp").forward(request, response);
    }
}