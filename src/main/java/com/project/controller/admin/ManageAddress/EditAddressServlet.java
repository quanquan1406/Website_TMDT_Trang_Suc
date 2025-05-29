/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.admin.ManageAddress;

import com.project.model.Address;
import com.project.model.DAO.AddressDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editAddress")
public class EditAddressServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html; charset=UTF-8");
        
       int id = Integer.parseInt(request.getParameter("id"));
       String address = request.getParameter("address");
       int addressDefault = Integer.parseInt(request.getParameter("addressDefault"));
       int userId= Integer.parseInt(request.getParameter("userId"));
       
       Address newAddress = new Address(id, address , userId, addressDefault);
       AddressDAO dao = new AddressDAO();
       dao.updateAddress(newAddress);
       response.sendRedirect(request.getContextPath() + "/listAddress");
       
    }
    
    
}
