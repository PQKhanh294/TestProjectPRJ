<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cypher Gaming</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/product.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
         <jsp:include page="chatbot.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<div class="container mt-4">
    <div class="row">
        <!-- Sidebar: Categories & BestSeller -->
        <jsp:include page="category.jsp"></jsp:include>
        <!-- Product List -->
        <div class="col-md-9">
            <div class="row">
                <c:if test="${empty listP}">
                    <p class="text-danger text-center">No Product!</p>
                </c:if>
                <c:forEach items="${listP}" var="o">
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm border-0 rounded">
                            <div class="product-image">
                                <img class="card-img-top" src="${o.image}" alt="${o.name}">
                            </div>
                            <div class="card-body text-center">
                                <h5 class="card-title">
                                    <a href="DetailServlet?pid=${o.ID}" class="text-dark text-decoration-none">${o.name}</a>
                                </h5>
                                <p class="card-text text-muted">${o.title}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="price text-danger fw-bold">💰 ${o.price} VND</span>
                                    <a href="Cart?add=${o.ID}" class="btn btn-success">🛒 ADD</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
