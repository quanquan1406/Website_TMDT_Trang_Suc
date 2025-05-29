package com.project.controller;

import com.project.model.Address;
import com.project.model.DAO.AddressDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SortAddressServlet", value = "/SortAddress")
public class SortAddressServlet extends HttpServlet {
    private AddressDAO addressDAO;

    @Override
    public void init() throws ServletException {
        addressDAO = new AddressDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số sortBy từ request
        String sortBy = request.getParameter("sortBy");

        // Gọi phương thức getSortedAddresses
        List<Address> addresses = addressDAO.getSortedAddresses(sortBy);

        // Gửi danh sách địa chỉ đã sắp xếp đến JSP
        request.setAttribute("addresses", addresses);
        request.setAttribute("sortBy", sortBy); // Để giữ trạng thái sortBy trên giao diện
        request.getRequestDispatcher("/admin/addresses/list.jsp").forward(request, response);
    }
}
