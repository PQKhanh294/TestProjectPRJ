<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="css/event.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
    <title>Events</title>
</head>
<body>
      <jsp:include page="menu.jsp"></jsp:include>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Tournaments & Events 🎮</h2>
        <div class="row">
            <c:if test="${empty listE}">
                <p class="text-danger text-center">No Events Available!</p>
            </c:if>
            <c:forEach var="e" items="${listE}">
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm border-0 event-card">
                        <div class="event-image">
                            <img class="card-img-top" src="${e.eventImage}" alt="Event Image">
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title">${e.eventName}</h5>
                            <p class="card-text"><strong>Date:</strong> ${e.eventDate} | <strong>Time:</strong> ${e.eventTime}</p>
                            <p class="card-text"><strong>Location:</strong> ${e.eventLocation}</p>
                            <p class="card-text">${e.eventDescription}</p>
                            <a href="${e.eventUrl}" target="_blank" class="btn btn-primary">More Info</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>


