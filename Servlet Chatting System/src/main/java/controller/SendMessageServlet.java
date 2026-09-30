package controller;

import java.io.IOException;

import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String sender =
                (String) session.getAttribute("username");

        String receiver =
                request.getParameter("receiver");

        String message =
                request.getParameter("message");

        System.out.println("Sender: " + sender);
        System.out.println("Receiver: " + receiver);
        System.out.println("Message: " + message);

        MessageDAO dao = new MessageDAO();

        boolean success =
                dao.sendMessage(
                        sender,
                        receiver,
                        message
                );

        response.setContentType("text/plain");

        if (success) {
            response.getWriter().print("success");
        } else {
            response.getWriter().print("failed");
        }
    }
}