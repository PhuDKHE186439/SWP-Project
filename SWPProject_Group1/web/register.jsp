<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="TrainTravel : Register Page" />

        <!-- OG -->
        <meta property="og:title" content="TrainTravel : Register Page" />
        <meta property="og:description" content="TrainTravel : Register Page" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/TrainLogo.png" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/TrainLogo.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>TrainTravel : Register Page </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

        <style>
            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
                display: none;
            }
            
            .input-error {
                border-color: red !important;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image:url(assets/images/background/TrainBG.jpg);">
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Sign Up <span>Now</span></h2>
                            <p>Login Your Account <a href="login">Click here</a></p>
                            <c:if test="${not empty requestScope.annoutment}">
                                <p style="color: Red">${requestScope.annoutment}</p>
                            </c:if>
                        </div>	
                        <form class="contact-bx" action="register" method="post" autocomplete="off" id="registerForm" onsubmit="return validateForm()">
                            <div class="row placeani">
                                <!-- Name Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="name" type="text" required class="form-control" 
                                                   placeholder="Your Name" value="${param.name}"
                                                   pattern="^[A-Za-z\s]{2,50}$"
                                                   title="Name should only contain letters and spaces, length between 2-50 characters">
                                        </div>
                                        <div class="error-message" id="nameError"></div>
                                    </div>
                                </div>

                                <!-- Phone Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="phone" type="tel" required class="form-control" 
                                                   pattern="[0-9]{10}" placeholder="Your Phone Number (10 digits)" 
                                                   value="${param.phone}">
                                        </div>
                                        <div class="error-message" id="phoneError"></div>
                                    </div>
                                </div>

                                <!-- Email Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="email" type="email" required class="form-control" 
                                                   placeholder="Your Email Address" value="${param.email}"
                                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        </div>
                                        <div class="error-message" id="emailError"></div>
                                    </div>
                                </div>

                                <!-- Date of Birth Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="age" type="date" required class="form-control" 
                                                   placeholder="Date Of Birth" value="${param.age}" max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date(System.currentTimeMillis() - 13L * 365 * 24 * 60 * 60 * 1000)) %>">
                                            
                                        </div>
                                        <div class="error-message" id="ageError"></div>
                                    </div>
                                </div>

                                <!-- Address Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="address" type="text" required class="form-control" 
                                                   placeholder="Your Address" value="${param.address}"
                                                   minlength="5" maxlength="100">
                                        </div>
                                        <div class="error-message" id="addressError"></div>
                                    </div>
                                </div>

                                <!-- Username Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="username" type="text" required class="form-control" 
                                                   placeholder="Your Username" value="${param.username}"
                                                   pattern="^[a-zA-Z0-9]{5,20}$"
                                                   title="Username should be 5-20 characters long and contain only letters and numbers">
                                        </div>
                                        <div class="error-message" id="usernameError"></div>
                                    </div>
                                </div>

                                <!-- Password Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group"> 
                                            <input name="password" type="password" class="form-control" 
                                                   required placeholder="Your Password" id="password"
                                                   pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                                                   title="Password must be at least 8 characters long and contain at least one letter and one number">
                                        </div>
                                        <div class="error-message" id="passwordError"></div>
                                    </div>
                                </div>

                                <!-- Confirm Password Field -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group"> 
                                            <input name="repassword" type="password" class="form-control" 
                                                   required placeholder="Re-Type Your Password" id="repassword">
                                        </div>
                                        <div class="error-message" id="repasswordError"></div>
                                    </div>
                                </div>

                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Sign Up</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>

        <!-- Validation Script -->
        <script>
            window.onload = function() {
                // Set max date for age (18 years ago)
                const today = new Date();
                const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
                const formattedMaxDate = maxDate.toISOString().split('T')[0];
                document.querySelector('input[name="age"]').max = formattedMaxDate;
                
                // Set min date (100 years ago)
                const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
                const formattedMinDate = minDate.toISOString().split('T')[0];
                document.querySelector('input[name="age"]').min = formattedMinDate;
                
                // Restore form values if any
                restoreFormValues();
            };

            function validateForm() {
                let isValid = true;
                const errorMessages = {
                    name: "",
                    phone: "",
                    email: "",
                    age: "",
                    address: "",
                    username: "",
                    password: "",
                    repassword: ""
                };

                // Name validation
                const nameInput = document.querySelector('input[name="name"]');
                if (!nameInput.value.match(/^[A-Za-z\s]{2,50}$/)) {
                    errorMessages.name = "Name should only contain letters and spaces (2-50 characters)";
                    isValid = false;
                }

                // Phone validation
                const phoneInput = document.querySelector('input[name="phone"]');
                if (!phoneInput.value.match(/^[0-9]{10}$/)) {
                    errorMessages.phone = "Phone number must be exactly 10 digits";
                    isValid = false;
                }

                // Email validation
                const emailInput = document.querySelector('input[name="email"]');
                if (!emailInput.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/)) {
                    errorMessages.email = "Please enter a valid email address";
                    isValid = false;
                }

                // Age validation
                const ageInput = document.querySelector('input[name="age"]');
                const selectedDate = new Date(ageInput.value);
                const maxDate = new Date(document.querySelector('input[name="age"]').max);
                const minDate = new Date(document.querySelector('input[name="age"]').min);
                
                if (selectedDate > maxDate) {
                    errorMessages.age = "You must be at least 18 years old";
                    isValid = false;
                } else if (selectedDate < minDate) {
                    errorMessages.age = "Please enter a valid date of birth";
                    isValid = false;
                }

                // Address validation
                const addressInput = document.querySelector('input[name="address"]');
                if (addressInput.value.length < 5 || addressInput.value.length > 100) {
                    errorMessages.address = "Address must be between 5 and 100 characters";
                    isValid = false;
                }

                // Username validation
                const usernameInput = document.querySelector('input[name="username"]');
                if (!usernameInput.value.match(/^[a-zA-Z0-9]{5,20}$/)) {
                    errorMessages.username = "Username must be 5-20 characters and contain only letters and numbers";
                    isValid = false;
                }

                // Password validation
                const passwordInput = document.querySelector('input[name="password"]');
                const repasswordInput = document.querySelector('input[name="repassword"]');
                
                if (!passwordInput.value.match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/)) {
                    errorMessages.password = "Password must be at least 8 characters with at least one letter and one number";
                    isValid = false;
                }

                // Password confirmation validation
                if (passwordInput.value !== repasswordInput.value) {
                    errorMessages.repassword = "Passwords do not match";
                    isValid = false;
                }

                // Display error messages
                Object.keys(errorMessages).forEach(field => {
                    const errorDiv = document.getElementById(field + 'Error');
                    const input = document.querySelector(`input[name="${field}"]`);
                    
                    if (errorMessages[field]) {
                        errorDiv.textContent = errorMessages[field];
                        errorDiv.style.display = 'block';
                        input.classList.add('input-error');
                    } else {
                        errorDiv.style.display = 'none';
                        input.classList.remove('input-error');
                    }
                });

                if (!isValid) {
                    // Save valid form values
                    saveFormValues();
                }

                return isValid;
            }

            function saveFormValues() {
                const formData = {
                    name: document.querySelector('input[name="name"]').value,
                    phone: document.querySelector('input[name="phone"]').value,
                    email: document.querySelector('input[name="email"]').value,
                    age: document.querySelector('input[name="age"]').value,
                    address: document.querySelector('input[name="address"]').value,
                    username: document.querySelector('input[name="username"]').value
                };
                
                sessionStorage.setItem('formData', JSON.stringify(formData));
            }

            function restoreFormValues() {
                const savedData = sessionStorage.getItem('formData');
                if (savedData) {
                    const formData = JSON.parse(savedData);
                    Object.keys(formData).


}

Object.keys(formData).forEach(field => {
                        const input = document.querySelector(`input[name="${field}"]`);
                        if (input && formData[field]) {
                            input.value = formData[field];
                        }
                    });
                    
                    // Clear saved data after restoring
                    sessionStorage.removeItem('formData');
                }
            }

            // Real-time validation for password matching
            document.getElementById('repassword').addEventListener('input', function() {
                const password = document.getElementById('password').value;
                const repassword = this.value;
                const errorDiv = document.getElementById('repasswordError');
                
                if (password !== repassword) {
                    errorDiv.textContent = "Passwords do not match";
                    errorDiv.style.display = 'block';
                    this.classList.add('input-error');
                } else {
                    errorDiv.style.display = 'none';
                    this.classList.remove('input-error');
                }
            });

            // Real-time validation for all fields
            const inputs = document.querySelectorAll('input[required]');
            inputs.forEach(input => {
                input.addEventListener('input', function() {
                    const errorDiv = document.getElementById(this.name + 'Error');
                    if (this.validity.valid) {
                        errorDiv.style.display = 'none';
                        this.classList.remove('input-error');
                    } else {
                        let errorMessage = '';
                        switch (this.name) {
                            case 'name':
                                errorMessage = "Name should only contain letters and spaces (2-50 characters)";
                                break;
                            case 'phone':
                                errorMessage = "Phone number must be exactly 10 digits";
                                break;
                            case 'email':
                                errorMessage = "Please enter a valid email address";
                                break;
                            case 'address':
                                errorMessage = "Address must be between 5 and 100 characters";
                                break;
                            case 'username':
                                errorMessage = "Username must be 5-20 characters and contain only letters and numbers";
                                break;
                            case 'password':
                                errorMessage = "Password must be at least 8 characters with at least one letter and one number";
                                break;
                        }
                        errorDiv.textContent = errorMessage;
                        errorDiv.style.display = 'block';
                        this.classList.add('input-error');
                    }
                });
            });

            // Prevent form submission on Enter key
            document.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    return false;
                }
            });

            // Clear error messages when clicking outside input fields
            document.addEventListener('click', function(e) {
                if (!e.target.matches('input')) {
                    const errorMessages = document.querySelectorAll('.error-message');
                    errorMessages.forEach(msg => {
                        msg.style.display = 'none';
                    });
                    const inputs = document.querySelectorAll('input');
                    inputs.forEach(input => {
                        input.classList.remove('input-error');
                    });
                }
            });

            // Show password functionality
            function addPasswordToggle() {
                const passwordFields = document.querySelectorAll('input[type="password"]');
                passwordFields.forEach(field => {
                    const container = field.parentElement;
                    const toggleBtn = document.createElement('button');
                    toggleBtn.type = 'button';
                    toggleBtn.className = 'password-toggle';
                    toggleBtn.innerHTML = '👁️';
                    toggleBtn.style.position = 'absolute';
                    toggleBtn.style.right = '10px';
                    toggleBtn.style.top = '50%';
                    toggleBtn.style.transform = 'translateY(-50%)';
                    toggleBtn.style.border = 'none';
                    toggleBtn.style.background = 'none';
                    toggleBtn.style.cursor = 'pointer';
                    
                    container.style.position = 'relative';
                    container.appendChild(toggleBtn);
                    
                    toggleBtn.addEventListener('click', function(e) {
                        e.preventDefault();
                        if (field.type === 'password') {
                            field.type = 'text';
                            this.innerHTML = '🔒';
                        } else {
                            field.type = 'password';
                            this.innerHTML = '👁️';
                        }
                    });
                });
            }

            // Initialize password toggle
            addPasswordToggle();
        </script>
    </body>
</html>