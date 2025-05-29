package com.project.controller.user.Checkout;


import com.project.model.Address;
import com.project.model.Cart;
import com.project.model.DAO.AddressDAO;
import com.project.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy người dùng từ session
        HttpSession session = request.getSession();
         User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser != null) {
            // Lấy danh sách địa chỉ của người dùng
            AddressDAO addressDAO = new AddressDAO();
            List<Address> userAddresses = addressDAO.getAddressByUserId(loggedInUser.getId());

            // Lấy thông tin giỏ hàng từ session
            List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems");
            int totalAmount = (int) session.getAttribute("totalAmount");

            // Đưa dữ liệu vào request
            request.setAttribute("userAddresses", userAddresses);
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalAmount", totalAmount);

            // Chuyển đến trang Checkout.jsp
            request.getRequestDispatcher("/user/checkout/Checkout.jsp").forward(request, response);
        } else {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/user/LaR/dangnhap.jsp");
        }
}
}
