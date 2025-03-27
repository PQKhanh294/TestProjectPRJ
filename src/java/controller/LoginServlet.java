/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LoginDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;

/**
 *
 * @author TU
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            // Xóa session
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Xóa cookie email
            Cookie emailCookie = new Cookie("user", "");
            emailCookie.setMaxAge(0); // Xóa cookie ngay lập tức
            emailCookie.setPath("/");
            response.addCookie(emailCookie);

            // Chuyển hướng về trang login
            response.sendRedirect("home.jsp");
            return;
        }
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
        String user = request.getParameter("user");
String pass = request.getParameter("pass");
        String remember = request.getParameter("remember");
        LoginDAO dao = new LoginDAO();
        Account a = dao.login(user, pass);
        if (a == null) {
            request.setAttribute("errorMessage", "Wrong username or password. Try again!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (remember != null && remember.equals("1")) {
                Cookie emailCookie = new Cookie("user", user);
                emailCookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
                emailCookie.setSecure(false); // Để đảm bảo lưu được trên HTTP
                emailCookie.setPath("/"); // Đặt cookie có hiệu lực cho toàn bộ ứng dụng
                response.addCookie(emailCookie);
            }
        }
        HttpSession session = request.getSession();

        if (a.getIsAdmin() == 1) {
            UserDAO userDAO = new UserDAO();
            List<Account> userList = userDAO.getAllUsers();  // Lấy danh sách user từ DB
            session.setAttribute("userList", userList);
        }
        session.setAttribute("acc", a);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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