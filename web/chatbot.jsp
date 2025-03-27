<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BackDoor</title>
    <!-- Google Fonts & Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="css/chatbot.css">
    <!-- JavaScript -->
    <script src="js/chatbot.js" defer></script>
</head>
<body>
    <!-- Button Toggle Chatbot -->
    <button class="chatbot-toggler">
        <span class="material-symbols-outlined">chat</span>
        <span class="material-symbols-outlined">close</span>
    </button>
    <!-- Chatbot UI -->
    <div class="chatbot">
        <header>
            <h2>Chatbot</h2>
            <span class="material-symbols-outlined close-btn">close</span>
        </header>
        <ul class="chatbox">
            <li class="chat incoming">
                <span class="material-symbols-outlined">smart_toy</span>
                <p>Hi there! <br> How can I help you today?</p>
            </li>
        </ul>
        <div class="chat-input">
            <textarea placeholder="Type a message..."></textarea>
            <button id="send-btn">
                <span class="material-symbols-outlined">send</span>
            </button>
        </div>
    </div>
</body>
</html>