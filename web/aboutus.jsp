<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <link rel="stylesheet" href="css/aboutus.css">
    <title>PRJ Gaming Center - About Us</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/aboutus.js" defer></script>
</head>
<body>
     <jsp:include page="menu.jsp"></jsp:include>
    <div class="container">
        <div class="header">
            <h1>PRJ Gaming Center</h1>
            <p>Connecting Gamers, Delivering Experiences</p>
        </div>

        <div class="content">
            <div class="section">
                <h2>Our Impact</h2>
                <div class="statistics">
                    <div class="stat-item">
                        <h3>Active Users</h3>
                        <p class="stat-number">5,000+</p>
                    </div>
                    <div class="stat-item">
                        <h3>Gaming Hours</h3>
                        <p class="stat-number">42,000/Month</p>
                    </div>
                    <div class="stat-item">
                        <h3>Game Titles</h3>
                        <p class="stat-number">250+</p>
                    </div>
                    <div class="stat-item">
                        <h3>Tournaments</h3>
                        <p class="stat-number">36/Year</p>
                    </div>
                </div>

                <div class="chart-container">
                    <h3>Monthly User Growth ( 2024 ) </h3>
                    <canvas id="userGrowthChart"></canvas>
                </div>
            </div>

            <div class="section">
                <h2>Our Team</h2>
                <div class="team-images">
                    <div class="team-member">
                        <img src="img/khanh.png" alt="Khanh San">
                        <h3>Kain Phan Quoc</h3>
                        <p>Founder & CEO</p>
                        <p>15 years in gaming industry</p>
                    </div>
                    
                    <div class="team-member">
                        <img src="img/bach.png" alt="Sarah Rodriguez">
                        <h3>Paku Do Tran Xuan</h3>
                        <p>Technical Lead</p>
                        <p>Hardware & network expert</p>
                    </div>
                    
                    <div class="team-member">
                        <img src="img/hai.png" alt="Michael Chen">
                        <h3>Hai Vo Van</h3>
                        <p>Community Manager</p>
                        <p>Tournament & events specialist</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="contact">
            <h2>Connect With Us</h2>
            <p>📍 123 FPT City Urban Area, Ngu Hanh Son, Da Nang 550000</p>
            <p>📞 (+84) 704 599 624| ✉️ prj@cypher-gaming.com</p>
            <p>Open Daily: 24/7 </p>
        </div>
    </div>
</body>
</html>