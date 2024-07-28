<%@include file="./Header/HeaderEmployee.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Profile</title>
        <link rel="stylesheet" href="./Css/MenuAndFooter.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap">
        <style>
            body {
                margin: 0;
                font-family: 'DM Sans', sans-serif;
                background-color: #f5f5f5;
            }
            .profile-container {
                margin: 50px auto;
                width: 60%;
                background-color: #FFF;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                height: 700px;
            }
            .profile-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .profile-header h1 {
                font-size: 36px;
                color: black;
            }
            .profile-header p {
                font-size: 18px;
                color: black;
            }
            table {
                width: 100%;
                border-collapse: separate; /* Changed from collapse to separate */
                border-spacing: 0 10px; /* Added spacing between rows */
                margin: 20px 0;
            }
            table th, table td {
                padding: 16px;
                text-align: left;
                border-bottom: 2px solid #309689; /* Increased border width */
                border-right: 2px solid #ddd; /* Added right border for data cells */
            }
            table th {
                background-color: #3575e2;
                color: white;
                font-weight: 600;
                border-right: 2px solid #309689; /* Added right border for headers */
            }
            table td {
                background-color: #fff;
                color: #333;
            }
            table tr:last-child td {
                border-bottom: none; /* Remove bottom border for the last row */
            }
            table tr:nth-child(even) {
                background-color: #f9f9f9; /* Add alternating row colors */
            }
            table tr:hover {
                background-color: #f1f1f1; /* Highlight row on hover */
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
            .button-container .button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #3575e2;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.2s ease, transform 0.2s ease; /* Shortened transition duration */
                margin-top: 35px;
            }

            .button-container .button:hover {
                background-color: #285bb5;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Reduced box shadow */
                transform: translateY(-1px); /* Subtle transformation */
            }
        </style>
    </head>
    <body>
        <div class="profile-container">
            <div class="profile-header">
                <h1>User Profile</h1>
                <p>Manage your personal information and job preferences</p>
            </div>
            <div>
                <table>
                    <tr>
                        <th>Full Name</th>
                        <td>${see.lastName} ${see.firstName}</td>
                        <th>Email</th>
                        <td>${see.email}</td>
                    </tr>                  
                    <tr>
                        <th>Phone</th>
                        <td>${see.phone}</td>
                        <th>Day of Birth</th>
                        <td>${see.dob}</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>${see.address}</td>
                        <th>Major</th>
                        <td>${see.major}</td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td>${see.gender}</td>
                        <th>Academic</th>
                        <td>${see.academic}</td>
                    </tr>
                </table>
                <div class="button-container">
                    <a href="employeeProfile?action=edit" class="button">Update Profile</a>
                    <a href="cv-employee?action=upload" class="button">Upload Cv</a>
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="./Header/Footer.jsp" %>
