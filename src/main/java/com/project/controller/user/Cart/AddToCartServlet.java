package com.project.controller.user.Cart;

import com.project.model.DAO.CartDAO;
import com.project.model.DAO.ProductDAO;
import com.project.model.Cart;
import com.project.model.Product;
import com.project.model.User;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng yêu cầu GET sang POST để xử lý logic thêm vào giỏ hàng
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect("user/LaR/dangnhap.jsp");
            return;
        }

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = 1; // Đặt mặc định là 1

            // Nếu quantity được gửi từ form, lấy giá trị từ request
            String quantityParam = request.getParameter("quantity");
            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            }

            // Thêm sản phẩm vào giỏ hàng
            boolean isAdded = cartDAO.addToCart(loggedInUser.getId(), productId, quantity);

            if (isAdded) {
                // Lấy danh sách giỏ hàng của người dùng và tính tổng tiền
                List<Cart> cartItems = cartDAO.getCartByUserId(loggedInUser.getId());
                int totalAmount = 0;
                for (Cart cartItem : cartItems) {
                    totalAmount += cartItem.getTotalPrice(); // Tổng giá của tất cả các sản phẩm trong giỏ
                }

          // Lưu giỏ hàng và tổng tiền vào session
            session.setAttribute("cartItems", cartItems);
            session.setAttribute("totalAmount", totalAmount);
                // Chuyển hướng tới trang giỏ hàng (Cart.jsp)
               response.sendRedirect(request.getContextPath() + "/cart-user");
            } else {
                response.sendRedirect(request.getContextPath() + "/user/product/ProductDetails.jsp?productId=" + productId + "&error=not_enough_stock");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/user/product/Products.jsp?error=invalid_input");
        }
    }
}
