<%-- 
    Document   : editProfile
    Created on : Jun 14, 2024, 11:29:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">       
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: column;
                background: url('images/update.png') no-repeat center center fixed;
                background-size: cover;
                color: blue;
            }
            header, footer {
                background-color: #333;
                color: #fff;            
                text-align: center;
            }
            .container {
                flex: 1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 600px;
                max-width: 100%;
                margin: 60px auto;
               
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px; /* Added margin to ensure space between heading and form */
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .form-row {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }
            .form-group {
                display: flex;
                flex-direction: column;
                width: 48%;
            }
            label {
                font-weight: bold;
                margin-bottom: 5px;
            }
            input, select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 100%;
            }
            button {
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="./Header/HeaderEmployee.jsp" %>
        </header>

        <div class="container">
            <h1>Edit Profile</h1>
            <form action="employeeProfile?submit=edit&id=${x.idEmployee}" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" value="${x.lastName}" required />
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" value="${x.firstName}" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="${x.email}" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" value="${x.password}" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" value="${x.phone}" required />
                    </div>
                    <div class="form-group">
                        <label for="dob">Day of Birth:</label>
                        <input type="date" id="dob" name="dob" value="${x.dob}" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="address">Location</label>
                        <select name="address" id="location" class="form-select">
                            <option value="">Select Location</option>
                            <option value="An Giang">An Giang</option>
                            <option value="Bến Tre">Bến Tre</option>
                            <option value="Cần Thơ">Cần Thơ</option>
                            <option value="Đồng Tháp">Đồng Tháp</option>
                            <option value="Hậu Giang">Hậu Giang</option>
                            <option value="Kiên Giang">Kiên Giang</option>
                            <option value="Long An">Long An</option>
                            <option value="Sóc Trăng">Sóc Trăng</option>
                            <option value="Tiền Giang">Tiền Giang</option>
                            <option value="Trà Vinh">Trà Vinh</option>
                            <option value="Vĩnh Long">Vĩnh Long</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="major">Major:</label>
                        <input type="text" id="major" name="major" value="${x.major}" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="Male" ${x.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${x.gender == 'Female' ? 'selected' : ''}>Female</option>
                            <option value="Other" ${x.gender == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="academic">Academic:</label>
                        <input type="text" id="academic" name="academic" value="${x.academic}" required />
                    </div>
                </div>

                    <button type="submit" >Save</button>
            </form>
        </div>

        <footer>
            <%@include file="./Header/Footer.jsp" %>
        </footer>
    </body>
</html>
