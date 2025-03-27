<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Poppins', sans-serif;
        }

        .table-title {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            padding: 15px;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            transition: transform 0.3s;
        }

        .product-image:hover {
            transform: scale(1.1);
        }

        .btn-action {
            padding: 6px 10px;
            font-size: 14px;
            border-radius: 6px;
        }

        .modal-header {
            background: #007bff;
            color: white;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        @media (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }
            .table th, .table td {
                font-size: 14px;
                padding: 10px;
            }
            .product-image {
                width: 50px;
                height: 50px;
            }
            .btn-action {
                font-size: 12px;
                padding: 5px 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="table-wrapper shadow p-3 mb-5 bg-white rounded">
            <div class="table-title d-flex justify-content-between align-items-center flex-wrap">
                <h2 class="mb-0">Manage <b>Products</b></h2>
                <a href="#addProductModal" class="btn btn-success btn-action" data-bs-toggle="modal">
                    <i class="bi bi-plus-circle"></i> Add Product
                </a>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover mt-3">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.ID}</td>
                                <td>${o.name}</td>
                                <td><img src="${o.image}" alt="${o.name}" class="product-image"></td>
                                <td>${o.price} VND</td>
                                <td>
                                    <a href="EditForm?pid=${o.ID}" class="btn btn-warning btn-action">
                                        <i class="bi bi-pencil-fill"></i>
                                    </a>
                                    <a href="Delete?ID=${o.ID}" class="btn btn-danger btn-action">
                                        <i class="bi bi-trash-fill"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div id="addProductModal" class="modal fade" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="Add" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Image URL</label>
                            <input name="image" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <input name="price" type="number" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input name="title" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-control" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="category" class="form-select">
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.cID}">${o.cName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>
