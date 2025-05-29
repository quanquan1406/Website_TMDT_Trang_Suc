package com.project.controller.admin.ManageOrder;

import com.project.model.DAO.OrderDAO;
import com.project.model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listOrder")
public class ListOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        OrderDAO orderDAO = new OrderDAO();        
        List<Order> orders = orderDAO.getAllOrders();       
        request.setAttribute("orders", orders);

      
        request.getRequestDispatcher("/admin/orders/list.jsp").forward(request, response);
    }
}
