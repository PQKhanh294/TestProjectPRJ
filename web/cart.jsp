<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container mt-5 animation-fade">
    <h2 class="page-title"><i class="fas fa-shopping-cart me-2"></i>Your Shopping Cart</h2>
    
    <div class="row">
        <!-- Shopping Cart Items -->
        <div class="col-lg-8">
            <div class="cart-container">
                <c:if test="${empty sessionScope.cart}">
                    <div class="cart-empty">
                        <i class="fas fa-shopping-basket"></i>
                        <p class="cart-empty-message">Your cart is currently empty!</p>
                        <a href="Product" class="btn btn-primary continue-shopping">
                            <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                        </a>
                    </div>
                </c:if>
                
                <c:if test="${not empty sessionScope.cart}">
                    <c:forEach var="entry" items="${sessionScope.cart}">
                        <c:set var="productId" value="${entry.key}" />
                        <c:set var="quantity" value="${entry.value}" />
                        <c:set var="product" value="${productMap[productId]}" />
                        
                        <div class="product-card">
                            <img src="${product.image}" alt="${product.name}" class="product-image">
                            <div class="product-details">
                                <div>
                                    <h5 class="product-name">${product.name}</h5>
                                    <p class="product-price">💰 ${product.price} VND</p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="quantity-control">
                                        <a href="Cart?decrease=${productId}" class="quantity-btn">
                                            <i class="fas fa-minus"></i>
                                        </a>
                                        <span class="quantity-value">${quantity}</span>
                                        <a href="Cart?increase=${productId}" class="quantity-btn">
                                            <i class="fas fa-plus"></i>
                                        </a>
                                    </div>
                                    <div class="product-total">💰 ${quantity * product.price} VND</div>
                                </div>
                            </div>
                            <a href="Cart?remove=${productId}" class="remove-product">
                                <i class="fas fa-times"></i>
                            </a>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        
        <!-- Order Summary -->
        <c:if test="${not empty sessionScope.cart}">
            <div class="col-lg-4">
                <div class="cart-summary">
                    <h3 class="summary-title">Order Summary</h3>
                    
                    <div class="summary-item">
                        <span>Subtotal:</span>
                        <span>💰 ${totalPrice} VND</span>
                    </div>
                    
                    <div class="summary-item">
                        <span>Shipping Fee:</span>
                        <span>💰 0 VND</span>
                    </div>
                    
                    <div class="summary-item">
                        <span>Discount:</span>
                        <span>- 💰 0 VND</span>
                    </div>
                    
                    <div class="summary-item total">
                        <span>Total:</span>
                        <span class="text-danger">💰 ${totalPrice} VND</span>
                    </div>
                    
                    <!-- Checkout Form (Send total price to PaymentServlet) -->
                    <form action="Payment" method="post">
                        <input type="hidden" name="totalBill" value="${totalPrice}">
                        <button type="submit" class="btn btn-success checkout-btn">
                            <i class="fas fa-credit-card me-2"></i>Proceed to Payment
                        </button>
                    </form>

                    <div class="d-flex justify-content-between mt-4">
                        <a href="Home" class="btn btn-outline-primary btn-action">
                            <i class="fas fa-arrow-left me-1"></i>Continue Shopping
                        </a>                        
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 <style>
        :root {
            --primary: #3a86ff;
            --secondary: #ff006e;
            --success: #38b000;
            --warning: #ffbe0b;
            --danger: #ff5a5f;
            --dark: #212529;
            --light: #f8f9fa;
        }
        
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .cart-container {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 40px;
        }
        
        .page-title {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 25px;
            position: relative;
            display: inline-block;
        }
        
        .page-title:after {
            content: '';
            position: absolute;
            width: 60%;
            height: 3px;
            background: var(--primary);
            bottom: -8px;
            left: 0;
        }
        
        .cart-empty {
            background: #fff5f5;
            border-radius: 12px;
            padding: 35px;
            text-align: center;
        }
        
        .cart-empty i {
            font-size: 60px;
            color: var(--danger);
            margin-bottom: 20px;
            display: block;
        }
        
        .cart-empty-message {
            font-size: 18px;
            margin-bottom: 25px;
        }
        
        .continue-shopping {
            padding: 12px 24px;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .continue-shopping:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(58, 134, 255, 0.3);
        }
        
        .product-card {
            display: flex;
            background: white;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            position: relative;
        }
        
        .product-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .product-details {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .product-name {
            font-weight: 700;
            font-size: 18px;
            color: var(--dark);
            margin-bottom: 5px;
        }
        
        .product-price {
            color: var(--primary);
            font-weight: 600;
            font-size: 16px;
        }
        
        .product-total {
            color: var(--secondary);
            font-weight: 700;
            font-size: 18px;
        }
        
        .quantity-control {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        
        .quantity-btn {
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #f0f2f5;
            color: var(--dark);
            font-size: 14px;
            transition: all 0.2s;
            border: none;
        }
        
        .quantity-btn:hover {
            background: var(--primary);
            color: white;
        }
        
        .quantity-value {
            width: 40px;
            text-align: center;
            font-weight: 600;
            font-size: 16px;
            margin: 0 8px;
        }
        
        .remove-product {
            position: absolute;
            top: 15px;
            right: 15px;
            color: var(--danger);
            background: rgba(255, 90, 95, 0.1);
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }
        
        .remove-product:hover {
            background: var(--danger);
            color: white;
            transform: rotate(90deg);
        }
        
        .cart-summary {
            background: #f8f9fa;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }
        
        .summary-title {
            font-weight: 700;
            font-size: 20px;
            margin-bottom: 20px;
            color: var(--dark);
            position: relative;
            display: inline-block;
        }
        
        .summary-title:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 3px;
            background: var(--secondary);
            bottom: -8px;
            left: 0;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 15px;
        }
        
        .summary-item.total {
            font-weight: 700;
            font-size: 18px;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 2px dashed #dee2e6;
        }
        
        .checkout-btn {
            width: 100%;
            padding: 14px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 16px;
            margin-top: 20px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .checkout-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.4s;
            z-index: -1;
        }
        
        .checkout-btn:hover::before {
            left: 100%;
        }
        
        .checkout-btn:hover {
            box-shadow: 0 8px 20px rgba(56, 176, 0, 0.3);
            transform: translateY(-3px);
        }
        
        @media (max-width: 768px) {
            .product-card {
                flex-direction: column;
                align-items: center;
                text-align: center;
                padding: 20px;
            }
            
            .product-image {
                margin-right: 0;
                margin-bottom: 15px;
            }
            
            .quantity-control {
                justify-content: center;
                margin: 15px 0;
            }
            
            .remove-product {
                top: 10px;
                right: 10px;
            }
            
            .cart-summary {
                margin-top: 20px;
            }
        }
        
        .btn-action {
            border-radius: 8px;
            font-weight: 600;
            padding: 8px 16px;
            transition: all 0.3s;
        }
        
        .btn-action:hover {
            transform: translateY(-2px);
        }
        
        .animation-fade {
            animation: fadeIn 0.5s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>