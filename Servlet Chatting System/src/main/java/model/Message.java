package model;

public class Message {

    private int id;
    private String sender;
    private String receiver;
    private String message;
    private String messageTime;

    public Message() {
    }

    public Message(String sender, String receiver,
                   String message, String messageTime) {

        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
        this.messageTime = messageTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }
}