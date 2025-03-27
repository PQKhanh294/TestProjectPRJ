<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Our Team - Cypher Gaming</title>
    <link rel="stylesheet" href="css/career.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="js/career.js" defer></script>
    
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>
    
    <!-- Header -->
    <div class="page-header">
        <div class="container text-center">
            <h1 class="display-4 fw-bold">WE NEED YOU !</h1>
            <p class="lead">Become part of something extraordinary at Cypher Gaming</p>
        </div>
    </div>
    
    <div class="container mb-5">
        <!-- Progress tracker -->
        <div class="progress-container">
            <div class="d-flex justify-content-between mb-2">
                <span>Begin Application</span>
                <span>Complete</span>
            </div>
            <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 0%" id="formProgress"></div>
            </div>
        </div>
        
        <!-- Benefits section -->
        <div class="benefits-section mb-4">
            <h4 class="mb-3"><i class="fas fa-gift benefit-icon"></i> Why Join Cypher Gaming?</h4>
            <div class="row">
                <div class="col-md-6">
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Competitive salary & benefits package</span>
                    </div>
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Professional growth opportunities</span>
                    </div>
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Dynamic & passionate team</span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Modern work environment</span>
                    </div>
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Employee gaming perks</span>
                    </div>
                    <div class="benefit-item">
                        <i class="fas fa-check-circle benefit-icon"></i>
                        <span>Work-life balance</span>
                    </div>
                </div>
            </div>
        </div>
        <% if (request.getAttribute("successMessage") != null) { %>
                        <p class="text-success text-center" style="color: green;"><%= request.getAttribute("successMessage") %></p>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                    <% } %>
        
        <!-- Application form card -->
        <div class="card shadow mb-5">
            <div class="card-header">
                <h3 class="mb-0"><i class="fas fa-file-alt me-2"></i>Application Form</h3>
            </div>
            <div class="card-body p-4">
                <form action="Job" method="post" id="jobApplicationForm">
                    <!-- Personal Information Section -->
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="step-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <h4 class="mb-0">Personal Information</h4>
                        </div>
                        
                        <div class="row g-3">
                            <!-- Full Name -->
                            <div class="col-md-6">
                                <label class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" name="fullname" class="form-control" placeholder="Enter your full name" required>
                                </div>
                            </div>
                            
                            <!-- Age -->
                            <div class="col-md-6">
                                <label class="form-label">Age</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                                    <input type="number" name="age" class="form-control" min="18" placeholder="Your age" required>
                                </div>
                            </div>
                            
                            <!-- Address -->
                            <div class="col-12">
                                <label class="form-label">Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                    <input type="text" name="address" class="form-control" placeholder="Your current address" required>
                                </div>
                            </div>
                            
                            <!-- Citizen ID -->
                            <div class="col-md-6">
                                <label class="form-label">Citizen ID</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                                    <input type="text" name="cccd" class="form-control" placeholder="Your ID number" required>
                                </div>
                            </div>
                            
                            <!-- Email -->
                            <div class="col-md-6">
                                <label class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" name="email" class="form-control" placeholder="your.email@example.com" required>
                                </div>
                            </div>
                            
                            <!-- Phone Number -->
                            <div class="col-md-6">
                                <label class="form-label">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="tel" name="phone" class="form-control" placeholder="Your phone number" required>
                                </div>
                            </div>
                            
                            <!-- Desired Salary -->
                            <div class="col-md-6">
                                <label class="form-label">Desired Salary</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                    <input type="number" name="salary" class="form-control" placeholder="Your expected salary" required>
                                    <span class="input-group-text">VND</span>
                                </div>
                                <small class="text-muted">Please enter your expected monthly salary</small>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Job Position Section -->
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="step-icon">
                                <i class="fas fa-briefcase"></i>
                            </div>
                            <h4 class="mb-0">Position Information</h4>
                        </div>
                        
                        <label class="form-label">Select Position</label>
                        <div class="row g-3 mb-3">
                            <div class="col-md-4">
                                <div class="position-card" data-position="Waiter" onclick="selectPosition(this, 'Waiter')">
                                    <div class="position-icon">
                                        <i class="fas fa-utensils"></i>
                                    </div>
                                    <h5>Waiter</h5>
                                    <p class="text-muted small">Provide exceptional service to our gaming guests</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="position-card" data-position="Chef" onclick="selectPosition(this, 'Chef')">
                                    <div class="position-icon">
                                        <i class="fas fa-utensil-spoon"></i>
                                    </div>
                                    <h5>Chef</h5>
                                    <p class="text-muted small">Create delicious meals for our gaming enthusiasts</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="position-card" data-position="HR Manager" onclick="selectPosition(this, 'HR Manager')">
                                    <div class="position-icon">
                                        <i class="fas fa-users-cog"></i>
                                    </div>
                                    <h5>HR Manager</h5>
                                    <p class="text-muted small">Lead our team and handle recruitment processes</p>
                                </div>
                            </div>
                            <input type="hidden" name="position" id="selectedPosition" value="" required>
                        </div>
                        
                        <!-- Application Reason -->
                        <div class="col-12">
                            <label class="form-label">Why do you want to join Cypher Gaming?</label>
                            <textarea name="reason" class="form-control" rows="4" placeholder="Tell us about your passion for gaming and why you'd be a perfect fit for our team..." required></textarea>
                            <div class="form-text">Share your experience, skills, and what makes you excited about this position.</div>
                        </div>
                    </div>
                    
                    <!-- Additional Information Section -->
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="step-icon">
                                <i class="fas fa-info-circle"></i>
                            </div>
                            <h4 class="mb-0">Additional Information</h4>
                        </div>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Available Start Date</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                    <input type="date" name="startDate" class="form-control">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label">Preferred Work Shift</label>
                                <select name="shift" class="form-select">
                                    <option value="">Select preferred shift</option>
                                    <option value="Morning">Morning (6am-2pm)</option>
                                    <option value="Afternoon">Afternoon (2pm-10pm)</option>
                                    <option value="Night">Night (10pm-6am)</option>
                                    <option value="Flexible">Flexible</option>
                                </select>
                            </div>
                            
                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                                    <label class="form-check-label" for="agreeTerms">
                                        I agree to the <a href="#" data-bs-toggle="modal" data-bs-target="#termsModal">terms and conditions</a> and consent to the processing of my personal data for recruitment purposes.
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg px-5 py-3">
                            <i class="fas fa-paper-plane me-2"></i>Submit Application
                        </button>
                        <p class="mt-3 text-muted small">Our team will review your application and contact you soon!</p>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- FAQ Section -->
        <div class="card shadow">
            <div class="card-header">
                <h3 class="mb-0"><i class="fas fa-question-circle me-2"></i>Frequently Asked Questions</h3>
            </div>
            <div class="card-body p-4">
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                What happens after I submit my application?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Our HR team will review your application within 3-5 business days. If your qualifications match our requirements, we'll contact you to schedule an interview.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                Do I need gaming experience to work at Cypher Gaming?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                While a passion for gaming is appreciated, it's not required for all positions. We value diverse skills and experiences that contribute to our team's success.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                What benefits do employees receive?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Our benefits include competitive salaries, health insurance, paid time off, professional development opportunities, and special gaming perks.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Terms Modal -->
    <div class="modal fade" id="termsModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Terms and Conditions</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>By submitting this application, you agree that Cypher Gaming may collect, use, and store the personal information provided for recruitment purposes. We respect your privacy and will handle your data in accordance with our privacy policy.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">I Understand</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>