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
<div class="col-md-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa fa-list"></i> Categories
                </div>
                <ul class="list-group category_block">
                    <c:forEach items="${listC}" var="o">
                        <li class="list-group-item text-dark ${tag == o.cID ? 'active' : ''}">
                            <a href="Category?cID=${o.cID}" class="text-decoration-none ${listC}">${o.cName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase">BestSeller</div>
                <div class="card-body text-center">
                    
                    <img class="img-fluid" src="${p.image}" alt="${p.name}" style="border-radius: 8px;">
                    <h5 class="card-title mt-2">${p.name}</h5>
                    <p class="card-text">${p.title}</p>
                    <p class="bloc_left_price text-danger fw-bold">💰 ${p.price} VND</p>
                </div>
            </div>
        </div>      