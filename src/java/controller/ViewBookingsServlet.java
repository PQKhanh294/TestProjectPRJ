package controller;

import dao.ComputerDAO;
import model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewBookingsServlet", urlPatterns = {"/ViewBookingsServlet"})
public class ViewBookingsServlet extends HttpServlet {
    private ComputerDAO computerDAO;

    @Override
    public void init() throws ServletException {
        computerDAO = new ComputerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách tất cả booking từ ComputerDAO
            List<Booking> bookings = computerDAO.getAllBookings();
            request.setAttribute("bookings", bookings);

            // Chuyển hướng tới viewBookings.jsp
            request.getRequestDispatcher("/viewBookings.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error retrieving bookings: " + e.getMessage());
            request.getRequestDispatcher("/viewBookings.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to display all bookings for admin";
    }
}