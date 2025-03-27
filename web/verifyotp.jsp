<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/otp.css"> 
</head>
<body>
    <div class="wrapper">
        <div class="form-container">
            <form action="VerifyOTPServlet" method="post" class="form-reset">
                <h1 class="h3 mb-3 text-center">OTP Verification</h1>

                <%-- Display message if available --%>
                <% String message = (String) request.getAttribute("message");
                    if (message != null) { %>
                    <div class="alert alert-warning text-center"><%= message %></div>
                <% } %>

                <p class="text-center">Enter the OTP sent to your email</p>

                <div class="mb-3">
                    <input name="otp" type="text" class="form-control" placeholder="Enter OTP" required>
                </div>

                <button class="btn btn-primary w-100" type="submit">Verify OTP</button>
                <hr>
                <a href="forgotpassword.jsp" class="btn btn-secondary w-100">Back to Forgot Password</a>
            </form>
        </div>
    </div>
</body>
</html>
