package com.project.controller.admin.ManageProduct;

import com.project.model.DAO.ProductDAO;
import com.project.model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String sku = request.getParameter("sku");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        

        Product product = new Product(id, name, image, price, sku, quantity, description, categoryId);
        ProductDAO dao = new ProductDAO();
        dao.updateProduct(product);

        response.sendRedirect(request.getContextPath() + "/listProduct");
    }
}
