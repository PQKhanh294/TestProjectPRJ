package controller;

import dao.ComputerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Computer;

@WebServlet(name = "ComputerServlet", urlPatterns = {"/ComputerServlet"})
public class ComputerServlet extends HttpServlet {
    private ComputerDAO computerDAO;

    @Override
    public void init() throws ServletException {
        computerDAO = new ComputerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // Cập nhật trạng thái máy tính khi nhấn "Update Status"
            computerDAO.updateExpiredBookings();

            List<Computer> computers = computerDAO.getAllComputers();
            session.setAttribute("computers", computers);
            request.setAttribute("computers", computers);

            String success = (String) session.getAttribute("success");
            if (success != null) {
                request.setAttribute("success", success);
                session.removeAttribute("success");
            }

            request.getRequestDispatcher("/computers.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error processing GET request: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            computerDAO.updateExpiredBookings();

            List<Computer> computers = computerDAO.getAllComputers();
            request.setAttribute("computers", computers);
            session.setAttribute("computers", computers);

            String success = (String) session.getAttribute("success");
            if (success != null) {
                request.setAttribute("success", success);
                session.removeAttribute("success");
            }

            request.getRequestDispatcher("/computers.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error processing POST request: " + e.getMessage(), e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to display computer list";
    }
}