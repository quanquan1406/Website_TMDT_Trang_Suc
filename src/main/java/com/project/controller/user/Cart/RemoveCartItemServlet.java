/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.controller.user.Cart;

import com.project.model.DAO.CartDAO;
import com.project.model.User;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveCartItemServlet")
public class RemoveCartItemServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser == null) {
            response.sendRedirect("/user/LaR/dangnhap.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));

        if (cartDAO.removeCartItem(loggedInUser.getId(), productId)) {
            response.sendRedirect(request.getContextPath()+"/cart-user");
        } else {
            response.sendRedirect(request.getContextPath()+"/cart-user?error=remove_failed");
        }
    }
}
