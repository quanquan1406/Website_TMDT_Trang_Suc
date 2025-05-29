/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.admin.ManageCategory;

import com.project.model.Category;
import com.project.model.DAO.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editCategory")
public class EditCategoryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      int id = Integer.parseInt(request.getParameter("id")); 
      String name = request.getParameter("name");
      
      
      Category category = new Category(id, name);
      CategoryDAO dao = new CategoryDAO();
      dao.updateCategory(category);
      response.sendRedirect(request.getContextPath() + "/listCategory");
      
    }
    
    
}
