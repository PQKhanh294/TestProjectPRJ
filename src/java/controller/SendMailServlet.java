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

@WebServlet(name = "SendMailServlet", urlPatterns = {"/SendMail"})
public class SendMailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form nhập
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Cấu hình email admin nhận liên hệ
        String adminEmail = "minhpdde180304@fpt.edu.vn"; // Thay email admin của bạn
        String subject = "Liên hệ từ " + fullName;
       
        String emailContent = "Họ tên: " + fullName + "\n"
                            + "SĐT: " + phone + "\n"
                            + "Email: " + email + "\n"
                            + "Nội dung: " + message;

        // Thông tin tài khoản email gửi đi
        final String senderEmail = "phucpvde180394@fpt.edu.vn"; // Thay email của bạn
        final String senderPassword = "wxdr joxx tcku nfex"; // Thay App Password Gmail của bạn

        // Cấu hình SMTP Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(senderEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(adminEmail));
            msg.setSubject(subject);
            msg.setText(emailContent);
            Transport.send(msg);

            // Trả về thông báo thành công
            request.setAttribute("successMessage", "Contact successful!");
        } catch (MessagingException e) {
            request.setAttribute("errorMessage", "Contact failed!");
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}