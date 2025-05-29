/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.admin.ManageCategory;

import com.project.model.Category;
import com.project.model.DAO.CategoryDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listCategory")
public class ListCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    CategoryDAO dao = new CategoryDAO();
    List<Category> categories =dao.getAllCategories();
    request.setAttribute("categories", categories);
    request.getRequestDispatcher("/admin/categories/list.jsp").forward(request, response);
    }
    
}
