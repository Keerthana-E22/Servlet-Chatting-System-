<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Keerthi Chat System</title>

<style>

/* =========================
   MAIN PAGE
========================= */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    min-height: 100vh;
    background:
        radial-gradient(circle at 10% 20%, #153c52 0%, transparent 35%),
        radial-gradient(circle at 90% 80%, #32184d 0%, transparent 35%),
        linear-gradient(135deg, #07111f, #0b1628, #111827);

    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

/* =========================
   CHAT CONTAINER
========================= */

.chat-container {
    width: 900px;
    max-width: 95%;
    height: 650px;

    background: rgba(15, 23, 42, 0.82);
    border: 1px solid rgba(56, 189, 248, 0.25);
    border-radius: 24px;

    box-shadow:
        0 0 40px rgba(0, 229, 255, 0.12),
        0 25px 70px rgba(0, 0, 0, 0.5);

    backdrop-filter: blur(20px);

    display: flex;
    flex-direction: column;
    overflow: hidden;
}

/* =========================
   HEADER
========================= */

.chat-header {
    height: 90px;

    padding: 0 30px;

    display: flex;
    align-items: center;
    justify-content: space-between;

    background: linear-gradient(
        90deg,
        rgba(6, 182, 212, 0.18),
        rgba(139, 92, 246, 0.18)
    );

    border-bottom: 1px solid rgba(255,255,255,0.08);
}

.logo-area {
    display: flex;
    align-items: center;
    gap: 15px;
}

.logo {
    width: 48px;
    height: 48px;

    border-radius: 15px;

    background: linear-gradient(
        135deg,
        #06b6d4,
        #8b5cf6
    );

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 24px;

    box-shadow:
        0 0 20px rgba(6,182,212,0.4);
}

.title {
    font-size: 22px;
    font-weight: 700;
}

.subtitle {
    font-size: 12px;
    color: #94a3b8;
    margin-top: 3px;
}

/* =========================
   ONLINE STATUS
========================= */

.status {
    display: flex;
    align-items: center;
    gap: 8px;

    color: #67e8f9;
    font-size: 13px;
}

.status-dot {
    width: 9px;
    height: 9px;

    border-radius: 50%;

    background: #22c55e;

    box-shadow: 0 0 12px #22c55e;
}

/* =========================
   USER SELECT AREA
========================= */

.receiver-area {
    padding: 18px 25px;

    background: rgba(15,23,42,0.75);

    border-bottom: 1px solid rgba(255,255,255,0.06);

    display: flex;
    align-items: center;
    gap: 15px;
}

.receiver-label {
    color: #94a3b8;
    font-size: 14px;
}

#receiver {

    width: 220px;

    padding: 11px 15px;

    border-radius: 12px;

    border: 1px solid rgba(56,189,248,0.3);

    background: #111c30;

    color: white;

    outline: none;

    cursor: pointer;

    transition: 0.3s;
}

#receiver:hover,
#receiver:focus {

    border-color: #06b6d4;

    box-shadow:
        0 0 15px rgba(6,182,212,0.2);
}

/* =========================
   MESSAGE AREA
========================= */

#messages {

    flex: 1;

    padding: 25px;

    overflow-y: auto;

    display: flex;

    flex-direction: column;

    gap: 12px;

    background:
        radial-gradient(
            circle at center,
            rgba(6,182,212,0.03),
            transparent 60%
        );
}

/* Scrollbar */

#messages::-webkit-scrollbar {
    width: 7px;
}

#messages::-webkit-scrollbar-track {
    background: transparent;
}

#messages::-webkit-scrollbar-thumb {

    background: linear-gradient(
        #06b6d4,
        #8b5cf6
    );

    border-radius: 10px;
}

/* =========================
   MESSAGE CARD
========================= */

.message {

    max-width: 70%;

    padding: 13px 17px;

    border-radius: 16px;

    background: rgba(30,41,59,0.9);

    border: 1px solid rgba(255,255,255,0.07);

    box-shadow:
        0 5px 15px rgba(0,0,0,0.15);

    animation: messageAppear 0.3s ease;

    line-height: 1.5;
}

@keyframes messageAppear {

    from {
        opacity: 0;
        transform: translateY(8px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.sender {

    font-size: 12px;

    color: #67e8f9;

    font-weight: 600;

    margin-bottom: 5px;
}

.time {

    font-size: 10px;

    color: #64748b;

    margin-top: 7px;

    text-align: right;
}

/* =========================
   MESSAGE INPUT
========================= */

.input-area {

    padding: 18px 22px;

    background: rgba(15,23,42,0.95);

    border-top: 1px solid rgba(255,255,255,0.08);

    display: flex;

    gap: 12px;
}

#message {

    flex: 1;

    padding: 14px 18px;

    border-radius: 14px;

    border: 1px solid rgba(56,189,248,0.2);

    background: #0b1527;

    color: white;

    font-size: 14px;

    outline: none;

    transition: 0.3s;
}

#message::placeholder {

    color: #64748b;
}

#message:focus {

    border-color: #06b6d4;

    box-shadow:
        0 0 15px rgba(6,182,212,0.18);
}

