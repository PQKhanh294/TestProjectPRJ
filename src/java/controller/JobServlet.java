package controller;

import java.io.IOException;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "JobServlet", urlPatterns = {"/Job"})
public class JobServlet extends HttpServlet {

    // Email Admin nhận thông tin ứng tuyển
    private static final String ADMIN_EMAIL = "minhpdde180304@fpt.edu.vn";

    // Email gửi đi (cần bật App Password trên Gmail)
    private static final String SENDER_EMAIL = "phucpvde180394@fpt.edu.vn";
    private static final String SENDER_PASSWORD = "wxdr joxx tcku nfex"; // App Password Gmail

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullname");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String cccd = request.getParameter("cccd");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String salary = request.getParameter("salary");
        String position = request.getParameter("position");
        String reason = request.getParameter("reason");
        String startDate = request.getParameter("startDate");
        String shift = request.getParameter("shift");

        // Tiêu đề email
        String subject = "Job Application from " + fullName + " for " + position;

        // Nội dung email
        String emailContent = String.format(
                "New Job Application\n\n" +
                "Personal Information:\n" +
                "Full Name: %s\n" +
                "Age: %s\n" +
                "Address: %s\n" +
                "Citizen ID: %s\n" +
                "Email: %s\n" +
                "Phone: %s\n" +
                "Desired Salary: %s VND\n\n" +
                "Position Information:\n" +
                "Applied Position: %s\n" +
                "Reason for Applying: %s\n\n" +
                "Additional Information:\n" +
                "Available Start Date: %s\n" +
                "Preferred Work Shift: %s",
                fullName, age, address, cccd, email, phone, salary, position, reason, startDate, shift
        );

        // Cấu hình SMTP Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            // Tạo email và gửi đi
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(SENDER_EMAIL));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(ADMIN_EMAIL));
            msg.setSubject(subject);
            msg.setText(emailContent);
            Transport.send(msg);

            // Gửi thông báo thành công
            request.setAttribute("successMessage", "Your application has been submitted successfully! We'll contact you soon.");
        } catch (MessagingException e) {
            // Ghi log lỗi nếu gửi email thất bại
            request.setAttribute("errorMessage", "Application submission failed. Please try again later.");
        }

        // Điều hướng về trang xác nhận
        request.getRequestDispatcher("career.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("JobServlet is running correctly!");
    }

    @Override
    public String getServletInfo() {
        return "Servlet handles job applications";
    }
}
