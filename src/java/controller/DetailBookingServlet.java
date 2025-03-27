package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Computer;

@WebServlet(name = "DetailBookingServlet", urlPatterns = {"/DetailBookingServlet"})
public class DetailBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String computerId = request.getParameter("computerId");

        if (computerId != null && !computerId.isEmpty()) {
            int id = Integer.parseInt(computerId);
            List<Computer> computers = (List<Computer>) session.getAttribute("computers");

            if (computers != null) {
                for (Computer computer : computers) {
                    if (computer.getId() == id) {
                        request.setAttribute("selectedComputer", computer);
                        break;
                    }
                }
            }
        }

        // Chuyển hướng đến detailBooking.jsp (sửa từ computers.jsp)
        request.getRequestDispatcher("/detailBooking.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle booking details";
    }
}