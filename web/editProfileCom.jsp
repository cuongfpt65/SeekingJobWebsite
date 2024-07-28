<%-- 
    Document   : editProfileCom
    Created on : Jul 25, 2024, 9:00:05 PM
    Author     : Trần Tấn Lợi-CE171879
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/HeaderCompany.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Company</title>
        <style>
            .account-information {
                position: relative;
                font-size: 20px;
                line-height: 32px;
                font-weight: 600;

            }
            .frame-child {
                width: 100px;
                position: relative;
                border-radius: 1000px;
                height: 100px;
                object-fit: cover;
            }
            .label {
                position: relative;
                line-height: 50px;
                text-transform: capitalize;
            }
            .buttons {
                border-radius: 4px;
                background-color: #e8f7ff;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 0px 20px;
            }
            .labela {
                position: relative;
                line-height: 50px;
                text-transform: capitalize;
                cursor: pointer;
                padding: 0 20px;
                color: #007bff;
                background-color: #e8f7ff;
                border: 2px solid #007bff;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
            }

            .labela:hover, .labela:focus {
                background-color: #007bff;
                color: #fff;
                border-color: #0056b3;
            }

            .buttons {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 10px;
            }


            .rectangle-parent {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 24px;
            }
            .email {
                position: relative;
                line-height: 24px;
                font-weight: 600;
            }
            .jennywilsongmailcom {
                position: relative;
                line-height: 24px;
                color: #464d61;
                text-align: center;
            }
            .email-parent {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 8px;
                text-align: left;
                color: #191f33;
                font-family: Nunito;
            }
            .avatar {
                width: 981px;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                text-align: center;
                color: #00aaff;
                font-family: 'Nunito Sans';
            }
            .name-company {
                align-self: stretch;
                position: relative;
                line-height: 20px;
                display: inline-block;
                height: 20px;
                flex-shrink: 0;
            }
            .full-name {
                width: 90%;
                border: none;
                outline: none;
                position: absolute;
                top: 12px;
                left: 18px;
                line-height: 24px;
            }
            .input-field {
                align-self: stretch;
                position: relative;
                border-radius: 5px;
                background-color: #fff;
                border: 1px solid #edeff5;
                box-sizing: border-box;
                height: 48px;
                font-size: 16px;
                color: #939aad;
            }
            .tag {
                width: 483px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 8px;
            }
            .phone {
                border: none;
                outline: none;
                position: absolute;
                top: 12px;
                left: 68px;
                line-height: 24px;
            }
            .flag-icon {
                width: 24px;
                position: relative;
                height: 24px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .caretdown-icon {
                width: 16px;
                position: relative;
                height: 16px;
            }
            .flag-parent {
                position: absolute;
                top: 12px;
                left: 12px;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 4px;
            }
            .tag-parent {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 18px;
            }
            .form {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 18px;
                font-size: 14px;
            }
            .address {
                align-self: stretch;
                position: relative;
                font-size: 14px;
                line-height: 20px;
                display: inline-block;
                height: 20px;
                flex-shrink: 0;
            }
            .input-field4 {
                align-self: stretch;
                position: relative;
                border-radius: 5px;
                background-color: #fff;
                border: 1px solid #edeff5;
                box-sizing: border-box;
                height: 48px;
                color: #939aad;
                width: 66%;
            }
            .tag4 {
                width: 483px;
                height: 76px;
            }
            .input-field5 {
                align-self: stretch;
                position: relative;
                border-radius: 5px;
                background-color: #fff;
                border: 1px solid #edeff5;
                box-sizing: border-box;
                height: 124px;
                font-size: 16px;
                color: #939aad;
                width: 66%;

            }
            .tag5 {
                width: 1485px;
                height: 98px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-end;
                gap: 8px;
                font-size: 14px;
            }
            .buttons1 {

                border: none;
                outline: none;
                width: 145px;
                border-radius: 4px;
                background-color: #00aaff;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: center;
                padding: 0px 20px;
                box-sizing: border-box;
                text-align: center;
                color: #fff;
                font-family: 'Nunito Sans';
            }
            .account-settings {
                height: 583px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: space-between;
                font-size: 16px;
                margin: 30px auto;
            }
            .settings-child {
                width: 985px;
                position: relative;
                border-top: 1px solid #ebeef7;
                box-sizing: border-box;
                height: 1px;
            }
            .password {
                border: none;
                outline: none;
                position: absolute;
                top: calc(50% - 12px);
                left: 18px;
                line-height: 24px;
            }
            .fieye-icon {
                position: absolute;
                top: calc(50% - 12px);
                right: 16px;
                width: 24px;
                height: 24px;
                overflow: hidden;
            }
            .tag6 {
                width: 316px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 8px;
            }
            .input-field6 {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 18px;
                font-size: 14px;
            }
            .buttons2 {
                border: none;
                outline: none;
                border-radius: 4px;
                background-color: #00aaff;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 0px 20px;
                text-align: center;
                font-size: 16px;
                color: #fff;
                font-family: 'Nunito Sans';
            }
            .change-password {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .delete-account {
                position: relative;
                line-height: 32px;
                font-weight: 600;
            }
            .lorem-ipsum-dolor {
                width: 648px;
                position: relative;
                font-size: 16px;
                line-height: 24px;
                color: #767e94;
                display: inline-block;
            }
            .delete-account-parent {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 12px;
            }
            .trash-icon {
                width: 24px;
                position: relative;
                height: 24px;
            }
            .buttons3 {
                border: none;
                outline: none;
                border-radius: 4px;
                background-color: #ffe5e5;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 0px 20px;
                gap: 8px;
                text-align: center;
                font-size: 16px;
                color: #ff4f4f;
                font-family: 'Nunito Sans';
                margin-bottom: 30px;
            }
            .settings {
                margin-left: 10%;
                position: relative;
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 32px;
                text-align: left;
                font-size: 20px;
                color: #191f33;
                font-family: Nunito;
            }


        </style>
    </head>
    <body>
        <div class="body">
            <div class="settings">
                <div class="account-settings">
                    <div class="account-information">Account Information</div>
                    <form  action="CompanyController?action=update" method="post" enctype="multipart/form-data" >
                        <div class="avatar">
                            <div class="rectangle-parent">
                                <img class="frame-child" alt="" src="imgs/room/${br.logo}">
                                <div class="buttons">
                                    <input name="logo" type="file" id="upload" accept="img/*" value="${br.logo}" style="display: none;">
                                    <label for="upload"  class="labela">Choose image</label>
                                </div>
                                <input type="hidden" name="currentImage" value="${fn:escapeXml(br.logo)}">
                            </div>

                            <div class="email-parent">
                                <div class="email">Email:</div>
                                <div class="jennywilsongmailcom">${br.email}</div>
                                <input style="display:none;" name="email" type="text" value="${br.email}">
                                <input style="display:none;" name="password" type="text" value="${br.password}">
                                <input style="display:none;" name="vat" type="text" value="${br.vat}">
                            </div>
                        </div>
                        <div class="form">
                            <div class="tag-parent">
                                <div class="tag">
                                    <div class="name-company">Name Company</div>
                                    <div class="input-field">
                                        <input class="full-name"name="nameCompany" placeholder="Company" value="${br.nameCompany}" type="text"/>
                                    </div>
                                </div>
                                <div class="tag">
                                    <div class="name-company">Phone Number</div>
                                    <div class="input-field">
                                        <input class="phone"  name="phone" value="${br.phone}" placeholder="Phone" type="text"/>
                                        <div class="flag-parent">
                                            <img class="flag-icon" alt="" src="img/phone.png">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tag-parent">
                                <div class="tag">
                                    <div class="name-company">Name CEO</div>
                                    <div class="input-field">
                                        <input class="full-name"name="nameCEO" placeholder="CEO" type="text" value="${br.nameCEO}">
                                    </div>
                                </div>
                                <div class="tag">
                                    <div class="name-company">Location</div>
                                    <div class="input-field">
                                        <input class="full-name" name="location" value="${br.location}" placeholder="Location" type="text">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="address">Address</div>
                        <div class="input-field4">
                            <input class="full-name" name="address" value="${br.address}" placeholder="Address" type="text"/>
                        </div>

                        <div class="tag5">
                            <div class="name-company">Biography</div>
                            <div class="input-field5">
                                <input class="full-name" name="description" value="${br.description}" placeholder="Description" type="text"/>
                            </div>
                        </div>
                        <button type="submit" class="buttons1">
                            <b class="label">Save Changes</b>
                        </button>
                    </form>
                </div>
                <form action="CompanyController?action=change" method="post" onsubmit="return validateForm()">
                    <div class="change-password">
                        <div class="delete-account">Change Password</div>
                        <div class="input-field6">
                            <div class="tag6">
                                <div class="name-company">Current Password</div>
                                <div class="input-field">
                                    <input class="password" id="currentPassword" name="password" placeholder="Password" type="password" />
                                    <img class="fieye-icon" src="img/invisible 1.svg" id="showCurrentPassword" onclick="togglePasswordVisibility('currentPassword', 'showCurrentPassword', 'toggleCurrentPassword')" />
                                    <img class="fieye-icon" src="img/visibility.png" id="toggleCurrentPassword" style="display: none;" onclick="togglePasswordVisibility('currentPassword', 'showCurrentPassword', 'toggleCurrentPassword')" />
                                </div>
                            </div>
                            <div class="tag6">
                                <div class="name-company">New Password</div>
                                <div class="input-field">
                                    <input class="password" id="newPassword" name="newpassword" placeholder="New Password" type="password" />
                                    <img class="fieye-icon" src="img/invisible 1.svg" id="showNewPassword" onclick="togglePasswordVisibility('newPassword', 'showNewPassword', 'toggleNewPassword')" />
                                    <img class="fieye-icon" src="img/visibility.png" id="toggleNewPassword" style="display: none;" onclick="togglePasswordVisibility('newPassword', 'showNewPassword', 'toggleNewPassword')" />
                                </div>
                            </div>
                            <div class="tag6">
                                <div class="name-company">Confirm Password</div>
                                <div class="input-field">
                                    <input class="password" id="confirmPassword" name="renewpassword" placeholder="Confirm Password" type="password" />
                                    <img class="fieye-icon" src="img/invisible 1.svg" id="showConfirmPassword" onclick="togglePasswordVisibility('confirmPassword', 'showConfirmPassword', 'toggleConfirmPassword')" />
                                    <img class="fieye-icon" src="img/visibility.png" id="toggleConfirmPassword" style="display: none;" onclick="togglePasswordVisibility('confirmPassword', 'showConfirmPassword', 'toggleConfirmPassword')" />
                                </div>
                            </div>
                        
                        </div>
                        <button type="submit" class="buttons2">
                            <b class="label">Save Changes</b>
                        </button>
                        <div style="color: red;"><strong>${checkPass}</strong></div>
                            <div id="error-message" style="color: red; display: none;">New Password and Confirm Password do not match.</div>
                    </div>
                </form>
            </div>
        </div>

    </body>
    <script>
        function validateForm() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMessage = document.getElementById('error-message');

            // Regular expression to check for letters, numbers, and special characters
            const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{3,}$/;

            if (newPassword !== confirmPassword) {
                errorMessage.textContent = "New Password and Confirm Password do not match.";
                errorMessage.style.display = 'block';
                return false;
            }

            if (!passwordPattern.test(newPassword)) {
                errorMessage.textContent = "Password must be at least 3 characters long and include letters, numbers, and special characters.";
                errorMessage.style.display = 'block';
                return false;
            }

            errorMessage.style.display = 'none';
            return true;
        }
        function togglePasswordVisibility(passwordFieldId, showIconId, hideIconId) {
            var passwordField = document.getElementById(passwordFieldId);
            var showIcon = document.getElementById(showIconId);
            var hideIcon = document.getElementById(hideIconId);

            if (passwordField.type === "password") {
                passwordField.type = "text";
                showIcon.style.display = "none";
                hideIcon.style.display = "block";
            } else {
                passwordField.type = "password";
                showIcon.style.display = "block";
                hideIcon.style.display = "none";
            }
        }
        function confirmDelete() {
            return confirm("Are you sure you want to delete your account? This action cannot be undone.");
        }
        document.getElementById('upload').addEventListener('change', function (event) {
            const [file] = event.target.files;
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.querySelector('.frame-child').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</html>
<%@include file="./Header/Footer.jsp" %>