<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cypher Gaming</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/home.js" defer></script>
      <jsp:include page="chatbot.jsp"></jsp:include>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="menu.jsp"></jsp:include>

    <!-- Hero Section -->
    <header class="hero-section">
        <img src="img/home0.png" alt="Cypher Gaming" class="hero-image">
        <div class="overlay">
            <h1>Welcome to Cypher Gaming</h1>
            <p>Experience the ultimate gaming space with professional services.</p>
            <c:if test="${sessionScope.acc == null}">
            <button class="btn btn-light btn-lg" onclick="window.location.href = 'login.jsp'">Join Now</button>
            </c:if>
            <c:if test="${sessionScope.acc != null}">
                            <button class="btn btn-light btn-lg" onclick="window.location.href = 'login.jsp'">Log Out</button>
                        </c:if>
        </div>
    </header>

    <!-- Gaming Sections -->
    <div class="gallery">
        <div class="section active" onclick="expandSection(this)">
            <img src="img/home1.png" alt="Arena">
            <div class="text-content">
                <h3>ESPORTS Space</h3>
                <h2>ARENA</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
        <div class="section" onclick="expandSection(this)">
            <img src="img/home2.png" alt="Decor">
            <div class="text-content">
                <h3>ESPORTS SPACE</h3>
                <h2>DECOR</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
        <div class="section" onclick="expandSection(this)">
            <img src="img/home3.png" alt="Clean">
            <div class="text-content">
                <h3>ESPORTS Space</h3>
                <h2>CLEAN</h2>
                <p>Possessing a modern design style that emphasizes customer experience...</p>
            </div>
        </div>
    </div>

    <div class="container custom-section">
        <!-- Row 1 -->
        <div class="row align-items-center mb-5">
            <div class="col-md-6 image-section">
                <img src="img/home4.png" alt="Gaming Monitor" class="img-fluid">
            </div>
            <div class="col-md-6 text-content2">
                <h3>PRJ ESPORTS ARENA</h3>
                <h2>Screen 240Hz - 360Hz</h2>
                <p>Equipped with 100% 240Hz screens from top brands like Samsung, Predator, and Asus, and is a pioneer in using the Zowie XL2566K 360Hz display.</p>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row align-items-center">
            <div class="col-md-6 text-content2">
                <h3>PRJ ESPORTS ARENA</h3>
                <h2>HI-END GEAR</h2>
                <p>Using gaming gear according to eSports standards, including: AKKO mechanical keyboard, Endgame Gear gaming mouse from Germany, and Zowie EC series mouse.</p>
            </div>
            <div class="col-md-6 image-section">
                <img src="img/home5.png" alt="Gaming Monitor" class="img-fluid">
            </div>
        </div>
    </div>

    <!-- Contact Section -->
    <div class="container contact-section">
        <div class="row">
            <div class="col-md-6 contact-image">
                <img src="img/home6.png" alt="Contact Image">
            </div>
            <div class="col-md-6 contact-form">
                <form action="SendMail" method="post">
                    <select name="center">
                        <option>PRJ Esports Center</option>
                    </select>
                    <input type="text" name="fullName" placeholder="Full Name" required>
                    <input type="text" name="phone" placeholder="Phone Number" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <textarea name="message" placeholder="Message" required></textarea>
                    <button type="submit">SEND</button>

                    <% if (request.getAttribute("successMessage") != null) { %>
                        <p class="text-success text-center" style="color: green;"><%= request.getAttribute("successMessage") %></p>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                    <% } %>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
