
package com.project.controller.user.OrderHistory;


import com.project.model.DAO.OrderDAO;
import com.project.model.Order;
import com.project.model.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order-history")
public class OrderHistoryServlet extends HttpServlet {
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect("user/LaR/dangnhap.jsp"); // Chuyển hướng nếu chưa đăng nhập
            return;
        }

        // Lấy lịch sử đơn hàng của người dùng
        List<Order> orderHistory = orderDAO.getOrderHistoryByUserId(loggedInUser.getId());
        request.setAttribute("orderHistory", orderHistory);

        // Chuyển hướng đến trang JSP hiển thị lịch sử đơn hàng
        request.getRequestDispatcher("/user/order/OrderHistory.jsp").forward(request, response);
    }
}
