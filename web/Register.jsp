<%-- 
    Document   : Register
    Created on : Jul 23, 2024, 12:09:46 AM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

        <link rel="stylesheet" href="./Css/Register_1.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" />
        <style>

            .container {
                    left: 30px;
    top: 60px;
            max-width: 500px;

                margin: 0 auto;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: white;
            }

            .input-field {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .input-field2 {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .button img {
                margin-left: 10px;
            }

            .select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            #errorMessage, #phoneErrorMessage, #emailErrorMessage, #emailExistsMessage {
                color: red;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="login-3-register">
            <div class="col-sm-3">

                <div class="rectangle-parent">
                    <div class="group-child">
                    </div>
                    <div class="group-parent">
                        <div class="find-your-dream-job-parent">
                            <div class="find-your-dream">Find your dream job</div>
                            <div class="start-a-successful">start a successful career.</div>
                        </div>
                        <img class="saly-10-icon" alt="" src="img/Saly-10.png">
                    </div>
                </div>
            </div>
            <div class="col-sm-8" style="display: inline-block;">
                <div class="container">
                    <div class="heading">
                        <div class="log-in">
                            <div class="already-have-account">Already have an account?</div>
                            <a href="/LoginController" class="log-in1">Log In</a>
                        </div>
                    </div>
                    <form id="registerForm" action="RegisterController" method="POST">
                        <select id="userTypeSelect" name="type" class="select">
                            <option value="company" selected>Company</option>
                            <option value="employee">Employee</option>
                        </select>
                        <div class="frame-group">
                            <div class="input-field-parent" id="companyFields" style="display: block">
                                <input class="input-field" name="nameCompany" placeholder="Company Name">
                                <input class="input-field" name="ceo" placeholder="CEO Name">
                                <input class="input-field2" name="address" placeholder="Address">
                                <input class="input-field2" id="email" name="email" type="email" placeholder="Email">
                                <div id="emailErrorMessage">Email must be a valid Gmail address.</div>
                                <div id="emailExistsMessage">Email already exists.</div>
                                <input class="input-field2" name="location" placeholder="Location">
                                <input class="input-field2" name="vat" placeholder="VAT">
                                <input class="input-field2" id="phone" name="phone" placeholder="Phone">
                                <div id="phoneErrorMessage">Phone number must be 10 digits.</div>
                                <input id="password" class="input-field2" name="password" placeholder="Password" type="password">
                                <input id="confirmPassword" class="input-field2" name="cfPass" placeholder="Confirm Password" type="password">
                                <div id="errorMessage">Passwords do not match.</div>
                            </div>
                            <div class="input-field-parent" id="employeeFields" style="display: none;">
                                <input class="input-field" name="lastName" placeholder="Last Name">
                                <input class="input-field" name="firstName" placeholder="First Name">
                                <input class="input-field2" name="emailEmployee" placeholder="Email">
                                <input class="input-field2" name="passwordEmployee" placeholder="Password" type="password">
                                <input class="input-field2" id="phoneEmployee" name="phoneEmployee" placeholder="Phone">
                                <input class="input-field2" type="date" name="dob" placeholder="Date of Birth">
                                <input class="input-field2" name="addressEmployee" placeholder="Address">
                                <input class="input-field2" name="major" placeholder="Major">
                                <select class="input-field2" name="gender">
                                    <option value="" disabled selected>Select Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                                <input class="input-field2" name="academic" placeholder="Academic">
                            </div>
                        </div>
                        <button type="submit" name="action" value="register" class="button">Create account
                            <img class="fiarrow-right-icon" alt="" src="fi:arrow-right.svg">
                        </button>
                    </form>
                </div>
            </div>


            <script>
                document.getElementById('userTypeSelect').addEventListener('change', function () {
                    var companyFields = document.getElementById('companyFields');
                    var employeeFields = document.getElementById('employeeFields');
                    if (this.value === 'company') {
                        companyFields.style.display = 'block';
                        employeeFields.style.display = 'none';
                    } else {
                        companyFields.style.display = 'none';
                        employeeFields.style.display = 'block';
                    }
                });

                document.getElementById('registerForm').addEventListener('submit', function (event) {
                    var type = ocument.getElementById('userTypeSelect').value;
                    if (type === 'company') {
                        var password = document.getElementById('password').value;
                        var confirmPassword = document.getElementById('confirmPassword').value;
                        var errorMessage = document.getElementById('errorMessage');
                        var phone = document.getElementById('phone').value;
                        var phoneErrorMessage = document.getElementById('phoneErrorMessage');
                        var email = document.getElementById('email').value;
                        var emailErrorMessage = document.getElementById('emailErrorMessage');
                        var emailExistsMessage = document.getElementById('emailExistsMessage');
                        var phonePattern = /^(032|033|034|035|036|037|038|039|096|097|098|086|083|084|085|081|082|088|091|094|070|079|077|076|078|090|093|089|056|058|092|059|099)[0-9]{7}$/;
                        var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

                        if (password !== confirmPassword) {
                            event.preventDefault();
                            errorMessage.style.display = 'block';
                        } else {
                            errorMessage.style.display = 'none';
                        }

                        if (!phonePattern.test(phone)) {
                            event.preventDefault();
                            phoneErrorMessage.style.display = 'block';
                        } else {
                            phoneErrorMessage.style.display = 'none';
                        }

                        if (!emailPattern.test(email)) {
                            event.preventDefault();
                            emailErrorMessage.style.display = 'block';
                        } else {
                            emailErrorMessage.style.display = 'none';
                        }

                        // Check email existence
                        if (!emailExistsMessage.style.display === 'block') {
                            event.preventDefault();
                        }
                    }

                });


            </script>
    </body>
</html>