
package com.project.controller.user.Address;

import com.project.model.Address;
import com.project.model.DAO.AddressDAO;
import com.project.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/address")
public class AddressController extends HttpServlet {
   private AddressDAO addressDAO = new AddressDAO();
    //get
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null) {
            response.sendRedirect( request.getContextPath() + "/user/LaR/dangnhap.jsp");
            return;
        }

        List<Address> addresses = addressDAO.getAddressByUserId(loggedInUser.getId());
        request.setAttribute("addresses", addresses);
        request.getRequestDispatcher("user/address/Address.jsp").forward(request, response);
    }
 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    HttpSession session = request.getSession();
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() +"/user/LaR/dangnhap.jsp");
        return;
    }

    String action = request.getParameter("action");
    String address = request.getParameter("address");
    String addressDefaultParam = request.getParameter("address_default"); // Lấy giá trị address_default từ form
    int addressDefault = 0; // Mặc định là 0

    // Kiểm tra nếu addressDefault không null, chuyển thành số, nếu không thì giữ giá trị 0
    if (addressDefaultParam != null) {
        try {
            addressDefault = Integer.parseInt(addressDefaultParam);
        } catch (NumberFormatException e) {
            addressDefault = 0; // Nếu parse thất bại, đặt giá trị mặc định
        }
    }

    if ("add".equals(action)) {
        Address newAddress = new Address(0, address, loggedInUser.getId(), addressDefault);
        boolean added = addressDAO.addAddress(newAddress);
        if (added) {
            response.sendRedirect("user/address/Address.jsp?success=added");
        } else {
            response.sendRedirect("user/address/Address.jsp?error=add_failed");
        }
    } else if ("update".equals(action)) {
        int id = Integer.parseInt(request.getParameter("id"));
        Address updatedAddress = new Address(id, address, loggedInUser.getId(), addressDefault);
        boolean updated = addressDAO.updateAddress(updatedAddress);
        if (updated) {
            response.sendRedirect("user/address/Address.jsp?success=updated");
        } else {
            response.sendRedirect("user/address/Address.jsp?error=update_failed");
        }
    }
}

}
