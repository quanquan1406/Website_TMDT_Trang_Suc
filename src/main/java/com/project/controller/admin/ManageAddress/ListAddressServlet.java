/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.admin.ManageAddress;

import com.project.model.Address;
import com.project.model.DAO.AddressDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listAddress")
public class ListAddressServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       AddressDAO dao = new AddressDAO();
       List<Address> addresses = dao.getAllAddresses();
       request.setAttribute("addresses",addresses);
       request.getRequestDispatcher("/admin/addresses/list.jsp").forward(request, response);
       
    }
    
    
}
