<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String savedUser = "";
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("user".equals(c.getName())) {
                savedUser = c.getValue();
                break;
            }
        }
    }
%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Cypher Gaming</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body class="vh-100">
        <div class="container-fluid h-100">
            <div class="row h-100">
                <!-- Login Form (3 phần) -->
                <div class="col-md-3 d-flex flex-column justify-content-center align-items-center bg-light shadow login-box">
                    <h3 class="fw-bold mb-4">Login</h3>
                    <form action="Login" method="post" class="w-75">
                        <div class="mb-3">
                            <input type="text" class="form-control input-box" id="username" name="user" 
                                   placeholder="Username" value="<%= savedUser%>" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control input-box" id="password" name="pass" placeholder="Password" required>
                        </div>

                        <div class="d-flex justify-content-between">
                            <div class="form-check mb-3">
                                <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                            </div>

                            <a href="fotgotpassword.jsp" class="text-decoration-none">Forgot password?</a>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>
                        <p class="text-danger text-center mt-2">${requestScope.errorMessage}</p>
                        <p class="text-success text-center mt-2">${requestScope.successMessage}</p>
                    </form>
                    <p class="mt-3">Don't have an account?</p>
                    <a href="register.jsp" class="btn btn-success w-75">Register</a> <!-- Nút Register màu xanh lá -->
                </div>

                <!-- Image (9 phần) -->
                <div class="col-md-9 p-0">
                    <img src="img/login.png" class="img-fluid w-100 h-100 object-fit-cover" alt="Game Background">
                </div>
            </div>
        </div>

        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
</html>
login.jsp