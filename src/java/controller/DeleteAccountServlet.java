/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CrudDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name="DeleteAccountServlet", urlPatterns={"/DeleteAccount"})
public class DeleteAccountServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        Account currentUser = (Account) session.getAttribute("acc");

        if (currentUser == null || currentUser.getIsAdmin() != 1) {
            request.setAttribute("errorMessage", "Unauthorized access.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if ("deleteUsers".equals(action)) {
            String[] selectedUserIds = request.getParameterValues("selectedUsers");
            
            if (selectedUserIds != null && selectedUserIds.length > 0) {
                int deletedCount = userDAO.deleteUsers(selectedUserIds);
                
                if (deletedCount > 0) {
                    request.setAttribute("successMessage", deletedCount + " user(s) deleted successfully.");
                } else {
                    request.setAttribute("errorMessage", "No users were deleted. Ensure you're not trying to delete admin accounts.");
                }
            } else {
                request.setAttribute("errorMessage", "No users selected for deletion.");
            }
        }
        List<Account> userList = userDAO.getAllUsers();
        request.setAttribute("userList", userList);
        
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
