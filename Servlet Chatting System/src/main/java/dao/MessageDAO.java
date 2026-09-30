package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Message;

public class MessageDAO {

    public boolean sendMessage(String sender,
                               String receiver,
                               String message) {

        String sql = "INSERT INTO messages " +
                     "(sender, receiver, message) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setString(3, message);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public List<Message> getMessages(String sender,
                                      String receiver) {

        List<Message> messages = new ArrayList<>();

        String sql =
            "SELECT * FROM messages " +
            "WHERE (sender=? AND receiver=?) " +
            "OR (sender=? AND receiver=?) " +
            "ORDER BY message_time ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setString(3, receiver);
            ps.setString(4, sender);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Message m = new Message();

                m.setId(rs.getInt("id"));
                m.setSender(rs.getString("sender"));
                m.setReceiver(rs.getString("receiver"));
                m.setMessage(rs.getString("message"));
                m.setMessageTime(
                    rs.getString("message_time")
                );

                messages.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return messages;
    }
}