/* =========================
   SEND BUTTON
========================= */

.send-btn {

    width: 110px;

    border: none;

    border-radius: 14px;

    background: linear-gradient(
        135deg,
        #06b6d4,
        #8b5cf6
    );

    color: white;

    font-weight: 700;

    cursor: pointer;

    transition: 0.3s;

    box-shadow:
        0 5px 20px rgba(6,182,212,0.2);
}

.send-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 0 25px rgba(6,182,212,0.45);
}

.send-btn:active {

    transform: scale(0.96);
}

/* =========================
   MOBILE
========================= */

@media(max-width:700px) {

    .chat-container {
        height: 95vh;
    }

    .chat-header {
        padding: 0 18px;
    }

    .receiver-area {
        flex-direction: column;
        align-items: flex-start;
    }

    #receiver {
        width: 100%;
    }

    .message {
        max-width: 90%;
    }

    .input-area {
        padding: 12px;
    }

    .send-btn {
        width: 80px;
    }
}

</style>

</head>

<body>

<%
String username = (String) session.getAttribute("username");

if (username == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>


<div class="chat-container">

    <!-- HEADER -->

    <div class="chat-header">

        <div class="logo-area">

            <div class="logo">
                💬
            </div>

            <div>

                <div class="title">
                    Neon Chat
                </div>

                <div class="subtitle">
                    Secure messaging system
                </div>

            </div>

        </div>

        <div class="status">

            <div class="status-dot"></div>

            Online

        </div>

    </div>


    <!-- RECEIVER -->

    <div class="receiver-area">

        <span class="receiver-label">
            Chat with
        </span>

        <select id="receiver">

            <option value="arun">arun</option>
            <option value="keerthi">keerthi</option>
            <option value="rahul">rahul</option>
            <option value="priya">priya</option>

        </select>

    </div>


    <!-- MESSAGES -->

    <div id="messages"></div>


    <!-- MESSAGE INPUT -->

    <div class="input-area">

        <input
            type="text"
            id="message"
            placeholder="Type your message..."
            autocomplete="off"
        >

        <button
            class="send-btn"
            onclick="sendMessage()">
            SEND
        </button>

    </div>

</div>


<script>

/* =========================
   LOAD MESSAGES
========================= */

function loadMessages() {

    let receiver =
        document.getElementById("receiver").value;

    fetch(
        "getMessages?receiver="
        + encodeURIComponent(receiver)
    )

    .then(response => response.json())

    .then(data => {

        let output = "";

        data.forEach(function(msg) {

            output +=

                "<div class='message'>" +

                "<div class='sender'>" +

                msg.sender +

                " &rarr; " +

                msg.receiver +

                "</div>" +

                "<div>" +

                msg.message +

                "</div>" +

                "<div class='time'>" +

                msg.time +

                "</div>" +

                "</div>";

        });


        document.getElementById("messages").innerHTML =
            output;


        let box =
            document.getElementById("messages");

        box.scrollTop =
            box.scrollHeight;

    })

    .catch(error => {

        console.error(
            "Error loading messages:",
            error
        );

    });

}


/* =========================
   SEND MESSAGE
========================= */

function sendMessage() {

    let receiver =
        document.getElementById("receiver").value;

    let message =
        document.getElementById("message").value;


    if (message.trim() === "") {

        return;

    }


    fetch("sendMessage", {

        method: "POST",

        headers: {

            "Content-Type":
                "application/x-www-form-urlencoded"

        },

        body:

            "receiver=" +
            encodeURIComponent(receiver) +

            "&message=" +
            encodeURIComponent(message)

    })

    .then(response => response.text())

    .then(data => {

        console.log(
            "Server response:",
            data
        );

        document.getElementById("message").value = "";

        loadMessages();

    })

    .catch(error => {

        console.error(
            "Error sending message:",
            error
        );

    });

}


/* =========================
   CHANGE USER
========================= */

document
    .getElementById("receiver")
    .addEventListener(
        "change",
        loadMessages
    );


/* =========================
   AUTO REFRESH
========================= */

loadMessages();

setInterval(
    loadMessages,
    3000
);


/* =========================
   ENTER KEY SEND
========================= */

document
    .getElementById("message")
    .addEventListener(
        "keypress",
        function(event) {

            if (event.key === "Enter") {

                sendMessage();

            }

        }
    );

</script>

</body>
</html>