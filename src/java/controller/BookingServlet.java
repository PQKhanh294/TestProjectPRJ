package controller;

import dao.ComputerDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import connect.DBConnect;
import java.io.PrintWriter;
import java.util.List;
import model.Computer;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {
    private ComputerDAO computerDAO;

    @Override
    public void init() throws ServletException {
        computerDAO = new ComputerDAO();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ form
            int computerId = Integer.parseInt(request.getParameter("computerID"));
            String bookingDate = request.getParameter("bookingDate");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            String purpose = request.getParameter("purpose");
            int userId = ((model.Account) request.getSession().getAttribute("acc")).getID();

            // Kiểm tra tính hợp lệ của thời gian
            String timeError = computerDAO.checkBookingTimeValidity(bookingDate, startTime, endTime);
            if (timeError != null) {
                request.setAttribute("error", timeError);
                request.getRequestDispatcher("/computers.jsp").forward(request, response);
                return;
            }

            // Kiểm tra xung đột thời gian
            if (computerDAO.checkTimeConflict(computerId, bookingDate, startTime, endTime)) {
                request.setAttribute("error", "Time slot conflicts with an existing booking!");
                request.getRequestDispatcher("/computers.jsp").forward(request, response);
                return;
            }

            // Lưu booking
            computerDAO.saveBooking(computerId, bookingDate, startTime, endTime, purpose, userId);

            // Làm mới danh sách máy tính
            List<Computer> computers = computerDAO.getAllComputers();
            request.getSession().setAttribute("computers", computers);
            request.setAttribute("computers", computers);
            request.setAttribute("success", "Booking confirmed successfully!");

            request.getRequestDispatcher("/computers.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error processing booking: " + e.getMessage(), e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}