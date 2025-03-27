<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cypher Gaming - Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/script.js" defer></script>
    </head>
    <body>
        <!-- Include the navbar -->
        <jsp:include page="menu.jsp" />

        <!-- Profile Content -->
        <div class="container profile-container">
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="profile-card">
                        <div class="profile-header">
                            <div class="profile-avatar">
                                <i class="fa-solid fa-user-astronaut"></i>
                            </div>
                            <h1>User Profile</h1>
                            <p class="user-type">
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <span class="badge bg-danger"><i class="fas fa-crown"></i> Administrator</span>
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 0}">
                                    <span class="badge bg-primary"><i class="fas fa-gamepad"></i> Gamer</span>
                                </c:if>
                            </p>
                        </div>

                        <div class="profile-body">
                            <div class="profile-info">
                                <div class="info-item">
                                    <span class="info-label"><i class="fas fa-id-card"></i> User ID</span>
                                    <span class="info-value">#${sessionScope.acc.ID}</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label"><i class="fas fa-user"></i> Username</span>
                                    <span class="info-value">${sessionScope.acc.username}</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label"><i class="fas fa-envelope"></i> Email</span>
                                    <span class="info-value">${sessionScope.acc.email}</span>
                                </div>
                            </div>

                            <div class="profile-actions">
                                <button class="btn btn-primary action-btn" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                                    <i class="fas fa-edit"></i> Edit Profile
                                </button>
                                <button class="btn btn-warning action-btn" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                                    <i class="fas fa-key"></i> Change Password
                                </button>

                                <!-- Only show Delete Account button for admin users -->
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <div class="profile-actions">
                                            <button class="btn btn-danger action-btn" data-bs-toggle="modal" data-bs-target="#deleteUsersModal">
                                                <i class="fas fa-trash-alt"></i> Delete Users
                                            </button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Profile Modal (unchanged) -->
        <div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-edit"></i> Edit Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="Profile" method="get">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" value="${sessionScope.acc.username}" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${sessionScope.acc.email}" required>
                            </div>
                            <input type="hidden" name="userId" value="${sessionScope.acc.ID.toString()}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Change Password Modal (unchanged) -->
        <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-key"></i> Change Password</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="Profile" method="post">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="currentPassword" class="form-label">Current Password</label>
                                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                            </div>
                            <div class="mb-3">
                                <label for="newPassword" class="form-label">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            <input type="hidden" name="userId" value="${sessionScope.acc.ID}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-warning">Change Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Users Modal (New) -->
        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <div class="modal fade" id="deleteUsersModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"><i class="fas fa-trash-alt"></i> Delete Users</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="DeleteAccount" method="post">
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes()">
                                            </th>
                                            <th>User ID</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>User Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${userList}">
                                            <c:if test="${user.ID != sessionScope.acc.ID}">
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="selectedUsers" value="${user.ID}" 
                                                               class="user-checkbox" 
                                                               ${user.isAdmin == 1 ? 'disabled' : ''}>
                                                    </td>
                                                    <td>#${user.ID}</td>
                                                    <td>${user.username}</td>
                                                    <td>${user.email}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.isAdmin == 1}">
                                                                <span class="badge bg-danger">Administrator</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-primary">Gamer</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" name="action" value="deleteUsers" class="btn btn-danger" onclick="return confirmDelete()">
                                    <i class="fas fa-trash-alt"></i> Delete Selected Users
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>

        <script>
            function toggleAllCheckboxes() {
                var selectAll = document.getElementById('selectAll');
                var checkboxes = document.getElementsByClassName('user-checkbox');

                for (var i = 0; i < checkboxes.length; i++) {
                    if (!checkboxes[i].disabled) {
                        checkboxes[i].checked = selectAll.checked;
                    }
                }
            }

            function confirmDelete() {
                var checkboxes = document.getElementsByName('selectedUsers');
                var checked = false;

                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        checked = true;
                        break;
                    }
                }

                if (!checked) {
                    alert('Please select at least one user to delete.');
                    return false;
                }

                return confirm('Are you sure you want to delete the selected users? This action cannot be undone.');
            }
        </script>
    </body>
</html>