<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/register.css"> 
</head>
<body>
    <div class="form-container">
        <form action="Register" method="post" class="form-signup" onsubmit="return validateForm();">
            <h1 class="h3 mb-3 text-center">Sign Up</h1>

            <%-- Display error message from Servlet if exists --%>
            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
                <div class="alert alert-warning text-center"><%= message %></div>
            <% } %>

            <div class="mb-3">
                <input name="user" type="text" id="user-name" class="form-control" placeholder="Username" required>
            </div>

            <div class="mb-3">
                <input name="email" type="email" id="user-email" class="form-control" placeholder="Email" required>
            </div>

            <div class="mb-3">
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required>
            </div>

            <div class="mb-3">
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required>
            </div>

            <button class="btn btn-primary w-100" type="submit">Sign Up</button>
            <hr>
            <p class="text-danger text-center mt-2">${requestScope.errorMessage}</p>
            <a href="home.jsp" class="btn btn-secondary w-100">Back to Home</a>
        </form>
    </div>
    <script src="js/register.js"></script> 
</body>
</html>
