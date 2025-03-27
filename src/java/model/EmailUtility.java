/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtility {

    // Phương thức gửi email với mã OTP
    public static void sendOTP(String recipientEmail, String otp) throws MessagingException {
        // -.- chua config 2 cai này ne, your email là qq gì, bỏ zô
        final String senderEmail = "phucpvde180394@fpt.edu.vn"; // Thay bằng email của bạn
        final String senderPassword = "wxdr joxx tcku nfex"; // Thay bằng mật khẩu ứng dụng (App Password)

        // Cấu hình thuộc tính SMTP của Gmail
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Xác thực tài khoản email gửi
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        // Tạo email
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Mã xác nhận đặt lại mật khẩu");
        message.setText("Mã OTP của bạn là: " + otp + ". Vui lòng sử dụng mã này để đặt lại mật khẩu.");

        // Gửi email
        Transport.send(message);
    }

    // Phương thức tạo mã OTP ngẫu nhiên 6 số
    public static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // Tạo số ngẫu nhiên từ 100000 đến 999999
        return String.valueOf(otp);
    }
}


