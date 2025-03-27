<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/resetpassword.css"> 
</head>
<body>
    <div class="wrapper">
        <div class="form-container">
            <form action="ResetPasswordServlet" method="post" class="form-reset">
                <h1 class="h3 mb-3 text-center">Reset Password</h1>

                <%-- Display message if available --%>
                <% String message = (String) request.getAttribute("message");
                    if (message != null) { %>
                    <div class="alert alert-danger text-center"><%= message %></div>
                <% } %>

                <p class="text-center">Enter your new password</p>

                <div class="mb-3">
                    <input type="password" name="newPassword" class="form-control" placeholder="Enter new password" required>
                </div>

                <button class="btn btn-primary w-100" type="submit">Confirm</button>
                <hr>
                <a href="login.jsp" class="btn btn-secondary w-100">Back to Login</a>
            </form>
        </div>
    </div>
</body>
</html>
