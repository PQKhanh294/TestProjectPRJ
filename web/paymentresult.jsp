<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Result</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }
        .icon {
            font-size: 60px;
            margin-bottom: 20px;
        }
        .success { color: #28a745; }
        .error { color: #dc3545; }
        .pending { color: #ffc107; }
        .message {
            font-size: 18px;
            margin: 15px 0;
        }
        .phone {
            color: red;
            font-size: 22px;
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Successful transaction -->
        <c:if test="${transResult}">
            <i class="fas fa-check-circle icon success"></i>
            <h3 class="success">Transaction Successful!</h3>
            <p class="message">Please wait for our staff to contact you.</p>
            <p class="phone">Phone: 0383459560</p>
        </c:if>

        <!-- Failed transaction -->
        <c:if test="${transResult == false}">
            <i class="fas fa-times-circle icon error"></i>
            <h3 class="error">Transaction Failed!</h3>
            <p class="message">Thank you for using our service.</p>
            <p class="message">For assistance, please contact:</p>
            <p class="phone">Phone: 0383456xxx</p>
        </c:if>

        <!-- Pending transaction -->
        <c:if test="${transResult == null}">
            <i class="fas fa-hourglass-half icon pending"></i>
            <h3 class="pending">Transaction is Processing!</h3>
            <p class="message">Please wait while we process your order.</p>
            <p class="phone">Phone: 0383456xxx</p>
        </c:if>

        <!-- Home button -->
        <a href="home.jsp" class="btn">Return to Home</a>
    </div>
</body>
</html>