<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer Lab Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
     <jsp:include page="menu.jsp"></jsp:include>
    <div class="container container-bookings">
        <div class="header">
            <div class="header-title">
                <i class="fas fa-laptop-code"></i> 
                Computer Lab Bookings
            </div>
            <a href="home.jsp" class="btn btn-dashboard">
                <i class="fas fa-home"></i> 
                Back to Dashboard
            </a>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i> ${error}
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${empty bookings}">
                <div class="alert alert-info" role="alert">
                    <i class="fas fa-info-circle me-2"></i> No bookings found.
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-bookings table-hover mb-0">
                        <thead>
                            <tr>
                                <th><i class="fas fa-bookmark me-2"></i>Booking ID</th>
                                <th><i class="fas fa-desktop me-2"></i>Computer</th>
                                <th><i class="fas fa-calendar-day me-2"></i>Date</th>
                                <th><i class="fas fa-clock me-2"></i>Start</th>
                                <th><i class="fas fa-clock me-2"></i>End</th>
                                <th><i class="fas fa-tasks me-2"></i>Purpose</th>
                                <th><i class="fas fa-info-circle me-2"></i>Status</th>
                                <th><i class="fas fa-user me-2"></i>User ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.bookingID}</td>
                                    <td>${booking.computerID}</td>
                                    <td>${booking.bookingDate}</td>
                                    <td>${booking.startTime}</td>
                                    <td>${booking.endTime}</td>
                                    <td>${booking.purpose}</td>
                                    <td>
                                        <span class="status-confirmed">
                                            ${booking.status}
                                        </span>
                                    </td>
                                    <td>${booking.userID}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<style>
        :root {
            --pastel-blue: #E6F2FF;
            --light-blue: #BAE6FD;
            --soft-blue: #7DD3FC;
            --primary-blue: #38BDF8;
            --dark-blue: #0284C7;
        }
        body {
            background-color: #f8fafc;
            font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
        }
        .container-bookings {
            max-width: 1200px;
            margin: 50px auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid var(--pastel-blue);
            padding-bottom: 15px;
        }
        .header-title {
            display: flex;
            align-items: center;
            color: var(--dark-blue);
            font-size: 1.5rem;
            font-weight: 600;
        }
        .header-title i {
            margin-right: 12px;
            color: var(--primary-blue);
        }
        .btn-dashboard {
            background-color: var(--primary-blue);
            color: white;
            border: none;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 15px;
            transition: background-color 0.3s ease;
        }
        .btn-dashboard:hover {
            background-color: var(--dark-blue);
        }
        .table-bookings {
            border-radius: 10px;
            overflow: hidden;
        }
        .table-bookings thead {
            background-color: var(--pastel-blue);
            color: var(--dark-blue);
        }
        .table-bookings thead th {
            font-weight: 600;
            padding: 12px;
            border: none;
        }
        .status-confirmed {
            background-color: #DEFAE6;
            color: #22C55E;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        .table-bookings tbody tr:hover {
            background-color: var(--pastel-blue);
        }
    </style>