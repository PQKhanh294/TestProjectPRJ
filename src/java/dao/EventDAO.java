package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Event;

public class EventDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Event> getAllEvents() {
        List<Event> list = new ArrayList<>();
        String query = "SELECT * FROM Tournaments_Events";
        try {
            conn = new DBConnect().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Event(
                        rs.getInt(1),  // eventID
                        rs.getString(2), // eventName
                        rs.getString(3), // eventImage
                        rs.getDate(4), // eventDate
                        rs.getTime(5), // eventTime
                        rs.getString(6), // eventLocation
                        rs.getString(7), // eventDescription
                        rs.getString(8)  // eventUrl
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
