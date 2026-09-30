package controller;

import java.io.IOException;
import java.util.List;

import dao.MessageDAO;
import model.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/getMessages")
public class GetMessagesServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String sender =
                (String) session.getAttribute("username");

        String receiver =
                request.getParameter("receiver");

        MessageDAO dao = new MessageDAO();

        List<Message> messages =
                dao.getMessages(sender, receiver);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder json =
                new StringBuilder("[");

        for (int i = 0; i < messages.size(); i++) {

            Message m = messages.get(i);

            json.append("{");

            json.append("\"sender\":\"")
                .append(m.getSender())
                .append("\",");

            json.append("\"receiver\":\"")
                .append(m.getReceiver())
                .append("\",");

            json.append("\"message\":\"")
                .append(m.getMessage()
                .replace("\"", "\\\""))
                .append("\",");

            json.append("\"time\":\"")
                .append(m.getMessageTime())
                .append("\"");

            json.append("}");

            if (i < messages.size() - 1) {
                json.append(",");
            }
        }

        json.append("]");

        response.getWriter()
                .print(json.toString());
    }
}