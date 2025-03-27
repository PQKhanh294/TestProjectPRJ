package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Order;

public class OrderDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int insertOrder(Order order) {
        String sql = "INSERT INTO [dbo].[Orders] ([UserID], [TotalAmount]) VALUES(?, ?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserID());
            ps.setDouble(2, order.getTotalAmount());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return -1;
    }
    
    public boolean updateOrderStatus(Order order) {
        String sql = "UPDATE [dbo].[Orders] SET [Status] = ? WHERE Id = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getStatus());
            ps.setInt(2, order.getID());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }
}
