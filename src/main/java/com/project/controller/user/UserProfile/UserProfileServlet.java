package com.project.controller.user.UserProfile;

import com.project.model.DAO.UserDetailDAO;
import com.project.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {

    private UserDetailDAO UserDetailDAO;

    @Override
    public void init() throws ServletException {
        UserDetailDAO = new UserDetailDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin userId từ session
        HttpSession session = request.getSession();
         // Lấy đối tượng User từ session
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser!= null) {
            // Lấy thông tin người dùng từ DB
            User user = UserDetailDAO.getUserById(loggedInUser.getId());

            // Gửi dữ liệu sang view
            request.setAttribute("user", user);
            request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
        } else {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect( "user/LaR/dangnhap.jsp");
        }
    }
     // Cập nhật thông tin người dùng
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser != null) {
            // Lấy thông tin từ form
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String phone_number = request.getParameter("phone_number");
            int gender = Integer.parseInt(request.getParameter("gender")); // Giới tính

            // Cập nhật thông tin người dùng
            loggedInUser.setEmail(email);
            loggedInUser.setPassword(password);
            loggedInUser.setFullname(fullname);
            loggedInUser.setPhone_number(phone_number);
            loggedInUser.setGender(gender);

            boolean isUpdated = UserDetailDAO.updateUser(loggedInUser);

            if (isUpdated) {
                // Cập nhật lại session với thông tin mới
                session.setAttribute("user", loggedInUser);
                request.setAttribute("successMessage", "Cập nhật thông tin thành công!");
            } else {
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi cập nhật thông tin.");
            }

            doGet(request, response); // Hiển thị lại trang profile
        } else {
            response.sendRedirect("user/LaR/dangnhap.jsp");
        }
    }
}
