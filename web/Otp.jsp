<%-- 
    Document   : Otp
    Created on : Jul 23, 2024, 2:42:39 AM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP</title>
        <link rel="stylesheet" href="./Css/Otp.css" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="login-12">
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
            <div class="login-12-inner">
                <div class="group-container">
                    <div class="forgot-password-wrapper">
                        <div class="forgot-password1">Forgot Password</div>
                    </div>
                    <div class="group-div">
                        <form action="ForgotController" method="post" onclick="validatePassword()">
                            <div class="frame-wrapper">
                                <div class="otp-parent">
                                    <div class="otp">OTP</div>
                                    <input class="enter-your-email" type="text"  id="otp" name="otp" placeholder="Enter OTP from your email"/>
                                    <div class="frame-child">
                                    </div>
                                    <img class="message-1-icon" alt="" src="img/message 1.svg">
                                </div>
                            </div>
                            <div class="password-parent">
                                <div class="password">Password</div>
                                <div class="group-inner">
                                </div>
                                <div class="enter-your-password-parent">
                                    <input class="confrim-your-password" type="password" name="password" id="password" placeholder="Enter your Password"/>
                                    <img class="padlock-1-icon1" alt="" src="img/padlock 1.svg">
                                </div>
                                <img class="invisible-1-icon" alt="" src="img/invisible 1.svg">
                            </div>
                            <div class="confrim-password-parent">
                                <div class="confrim-password">Confrim Password</div>
                                <div class="group-inner">
                                </div>
                                <div class="confrim-your-password-parent">
                                    <input class="confrim-your-password" type="password" name="cfpassword" id="cfpassword" placeholder="Confrim your password"/>
                                    <img class="padlock-1-icon" alt="" src="img/padlock 1.svg">
                                </div>
                                <img class="invisible-1-icon" alt="" src="img/invisible 1.svg">
                            </div>
                            <% 
    String emailForgot1 = (String) session.getAttribute("email-forgot1");
    if (emailForgot1 != null) { 
                            %>
                            <div class="alert alert-danger" style="margin-top: 89%;">
                                <%= emailForgot1 %>
                            </div>
                            <%
                                    // Clear the error message after displaying it
                                    session.removeAttribute("email-forgot1");
                                }
                            %>
                            <button  type="submit" name="btn-ChangeForgot" class="rectangle-group" style="position: absolute;">
                                <div class="login">Change Password</div>
                            </button>
                        </form>
  <div id="error-message" style="color: red;    margin-top: 64%;
    margin-left: 69%"></div>
                        <form action="ForgotController" method="post">
                            <button type="submit" name="btn-sendAgain" class="forgot-password-parent1">
                                <div class="forgot-password" >Send mail again</div>
                            </button>
                        </form>

                    </div>

                </div>
            </div>
        </div>
                            
    </body>
    <script>
        function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("cfpassword").value;
    var errorMessage = document.getElementById("error-message");

    if (password !== confirmPassword) {
        errorMessage.textContent = "Passwords do not match!";
        return false;
    } else {
        errorMessage.textContent = "";
        // Proceed with form submission or further processing
        // Here you can submit the form if passwords match
        // Example: document.getElementById("yourFormId").submit();
        return true;
    }
}
    </script>
</html>
