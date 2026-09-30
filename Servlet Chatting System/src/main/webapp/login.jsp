<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Keerthi Chat - Login</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}


/* =========================
   BODY
========================= */

body {

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    overflow: hidden;

    color: white;

    background:
        radial-gradient(
            circle at 15% 20%,
            rgba(6, 182, 212, 0.20),
            transparent 30%
        ),
        radial-gradient(
            circle at 85% 80%,
            rgba(139, 92, 246, 0.22),
            transparent 30%
        ),
        linear-gradient(
            135deg,
            #050b16,
            #0b1628,
            #111827
        );

}


/* =========================
   BACKGROUND GLOW
========================= */

body::before {

    content: "";

    position: absolute;

    width: 500px;

    height: 500px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            rgba(6, 182, 212, 0.08),
            transparent 70%
        );

    top: -200px;

    left: -150px;

    pointer-events: none;

}


body::after {

    content: "";

    position: absolute;

    width: 450px;

    height: 450px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            rgba(139, 92, 246, 0.10),
            transparent 70%
        );

    bottom: -200px;

    right: -150px;

    pointer-events: none;

}


/* =========================
   LOGIN CARD
========================= */

.login-container {

    position: relative;

    z-index: 2;

    width: 420px;

    max-width: 90%;

    padding: 45px 40px;

    border-radius: 24px;

    background:
        rgba(15, 23, 42, 0.82);

    border:
        1px solid rgba(56, 189, 248, 0.25);

    backdrop-filter:
        blur(20px);

    -webkit-backdrop-filter:
        blur(20px);

    box-shadow:

        0 0 40px
        rgba(6, 182, 212, 0.12),

        0 25px 70px
        rgba(0, 0, 0, 0.55);

    animation:
        cardAppear 0.7s ease;

}


@keyframes cardAppear {

    from {

        opacity: 0;

        transform:
            translateY(25px)
            scale(0.96);

    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);

    }

}


/* =========================
   LOGO
========================= */

.logo {

    width: 75px;

    height: 75px;

    margin: 0 auto 20px;

    border-radius: 22px;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 34px;

    background:
        linear-gradient(
            135deg,
            #06b6d4,
            #8b5cf6
        );

    box-shadow:

        0 0 25px
        rgba(6, 182, 212, 0.35);

    animation:
        logoGlow 2.5s infinite alternate;

}


@keyframes logoGlow {

    from {

        box-shadow:
            0 0 15px
            rgba(6, 182, 212, 0.25);

    }

    to {

        box-shadow:
            0 0 30px
            rgba(139, 92, 246, 0.45);

    }

}


/* =========================
   TITLE
========================= */

.title {

    text-align: center;

    font-size: 30px;

    font-weight: 700;

    letter-spacing: 0.5px;

    background:
        linear-gradient(
            90deg,
            #67e8f9,
            #a78bfa
        );

    -webkit-background-clip: text;

    -webkit-text-fill-color:
        transparent;

}


.subtitle {

    text-align: center;

    margin-top: 8px;

    margin-bottom: 32px;

    font-size: 13px;

    color: #94a3b8;

}


/* =========================
   FORM
========================= */

.form-group {

    margin-bottom: 20px;

}


.form-label {

    display: block;

    margin-bottom: 8px;

    font-size: 13px;

    color: #cbd5e1;

}


/* =========================
   INPUT
========================= */

.username-input {

    width: 100%;

    height: 52px;

    padding:
        0 16px;

    border-radius: 13px;

    border:
        1px solid
        rgba(148, 163, 184, 0.20);

    background:
        rgba(7, 17, 31, 0.85);

    color: white;

    font-size: 14px;

    outline: none;

    transition:
        0.3s ease;

}


.username-input::placeholder {

    color: #64748b;

}


.username-input:hover {

    border-color:
        rgba(6, 182, 212, 0.4);

}


.username-input:focus {

    border-color:
        #06b6d4;

    box-shadow:
        0 0 18px
        rgba(6, 182, 212, 0.18);

}


/* =========================
   LOGIN BUTTON
========================= */

.login-btn {

    width: 100%;

    height: 52px;

    margin-top: 5px;

    border: none;

    border-radius: 13px;

    background:
        linear-gradient(
            135deg,
            #06b6d4,
            #8b5cf6
        );

    color: white;

    font-size: 15px;

    font-weight: 700;

    letter-spacing: 0.5px;

    cursor: pointer;

    transition:
        0.3s ease;

    box-shadow:
        0 8px 25px
        rgba(6, 182, 212, 0.20);

}


.login-btn:hover {

    transform:
        translateY(-2px);

    box-shadow:

        0 0 25px
        rgba(6, 182, 212, 0.40),

        0 8px 25px
        rgba(139, 92, 246, 0.20);

}


.login-btn:active {

    transform:
        scale(0.97);

}


/* =========================
   FOOTER
========================= */

.footer {

    text-align: center;

    margin-top: 25px;

    color: #64748b;

    font-size: 11px;

}


.footer span {

    color: #67e8f9;

}


/* =========================
   ERROR MESSAGE
========================= */

.error {

    margin-bottom: 18px;

    padding: 10px;

    border-radius: 10px;

    text-align: center;

    font-size: 12px;

    color: #fecaca;

    background:
        rgba(239, 68, 68, 0.10);

    border:
        1px solid
        rgba(239, 68, 68, 0.20);

}


/* =========================
   MOBILE
========================= */

@media(max-width:500px) {

    .login-container {

        padding:
            35px 25px;

    }

    .title {

        font-size: 25px;

    }

}

</style>

</head>


<body>


<div class="login-container">


    <!-- LOGO -->

    <div class="logo">
        💬
    </div>


    <!-- TITLE -->

    <div class="title">
        Neon Chat
    </div>


    <div class="subtitle">
        Secure Messaging System
    </div>


    <!-- LOGIN FORM -->

    <form
        action="login"
        method="post">


        <div class="form-group">

            <label class="form-label">
                Username
            </label>

            <input
                type="text"
                name="username"
                class="username-input"
                placeholder="Enter your username"
                autocomplete="off"
                required>

        </div>


        <button
            type="submit"
            class="login-btn">

            LOGIN

        </button>


    </form>


    <!-- FOOTER -->

    <div class="footer">

        JSP • Servlet • AJAX • JDBC • MySQL

        <br>

        <span>Chatting System</span>

    </div>


</div>


</body>

</html>