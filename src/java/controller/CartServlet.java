/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CartDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Product;


/**
 *
 * @author TU
 */
@WebServlet(name="CartServlet", urlPatterns={"/Cart"})
public class CartServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
            HttpSession session = request.getSession();
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

    if (cart == null) {
        cart = new HashMap<>();
    }

    // Xử lý giảm số lượng sản phẩm
    String decreaseId = request.getParameter("decrease");
    if (decreaseId != null && cart.containsKey(decreaseId)) {
        int quantity = cart.get(decreaseId);
        if (quantity > 1) {
            cart.put(decreaseId, quantity - 1);
        } else {
            cart.remove(decreaseId);
        }
    }

    // Xử lý tăng số lượng sản phẩm
    String increaseId = request.getParameter("increase");
    if (increaseId != null) {
        cart.put(increaseId, cart.getOrDefault(increaseId, 0) + 1);
    }

    // Xử lý thêm sản phẩm vào giỏ hàng
    String productId = request.getParameter("add");
    if (productId != null) {
        cart.put(productId, cart.getOrDefault(productId, 0) + 1);
    }

    // Xử lý xóa sản phẩm khỏi giỏ hàng
    String removeId = request.getParameter("remove");
    if (removeId != null) {
        cart.remove(removeId);
    }

    // Lấy thông tin sản phẩm từ database
    ProductDAO productDAO = new ProductDAO();
    Map<String, Product> productMap = new HashMap<>();
    for (String id : cart.keySet()) {
        Product product = productDAO.getProductByID(id); // id kiểu String
        productMap.put(id, product);
    }

    // Cập nhật session
    session.setAttribute("cart", cart);
    session.setAttribute("productMap", productMap);
    session.setAttribute("cartSize", cart.values().stream().mapToInt(i -> i).sum());
    session.setAttribute("totalPrice", cart.entrySet().stream()
            .mapToDouble(entry -> productMap.get(entry.getKey()).getPrice() * entry.getValue()) // Dùng mapToDouble
            .sum());

    response.sendRedirect(removeId != null || increaseId != null || decreaseId != null ? "cart.jsp" : "Product");
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
            HttpSession session = request.getSession();
    Account account = (Account) session.getAttribute("customer");

    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int customerID = account.getID();
    int productID = Integer.parseInt(request.getParameter("productID"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    CartDAO dao = new CartDAO();
    dao.addToCart(customerID, productID, quantity);
    response.sendRedirect("CartServlet"); // Load lại giỏ hàng sau khi thêm
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
