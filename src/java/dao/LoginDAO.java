

package dao;

import connect.DBConnect;
import java.sql.*;
import model.Account;


public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        String query = "Select * from accounts\n"
                + "where [user] = ?\n"
                + "and pass = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void register(String user, String pass, String email) {
        String query = "INSERT INTO Accounts ([user], [pass], [email], isAdmin) VALUES (?, ?, ?, 0)";
        try {
            conn = new DBConnect().getConnection(); // Mở kết nối SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();
            System.out.println("Đăng ký thành công!");
        } catch (SQLException e) {
            System.err.println("Lỗi SQL: " + e.getMessage()); // In lỗi SQL
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi chung
        }
    }

    public Account checkAccountExist(String user) {
        String query = "select * from accounts\n"
                + "where [user] = ?\n";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        LoginDAO loginDAO = new LoginDAO();

        // Đăng ký tài khoản mới
        String username = "POK";
        String password = "147678";
        String email = "?";

        loginDAO.register(username, password, email);
        System.out.println("Đăng ký thành công!");

        // Kiểm tra đăng nhập
        Account account = loginDAO.login(username, password);
        if (account != null) {
            System.out.println("Đăng nhập thành công! Thông tin tài khoản:");
            System.out.println("ID: " + account.getID());
System.out.println("User: " + account.getUsername());
            System.out.println("Email: " + account.getEmail());
        } else {
            System.out.println("Đăng nhập thất bại. Sai thông tin đăng nhập.");
        }
    }  

    public Account checkEmailExist(String email) {
        String query = "SELECT * FROM Accounts WHERE email = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("uID"),
                        rs.getString("user"),
                        rs.getString("pass"),
                        rs.getString("email"),
                        rs.getInt("isAdmin"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy email
    }
    public boolean updatePassword(String email, String newPassword) {
     String query = "UPDATE Accounts SET pass = ? WHERE email = ?";
     try {
         conn = new DBConnect().getConnection(); // Mo ket noi voi SQL
         ps = conn.prepareStatement(query);
         ps.setString(1, newPassword);
         ps.setString(2, email);
         int updatedRows = ps.executeUpdate();
         return updatedRows > 0;
     } catch (Exception e) {
     } finally {
         try {
             if (ps != null) ps.close();
             if (conn != null) conn.close();
         } catch (Exception e) {
         }
     }
     return false;
 }
}