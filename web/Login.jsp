<%-- 
    Document   : Login
    Created on : Jul 22, 2024, 9:53:10 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./Css/Login.css" />
    </head>
    <body>
        <div class="login-3">
            <div class="seekingjobwebsite">SeekingJobWebsite</div>
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
            <div class="login-3-inner">
                <div class="group-container">
                    <div class="sign-in-parent">
                        <div class="sign-in">Sign in</div>
                        <div class="if-you-dont-have-an-account-r-parent">
                            <div class="if-you-dont">If you don’t have an account register</div>
                            <div class="you-can-register-container">
                                <span class="you-can">You can </span>
                                <a class="register-here" href="Register.jsp">Register here !</a>
                            </div>
                        </div>
                    </div>
                    <form class="form-container" action="LoginController" method="POST">
                        <div class="group-div">
                            <div class="component-parent">
                                <div class="email-parent">
                                    <div class="email">Email</div>
                                    <input class="enter-your-email" type="email" name="email" placeholder="Enter your email address"/>
                                    <div class="component-child">
                                    </div>
                                    <img class="message-1-icon" alt="" src="img/message 1.svg">
                                </div>
                                <div class="password-parent">
                                    <div class="password">Password</div>
                                    <div class="group-item">
                                    </div>
                                    <div class="enter-your-password-parent">
                                        <input class="enter-your-password" type="password" name="password" id="password" placeholder="Enter your Password"/>

                                        <img class="padlock-1-icon" alt="" src="img/padlock 1.svg">
                                    </div>
                                    <img class="invisible-1-icon" src="img/invisible 1.svg" id="showPassword" onclick="togglePasswordVisibility()" />
                                    <img class="invisible-1-icon" src="img/visibility.png" id="togglePassword" style="display: none;" onclick="togglePasswordVisibility()" />

                                </div>
                                
                            </div>
                            <div class="forgot-password-wrapper">
                                <a href="/ForgotController" class="forgot-password">Forgot Password ?</a>
                            </div>
                            <button class="rectangle-group" name="signIn" type="submit">
                                <div class="group-inner">
                                </div>
                                <div class="login">Login</div>
                            </button>
                           
                        </div>
                    </form>
                    
                </div>
                 <div style="color: red; margin-top:  -30px"><strong>${checkLogin}</strong></div>
            </div>
        </div>

    </body>
    <script>function togglePasswordVisibility() {
            var passwordField = document.getElementById("password");
            var showPasswordIcon = document.getElementById("showPassword");
            var togglePasswordIcon = document.getElementById("togglePassword");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                showPasswordIcon.style.display = "none";
                togglePasswordIcon.style.display = "block";
            } else {
                passwordField.type = "password";
                showPasswordIcon.style.display = "block";
                togglePasswordIcon.style.display = "none";
            }
        }

    </script>
</html>