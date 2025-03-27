/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
public class CartDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Cart> getCartByCustomerID(int customerID) {
        List<Cart> cartList = new ArrayList<>();
        String query = "SELECT * FROM Carts WHERE customerID = ?";
        
        try (
             Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, customerID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    cartList.add(new Cart(
                        rs.getInt("cartID"),
                        rs.getInt("customerID"),
                        rs.getInt("productID"),
                        rs.getInt("quantity")
                    ));
                }
            }
        } catch (Exception e) {
        }
        return cartList;
    }

    // Thêm sản phẩm vào giỏ hàng
    public void addToCart(int customerID, int productID, int quantity) {
        String query = "INSERT INTO Carts (customerID, productID, quantity) VALUES (?, ?, ?)";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, customerID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật số lượng sản phẩm trong giỏ hàng
    public void updateCart(int customerID, int productID, int quantity) {
        String query = "UPDATE Carts SET quantity = ? WHERE customerID = ? AND productID = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, quantity);
            ps.setInt(2, customerID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void removeFromCart(int customerID, int productID) {
        String query = "DELETE FROM Carts WHERE customerID = ? AND productID = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, customerID);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Xóa toàn bộ giỏ hàng của customer
    public void clearCart(int customerID) {
        String query = "DELETE FROM Carts WHERE customerID = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, customerID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Tính tổng tiền giỏ hàng theo CustomerID
    public double getCartTotal(int customerID) {
        String query = "SELECT SUM(p.price * c.quantity) AS total FROM Carts c " +
                       "JOIN Products p ON c.productID = p.ID WHERE c.customerID = ?";
        double total = 0;

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, customerID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getDouble("total");
                }
            }
        } catch (Exception e) {
        }
        return total;
    }
}
