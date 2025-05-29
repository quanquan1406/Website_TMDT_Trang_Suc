/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller.admin.ManageOrder;

import com.project.model.DAO.OrderDAO;
import com.project.model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet("/SortOrders")
public class SortOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số sắp xếp từ URL (ví dụ: sortBy=total-price-asc)
        String sortBy = request.getParameter("sortBy");

        // Lấy danh sách các đơn hàng đã sắp xếp từ DAO
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getSortedOrders(sortBy);

        // Gửi danh sách các đơn hàng đã được sắp xếp về phía JSP
        request.setAttribute("orders", orders);
        
        // Chuyển tiếp (forward) đến trang hiển thị danh sách đơn hàng
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/orders/list.jsp");
        dispatcher.forward(request, response);
    }
}




