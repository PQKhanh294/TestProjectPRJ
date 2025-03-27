<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .form-control, .form-select {
            border-radius: 8px;
        }
        .btn-submit {
            background: #28a745;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            transition: 0.3s ease-in-out;
            border: none;
        }
        .btn-submit:hover {
            background: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="text-center mb-4"><i class="fas fa-desktop"></i> Detail Booking</h3>
    
    <c:choose>
        <c:when test="${sessionScope.acc == null}">
            <div class="alert alert-danger">
                You must <a href="${pageContext.request.contextPath}/login.jsp">login</a> to book a computer!
            </div>
        </c:when>
        <c:otherwise>
            <c:set var="selectedComputerId" value="${param.computerId}" />
            <c:forEach var="computer" items="${sessionScope.computers}">
                <c:if test="${computer.id == selectedComputerId}">
                    <c:set var="selectedComputer" value="${computer}" />
                </c:if>
            </c:forEach>

            <c:if test="${empty selectedComputer}">
                <div class="alert alert-danger">No computer selected or invalid computer ID.</div>
            </c:if>

            <c:if test="${not empty selectedComputer}">
                <form action="${pageContext.request.contextPath}/BookingServlet" method="post">
                    <!-- Chọn máy có sẵn -->
                    <div class="mb-3">
                        <label class="form-label">Selected Computer</label>
                        <select class="form-select" name="computerID" required>
                            <option value="${selectedComputer.id}" selected>${selectedComputer.name} (${selectedComputer.zone}) - ${selectedComputer.status}</option>
                        </select>
                    </div>

                    <!-- Ngày đặt -->
                    <div class="mb-3">
                        <label class="form-label">Booking Date</label>
                        <input type="date" class="form-control" name="bookingDate" required>
                    </div>

                    <!-- Thời gian bắt đầu -->
                    <div class="mb-3">
                        <label class="form-label">Start Time</label>
                        <input type="time" class="form-control" name="startTime" required>
                    </div>

                    <!-- Thời gian kết thúc -->
                    <div class="mb-3">
                        <label class="form-label">End Time</label>
                        <input type="time" class="form-control" name="endTime" required>
                    </div>

                    <!-- Mục đích đặt (có thể để trống) -->
                    <div class="mb-3">
                        <label class="form-label">Purpose (Optional)</label>
                        <textarea class="form-control" name="purpose" rows="3" placeholder="E.g., Practice coding, Gaming, Study"></textarea>
                    </div>

                    <!-- Nút Confirm -->
                    <button type="submit" class="btn btn-submit"><i class="fas fa-check"></i> Confirm</button>
                </form>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
