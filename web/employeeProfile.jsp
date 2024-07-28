<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="LinkforCompany/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

        <style>
            /* styles.css */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 80%;
                margin: 0 20%;
            }

            .table-container {
                margin-left: auto;
                margin-right: auto;
                margin-top: 20px;
                width: 100%;
            }

            .employee-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .employee-table th, .employee-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .employee-table th {
                background-color: #007bff;
                color: white;
            }

            .employee-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .employee-table tr:hover {
                background-color: #f9f9f9;
            }

            .edit-profile {
                display: inline-block;
                padding: 8px 12px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .edit-profile:hover {
                background-color: #0056b3;
            }

        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-md-8">

                    <table class="employee-table">
                        <thead>
                            <tr>

                                <th>Last Name</th>
                                <th>First Name</th>
                                <th>Email</th>

                                <th>Phone</th>

                                <th>Address</th>
                                <th>Major</th>
                                <th>Gender</th>
                                <th>Academic</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listE}" var="x">
                                <tr>

                                    <td>${x.lastName}</td>
                                    <td>${x.firstName}</td>
                                    <td>${x.email}</td>

                                    <td>${x.phone}</td>

                                    <td>${x.address}</td>
                                    <td>${x.major}</td>
                                    <td>${x.gender}</td>
                                    <td>${x.academic}</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-sm-2"></div>
            </div>


        </div>
    </body>

</html>
