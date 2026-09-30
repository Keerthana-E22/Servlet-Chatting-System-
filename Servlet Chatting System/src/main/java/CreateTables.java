import java.sql.Connection;
import java.sql.Statement;

import dao.DBConnection;

public class CreateTables {

    public static void main(String[] args) {

        try {

            Connection con = DBConnection.getConnection();

            Statement stmt = con.createStatement();

            // Create users table
            String usersTable =
                    "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "username VARCHAR(50) UNIQUE NOT NULL" +
                    ")";

            stmt.executeUpdate(usersTable);

            // Create messages table
            String messagesTable =
                    "CREATE TABLE IF NOT EXISTS messages (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "sender VARCHAR(50) NOT NULL, " +
                    "receiver VARCHAR(50) NOT NULL, " +
                    "message TEXT NOT NULL, " +
                    "message_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                    ")";

            stmt.executeUpdate(messagesTable);

            // Insert sample users
            stmt.executeUpdate(
                "INSERT IGNORE INTO users (username) VALUES " +
                "('keerthi'), ('arun'), ('rahul'), ('priya')"
            );

            System.out.println("Tables created successfully!");
            System.out.println("Users added successfully!");

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}