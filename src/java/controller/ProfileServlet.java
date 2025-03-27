package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ProfileServelet", urlPatterns = {"/Profile"})
public class ProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServelet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Giả sử bạn có một lớp UserDAO để xử lý cập nhật thông tin người dùng
        UserDAO userDAO = new UserDAO();
        boolean isUpdated = userDAO.updateUser(userId, username, email);

        // Cập nhật thông tin trong session
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("acc");
        if (isUpdated && currentUser != null) {
            // Chỉ cập nhật các thuộc tính đã thay đổi, giữ nguyên các thuộc tính khác
            currentUser.setUsername(username);
            currentUser.setEmail(email);
            // KHÔNG thiết lập lại toàn bộ đối tượng session.setAttribute("acc", user);

            request.setAttribute("successMessage", "Profile updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update profile. Please try again.");
        }

        // Chuyển hướng về trang profile
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu mới và xác nhận
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirmation do not match.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // Giả sử bạn có một lớp UserDAO để xử lý thay đổi mật khẩu
        UserDAO userDAO = new UserDAO();
        boolean isChanged = userDAO.changeUserPassword(userId, currentPassword, newPassword);

        if (isChanged) {
            request.setAttribute("successMessage", "Password changed successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to change password. Please check your current password.");
        }

        // Chuyển hướng về trang profile
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}