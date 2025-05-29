/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.admin.ManageUser;

import com.project.model.DAO.UserDetailDAO;
import com.project.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
        
            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone_number = request.getParameter("phone_number");
            String fullname = request.getParameter("fullname");
            int gender = Integer.parseInt(request.getParameter("gender"));
            
            User user =new User(id,email,password,phone_number,fullname,gender);
            UserDetailDAO dao = new UserDetailDAO();
            dao.updateUser(user);
            
            response.sendRedirect(request.getContextPath() + "/listUser");
            
            
       
    }
    
}
