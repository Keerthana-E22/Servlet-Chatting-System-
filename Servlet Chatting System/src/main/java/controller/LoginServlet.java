package controller;

import java.io.IOException;

import dao.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String sql =
            "SELECT * FROM users WHERE username=?";

        try (Connection con =
                DBConnection.getConnection();
             PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "username",
                        username
                );

                response.sendRedirect("chat.jsp");

            } else {

                response.sendRedirect(
                    "login.jsp?error=Invalid username"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "login.jsp?error=Database error"
            );
        }
    }
}