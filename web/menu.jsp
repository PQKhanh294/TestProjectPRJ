<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cypher Gaming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/script.js" defer></script>
        <style>
            .profile-dropdown {
                position: relative;
                display: inline-block;
            }

            .profile-dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                top: 100%;
                background: white;
                border: 1px solid #ddd;
                border-radius: 4px;
                width: 200px;
                z-index: 999;
                margin-top: 5px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .profile-dropdown:hover .profile-dropdown-content {
                display: block;
            }

            .profile-dropdown-content {
                transition: all 0.3s ease;
                opacity: 0;
                visibility: hidden;
                transform: translateY(10px);
            }

            .profile-dropdown:hover .profile-dropdown-content {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }
            .profile-dropdown-content {
                margin-top: 1px; 
            }

        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="Cypher Gaming" height="50">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item"><a class="nav-link " href="home.jsp">HOME</a></li>
                            <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <li class="nav-item"><a class="nav-link" href="Product">F&B</a></li>
                            </c:if>                          
                            <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <li class="nav-item">
                             <a class="nav-link" href="#" onclick="document.getElementById('bookingForm').submit();">BOOKING</a>
                             <form id="bookingForm" action="${pageContext.request.contextPath}/ComputerServlet" method="post" style="display: none;"></form>
                            </li>
                            </c:if>
                            <li class="nav-item"><a class="nav-link" href="aboutus.jsp">ABOUT US</a></li>
                        <li class="nav-item"><a class="nav-link" href="Event#">TOURNAMENTS&EVENTS</a></li>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item"><a class="nav-link" href="Manage">MANAGEPRODUCT</a></li>
                            </c:if>
                             <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item"><a class="nav-link" href="ViewBookingsServlet">VIEWBOOKINGS</a></li>
                          </c:if>
                        
                        <li class="nav-item"><a class="nav-link" href="career.jsp">CAREERS</a></li>
                    </ul>

                    <div class="d-flex">
                        <c:if test="${sessionScope.acc == null}">
                            <a href="login.jsp" class="btn btn-outline-primary me-2">SIGN IN</a>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="d-flex align-items-center">
                                <!-- Cart Button -->
                                <a href="cart.jsp" class="btn btn-outline-primary position-relative me-3">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                        ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
                                    </span>
                                </a>

                                <!-- Profile Menu Container s? d?ng hover -->
                                <div class="profile-dropdown">
                                    <button class="btn btn-outline-primary">
                                        <i class="fa fa-user"></i> ${sessionScope.acc.username}
                                    </button>

                                    <!-- Profile Menu Options -->
                                    <div class="profile-dropdown-content shadow">
                                        <a href="profile.jsp" class="d-block p-3 text-decoration-none text-dark border-bottom">
                                            <i class="fa fa-user-circle me-2"></i> Profile
                                        </a>
                                        <form action="Login" method="get" class="p-0 m-0">
                                            <input type="hidden" name="action" value="logout">
                                            <button type="submit" class="btn w-100 text-start p-3 text-decoration-none text-dark">
                                                <i class="fa fa-sign-out-alt me-2"></i> Logout
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.acc == null}">
                            <a href="register.jsp" class="btn btn-primary">SIGN UP</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>