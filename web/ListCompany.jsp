<%-- 
    Document   : List
    Created on : Jun 11, 2024, 6:29:35 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="LinkForEmployee/Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Profile</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
             
            }
            .header {
                background-color: #007bff;
                color: #fff;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

                top: 0;
                z-index: 10;
            }
            .header h1 {
                margin: 0;
                font-size: 2em;
                font-weight: 700;
            }

            .card {
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            }
            .card img {
                border-radius: 12px;
            }
            .card-title {
                font-size: 1.5em;
                color: #333;
                font-weight: 700;
            }
            .card-text {
                color: #555;
                line-height: 1.6;
            }
            .card-text strong {
                color: #333;
                font-weight: 600;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row" style="    display: -ms-flexbox;
                 display: flex;
                 -ms-flex-wrap: wrap;
                 flex-wrap: wrap;
                 margin-right: -13px;
                 margin-left: 50px;   max-width: 70%;
               margin: 0 auto; ">
                <c:forEach items="${listc}" var="a">


                    <div class="col-md-4 mb-4">
                        <a href="CompanyController?action=accountEmploy&CompanyId=${a.idCompany}" style=" border: none;">
                            <div class="card">
                                <img src="${a.logo}" class="card-img-top" alt="${a.nameCompany} Logo">
                                <div class="card-body">
                                    <h5 class="card-title">${a.nameCompany}</h5>
                                    <p class="card-text"><strong>CEO:</strong> ${a.nameCEO}</p>
                                    <p class="card-text"><strong>VAT:</strong> ${a.vat}</p>
                                    <p class="card-text"><strong>Location:</strong> ${a.location}</p>
                                    <p class="card-text"><strong>Address:</strong> ${a.address}</p>
                                    <p class="card-text"><strong>Phone:</strong> ${a.phone}</p>
                                    <p class="card-text">${a.description}</p>
                                </div>
                            </div>
                        </a>
                    </div>

                </c:forEach>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
