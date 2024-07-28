<%-- 
    Document   : emailCode
    Created on : Jul 22, 2024, 11:56:06 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <link rel="stylesheet" href="./Css/reviceCode.css" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="login-11">
            <div class="seekingjobwebsite">SeekingJobWebsite</div>
            <div class="rectangle-parent">
                <div class="group-child" style=" margin-left: -17%;
                     position: absolute;
                     top: 0px;
                     left: 58px;
                     border-radius: 15px;
                     background-color: #000842;
                     width: 614px;
                     height: 859px;" >
                </div>
                <div class="group-parent" style=" position: absolute;
    top: 64px;
    left: -31px;
    width: 546px;
    height: 699px;">
                    <div class="find-your-dream-job-parent">
                        <div class="find-your-dream">Find your dream job</div>
                        <div class="start-a-successful">start a successful career.</div>
                    </div>
                    <img class="saly-10-icon" alt="" src="img/Saly-10.png">
                </div>
            </div>
            <form class="form-container" action="ForgotController" method="POST">
                <div class="login-11-inner">
                    <div class="group-container">
                        <div class="forgot-password-parent">
                            <div class="forgot-password">Forgot Password</div>
                            <div class="if-you-already-have-an-account-parent">
                                <div class="if-you-already">If you already have an account register</div>
                                <div class="you-can-login-container">
                                    <span class="you-can">You can </span>
                                    <a class="login-here" href="Login.jsp">Login here !</a>
                                </div>
                            </div>
                        </div>
                        <div class="group-div">
                            <div class="instance-wrapper">
                                <div class="instance-wrapper">
                                    <div class="email">Email</div>
                                    <input class="enter-your-email" type="email" name="email" id="password" placeholder="Enter your email address"/>
                                    <div class="instance-child">
                                    </div>
                                    <img class="message-1-icon" alt="" src="img/message 1.svg">
                                </div>
                            </div>
                            <% 
        String emailForgot1 = (String) session.getAttribute("email-wrong");
        if (emailForgot1 != null) { 
                            %>
                            <div class="alert alert-danger" style="    margin-top: 40%;">
                                <%= emailForgot1 %>
                            </div>
                            <%
                                    // Clear the error message after displaying it
                                    session.removeAttribute("email-wrong");
                                }
                            %>
                            <button type="submit" name="btn-forgot" class="rectangle-group">
                                <div class="group-item">
                                </div>
                                <div class="login">Send Code </div>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
