/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller.admin.ManageOrder;

import com.project.model.DAO.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int status = Integer.parseInt(request.getParameter("status"));

        // Khởi tạo đối tượng OrderDAO để gọi phương thức cập nhật
        OrderDAO orderDAO = new OrderDAO();
        boolean isUpdated = orderDAO.updateOrderStatus(orderId, status);

        // Kiểm tra kết quả và chuyển hướng
        if (isUpdated) {
            // Nếu cập nhật thành công, chuyển hướng lại trang danh sách đơn hàng
            response.sendRedirect("listOrder");
        } else {
            // Nếu cập nhật không thành công, gửi thông báo lỗi
            request.setAttribute("errorMessage", "Cập nhật trạng thái không thành công!");
            request.getRequestDispatcher("listOrder").forward(request, response);
        }
    }
}


