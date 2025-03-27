package dao;

import connect.DBConnect;
import model.Computer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import model.Booking;

public class ComputerDAO {
    private DBConnect dbConnect;

    public ComputerDAO() {
        dbConnect = new DBConnect();
    }

    public List<Computer> getAllComputers() throws Exception {
        List<Computer> computers = new ArrayList<>();
        String sql = "SELECT * FROM Computers";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Computer computer = new Computer();
                computer.setId(rs.getInt("ID"));
                computer.setName(rs.getString("name"));
                computer.setZone(rs.getString("zone"));
                computer.setStatus(rs.getString("status"));
                computers.add(computer);
            }
            System.out.println("DAO retrieved: " + computers.size() + " computers");
        } catch (SQLException e) {
            throw new Exception("Error retrieving computers: " + e.getMessage());
        }
        return computers;
    }

    public void updateComputerStatus(int computerId, String status) throws Exception {
        String sql = "UPDATE Computers SET status = ? WHERE ID = ?";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, computerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error updating computer status: " + e.getMessage());
        }
    }

    public void updateExpiredBookings() throws Exception {
        String sql = "EXEC UpdateComputerStatus";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.execute();
        } catch (SQLException e) {
            throw new Exception("Error executing stored procedure: " + e.getMessage());
        }
    }

    // Kiểm tra xung đột thời gian
    public boolean checkTimeConflict(int computerId, String bookingDate, String startTime, String endTime) throws Exception {
        String sql = "SELECT COUNT(*) FROM Bookings WHERE computerID = ? AND bookingDate = ? " +
                     "AND ((startTime < ? AND endTime > ?) OR (startTime < ? AND endTime > ?))";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, computerId);
            ps.setString(2, bookingDate);
            ps.setString(3, endTime);
            ps.setString(4, startTime);
            ps.setString(5, startTime);
            ps.setString(6, endTime);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // True nếu có xung đột
            }
        } catch (SQLException e) {
            throw new Exception("Error checking time conflict: " + e.getMessage());
        }
        return false;
    }

    // Lưu booking mới
    public void saveBooking(int computerId, String bookingDate, String startTime, String endTime, String purpose, int userId) throws Exception {
        String sql = "INSERT INTO Bookings (computerID, bookingDate, startTime, endTime, purpose, status, userID) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, computerId);
            ps.setString(2, bookingDate);
            ps.setString(3, startTime);
            ps.setString(4, endTime);
            ps.setString(5, purpose != null ? purpose : "");
            ps.setString(6, "Confirmed");
            ps.setInt(7, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error saving booking: " + e.getMessage());
        }
    }

    // Kiểm tra tính hợp lệ của thời gian booking
    public String checkBookingTimeValidity(String bookingDate, String startTime, String endTime) {
        // Chuyển đổi dữ liệu
        LocalDate currentDate = LocalDate.now();
        LocalTime currentTime = LocalTime.now();
        LocalDate inputDate = LocalDate.parse(bookingDate);
        LocalTime inputStartTime = LocalTime.parse(startTime);
        LocalTime inputEndTime = LocalTime.parse(endTime);

        // Kiểm tra booking trong quá khứ
        if (inputDate.isBefore(currentDate) || 
            (inputDate.equals(currentDate) && inputStartTime.isBefore(currentTime))) {
            return "Cannot book in the past!";
        }

        // Kiểm tra endTime phải sau startTime
        if (!inputEndTime.isAfter(inputStartTime)) {
            return "End time must be after start time!";
        }

        return null; // Không có lỗi
    }
    public List<Booking> getAllBookings() throws Exception {
    List<Booking> bookings = new ArrayList<>();
    String sql = "SELECT * FROM Bookings";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingID(rs.getInt("bookingID"));
            booking.setComputerID(rs.getInt("computerID"));
            booking.setBookingDate(rs.getString("bookingDate"));
            booking.setStartTime(rs.getString("startTime"));
            booking.setEndTime(rs.getString("endTime"));
            booking.setPurpose(rs.getString("purpose"));
            booking.setStatus(rs.getString("status"));
            booking.setUserID(rs.getInt("userID"));
            bookings.add(booking);
        }
    } catch (SQLException e) {
        throw new Exception("Error retrieving bookings: " + e.getMessage());
    }
    return bookings;
}
    // Thêm vào ComputerDAO.java
public String getComputerStatus(int computerId) throws Exception {
    String sql = "SELECT status FROM Computers WHERE ID = ?";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, computerId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("status");
        }
        return "Unknown";
    } catch (SQLException e) {
        throw new Exception("Error retrieving computer status: " + e.getMessage());
    }
}

public String getUsernameByUserId(int userId) throws Exception {
    String sql = "SELECT [user] FROM Accounts WHERE uID = ?";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("user");
        }
        return "Unknown";
    } catch (SQLException e) {
        throw new Exception("Error retrieving username: " + e.getMessage());
    }
}
}