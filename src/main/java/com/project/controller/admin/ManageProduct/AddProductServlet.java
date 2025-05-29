package com.project.controller.admin.ManageProduct;

import com.project.model.DAO.ProductDAO;
import com.project.model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String priceStr = request.getParameter("price");
        String sku = request.getParameter("sku");
        String quantityStr = request.getParameter("quantity");
        String description = request.getParameter("description");
        String categoryIdStr=request.getParameter("categoryId");
        int price = Integer.parseInt(priceStr.trim());
        int quantity = Integer.parseInt(quantityStr.trim());
        int categoryId = Integer.parseInt(categoryIdStr.trim());

        Product product = new Product();
        product.setName(name);
        product.setImage(image);
        product.setPrice(price);
        product.setSku(sku);
        product.setQuantity(quantity);
        product.setDescription(description);
        product.setCategoryId(categoryId);
        ProductDAO dao = new ProductDAO();
        dao.addProduct(product);
        
        response.sendRedirect(request.getContextPath() + "/listProduct");
    }
}
