<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer Booking System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
         <jsp:include page="chatbot.jsp"></jsp:include>
    <style>
        :root {
            --primary-blue: #3498db;
            --light-blue: #e6f2ff;
            --dark-blue: #2980b9;
            --soft-white: #f4f7fa;
            --text-color: #2c3e50;
        }

        body {
            background-color: var(--soft-white);
            font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
            color: var(--text-color);
            line-height: 1.6;
        }

        .page-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .header-section {
            background: linear-gradient(135deg, var(--primary-blue), var(--dark-blue));
            color: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(52, 152, 219, 0.2);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navigation-actions {
            display: flex;
            gap: 1rem;
        }

        .filter-section {
            display: flex;
            justify-content: center;
            margin-bottom: 1.5rem;
            gap: 1rem;
        }

        .filter-btn {
            background-color: transparent;
            border: 2px solid var(--primary-blue);
            color: var(--primary-blue);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .filter-btn.active {
            background-color: var(--primary-blue);
            color: white;
        }

        .computer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .computer-card {
            background: white;
            border-radius: 15px;
            border: 2px solid var(--light-blue);
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
            position: relative;
            overflow: hidden;
        }

        .computer-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(52, 152, 219, 0.2);
            border-color: var(--primary-blue);
        }

        .computer-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(to right, var(--primary-blue), var(--dark-blue));
            transition: all 0.3s ease;
            opacity: 0;
        }

        .computer-card:hover::before {
            opacity: 1;
        }

        .computer-icon {
            font-size: 3rem;
            color: var(--primary-blue);
            margin-bottom: 1rem;
        }

        .computer-id {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: var(--primary-blue);
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .computer-status {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.8rem;
            margin-top: 1rem;
            color: white;
        }

        .status-available {
            background-color: #2ecc71;
        }

        .status-booked {
            background-color: #e74c3c;
        }

        .status-maintenance {
            background-color: #f39c12;
        }

        .book-button {
            background: linear-gradient(135deg, var(--primary-blue), var(--dark-blue));
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            width: 100%;
        }

        .book-button:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        }

        .alert-custom {
            border-radius: 10px;
            margin: 1rem 0;
        }

        @media (max-width: 768px) {
            .computer-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }

            .header-section {
                flex-direction: column;
                text-align: center;
            }

            .navigation-actions {
                margin-top: 1rem;
                flex-direction: column;
                width: 100%;
            }

            .navigation-actions a {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .filter-section {
                flex-direction: column;
                align-items: center;
            }

            .filter-btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-container">
        <div class="header-section">
            <div class="header-title">
                <h1 class="mb-0">
                    <i class="fas fa-desktop me-2"></i> Computer Booking System
                </h1>
            </div>
            <div class="navigation-actions">
                <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-outline-light">
                    <i class="fas fa-home me-2"></i>Back to Home
                </a>
                <a href="${pageContext.request.contextPath}/ComputerServlet" class="btn btn-light text-primary">
                    <i class="fas fa-sync-alt me-2"></i>Update Status
                </a>
            </div>
        </div>

        <div class="filter-section">
            <button class="filter-btn active" data-filter="all" onclick="filterComputers('all', this)">
                All Computers
            </button>
            <button class="filter-btn" data-filter="available" onclick="filterComputers('available', this)">
                Available
            </button>
            <button class="filter-btn" data-filter="inuse" onclick="filterComputers('inuse', this)">
                In Use
            </button>
        </div>

        <c:if test="${not empty success}">
            <div class="alert alert-success alert-custom" role="alert">
                <i class="fas fa-check-circle me-2"></i> ${success}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-custom" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i> ${error}
            </div>
        </c:if>

        <c:choose>
            <c:when test="${empty computers}">
                <div class="alert alert-info text-center" role="alert">
                    <i class="fas fa-info-circle me-2"></i> No computers available at the moment
                </div>
            </c:when>
            <c:otherwise>
                <div class="computer-grid">
                    <c:forEach var="computer" items="${computers}">
                        <div class="computer-card" 
                             data-status="${computer.status == 'In Use' ? 'inuse' : 'available'}">
                            <div class="computer-id">${computer.id}</div>
                            <i class="fas fa-desktop computer-icon"></i>
                            <h5 class="computer-name mb-3">${computer.name}</h5>
                            <p class="text-muted mb-3">${computer.zone}</p>
                            
                            <div class="computer-status 
                                ${computer.status == 'Available' ? 'status-available' : 
                                  computer.status == 'In Use' ? 'status-booked' : 
                                  'status-maintenance'}">
                                ${computer.status == 'In Use' ? 'Booked' : computer.status}
                            </div>
                            
                            <c:if test="${computer.status == 'Available'}">
                                <form action="${pageContext.request.contextPath}/DetailBookingServlet" method="post">
                                    <input type="hidden" name="computerId" value="${computer.id}">
                                    <button type="submit" class="book-button">
                                        <i class="fas fa-calendar-check"></i> Book Now
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function filterComputers(status, clickedButton) {
            // Remove active class from all buttons
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            // Add active class to clicked button
            clickedButton.classList.add('active');

            // Get all computer cards
            const computerCards = document.querySelectorAll('.computer-card');
            
            computerCards.forEach(card => {
                const cardStatus = card.getAttribute('data-status');
                
                switch(status) {
                    case 'all':
                        card.style.display = 'block';
                        break;
                    case 'available':
                        card.style.display = cardStatus === 'available' ? 'block' : 'none';
                        break;
                    case 'inuse':
                        card.style.display = cardStatus === 'inuse' ? 'block' : 'none';
                        break;
                }
            });
        }
    </script>
</body>
</html>