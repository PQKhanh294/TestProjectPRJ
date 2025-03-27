<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Product</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Poppins', sans-serif;
            }

            /* Header Bar */
            .header-bar {
                background: #007bff;
                color: white;
                font-size: 20px;
                font-weight: bold;
                padding: 15px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 10px 10px 0 0;
            }

            .close-btn {
                font-size: 24px;
                cursor: pointer;
            }

            .close-btn:hover {
                color: #ff4d4d;
            }

            /* Form Container */
            .edit-product-container {
                max-width: 600px;
                background: white;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                margin: auto;
                margin-top: 50px;
            }

            .form-control {
                border-radius: 8px;
            }

            .btn-save {
                background: #28a745;
                color: white;
                border-radius: 8px;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                transition: 0.3s;
            }

            .btn-save:hover {
                background: #218838;
            }
        </style>
    </head>
    <body>

        <!-- Header Bar -->
        <div class="header-bar">
            <span class="title">Edit Product</span>
            <a href="manageproduct.jsp" class="close-btn">&times;</a>
        </div>

        <!-- Edit Product Form -->
        <div class="edit-product-container">
            <form action="Edit" method="post">
                <div class="mb-3">
                    <label class="form-label">ID</label>
                    <input name="id" type="text" class="form-control" value="${product.ID}" readonly required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input name="name" type="text" class="form-control" value="${product.name}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Image URL</label>
                    <input name="image" type="text" class="form-control" value="${product.image}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input name="price" type="number" class="form-control" value="${product.price}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input name="title" type="text" class="form-control" value="${product.title}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="3" required>${product.description}</textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select name="category" class="form-select">
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.cID}">${o.cName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="text-end">
                    <a href="Manage" class="btn btn-secondary">Cancel</a>
                    <button type="submit" class="btn btn-save">Edit</button>
                </div>
            </form>
        </div>

    </body>
</html>
