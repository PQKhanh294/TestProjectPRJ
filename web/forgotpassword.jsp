<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/forgotpassword.css"> 
</head>
<body>
    <div class="wrapper">
        <div class="form-container">
            <form action="ForgotPasswordServlet" method="post" class="form-reset">
                <h1 class="h3 mb-3 text-center">Forgot Password</h1>

                <%-- Display message if available --%>
                <% String message = (String) request.getAttribute("message");
                    if (message != null) { %>
                    <div class="alert alert-warning text-center"><%= message %></div>
                <% } %>

                <p class="text-center">Enter your email to receive a OTP code</p>

                <div class="mb-3">
                    <input name="email" type="email" class="form-control" placeholder="Enter your email" required>
                </div>

                <button class="btn btn-primary w-100" type="submit">Send Verification Code</button>
                <hr>
                <a href="login.jsp" class="btn btn-secondary w-100">Back to Login</a>
            </form>
        </div>
    </div>
</body>
</html>

