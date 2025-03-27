/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author ASUS
 */
public class UserDAO {

    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    java.sql.ResultSet rs = null;

    public boolean updateUser(String userId, String username, String email) {
        // Kết nối đến cơ sở dữ liệu và thực hiện cập nhật
        // Giả sử bạn đã có một phương thức để lấy kết nối
        try {
            conn = new DBConnect().getConnection();
            String sql = "UPDATE Accounts SET [user] = ?, email = ? WHERE uID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, userId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức để thay đổi mật khẩu
    public boolean changeUserPassword(String userId, String currentPassword, String newPassword) {
        // Kiểm tra mật khẩu hiện tại và cập nhật mật khẩu mới
        try {
            conn = new DBConnect().getConnection();
            // Kiểm tra mật khẩu hiện tại
            String checkSql = "SELECT * FROM Accounts WHERE uID = ? AND pass = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, userId);
            checkStmt.setString(2, currentPassword);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Nếu mật khẩu hiện tại đúng, cập nhật mật khẩu mới
                String updateSql = "UPDATE Accounts SET pass = ? WHERE uID = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, userId);
                return updateStmt.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account getUserById(String userId) {
        Account user = null;
        try {

            conn = new DBConnect().getConnection();
            String sql = "SELECT * FROM users WHERE uID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new Account();
                user.setID(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password")); // Lưu ý: không nên lưu mật khẩu dưới dạng văn bản rõ ràng
                user.setEmail(rs.getString("email"));
                user.setIsAdmin(rs.getInt("isAdmin"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<Account> getAllUsers() {
        List<Account> userList = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            String sql = "SELECT uID, [user], email, isAdmin FROM Accounts";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Account account = new Account();
                account.setID(rs.getInt("uID"));
                account.setUsername(rs.getString("user"));
                account.setEmail(rs.getString("email"));
                account.setIsAdmin(rs.getInt("isAdmin"));
                userList.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
    public int deleteUsers(String[] userIds) {
        int deletedCount = 0;     
        try {
            conn = new DBConnect().getConnection();
            // Prevent deleting admin accounts
            String sql = "DELETE FROM Accounts WHERE uID = ? AND isAdmin = 0";
            ps = conn.prepareStatement(sql);
            
            for (String userId : userIds) {
                ps.setInt(1, Integer.parseInt(userId));
                deletedCount += ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }       
        return deletedCount;
    }
}
