<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh Sách Công Ty</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <style>

           
            .company-list {
                max-width: 100%;
                width: 450px;
                border-right: 1px solid #ddd;
                padding: 10px;
            }
            .company-detail {
                max-width: 50%;
                width: 400px;
                padding: 10px;
            }
            .company-item {
                cursor: pointer;
                padding: 5px;
                border-bottom: 1px solid #ddd;
            }
            .company-item:hover {
                background-color: #f0f0f0;
            }
            .cardprofile {
                border: 1px solid #ddd;
                border-radius: 8px;
                overflow: hidden;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 100%;


            }

            .user-persona-template {
                padding: 16px;
            }

            .frame-parent {
                display: flex;
                flex-direction: column;
            }

            .profile-header {
                display: flex;

                border-bottom: 1px solid #ddd;
                padding-bottom: 16px;
                margin-bottom: 16px;
            }

            .profile-icon {
                border-radius: 50%;
                width: 80px;
                height: 80px;
                margin-right: 16px;
                object-fit: cover; /* Ensure the image covers the space */
            }

            .name-company-parent {
                flex: 1;
            }

            .name-company {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 8px;
            }

            .info-group {
                display: flex;
                flex-direction: column;
            }

            .info-item {
                margin-bottom: 8px;
            }

            .info-label {
                font-weight: bold;
            }

            .description-section {
                padding-top: 16px;
            }

            .description-title {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 8px;
            }

            .description-content {
                display: flex;
                flex-direction: column;
            }

            .description-text {
                margin-bottom: 16px;
            }

            .lock-button {
                align-self: flex-start;
                padding: 8px 16px;
                border: none;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                cursor: pointer;
            }

            .lock-button:hover {
                background-color: #0056b3;
            }
            /* Định nghĩa màu sắc */
            .custom-container {
                background-color: #f0f8ff; /* Màu trắng xanh nhạt */
                color: #333;
                font-family: Arial, sans-serif;
                padding: 20px;
            }

            .custom-company-item {
                display: ruby-base-container;
                background-color: #ffffff; /* Màu trắng */
                border: 1px solid #e0e0e0;
                padding: 15px;
                margin-bottom: 10px;
                border-radius: 5px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .custom-company-item:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .custom-button {
                background-color: #007bff; /* Màu xanh */
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 5px 0;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100px;

            }

            .custom-button:hover {
                background-color: #0056b3;
            }

            .custom-link {
                color: white;
                text-decoration: none;
            }

            /* Định nghĩa màu sắc và bố cục */
            .detail-container {
                position: absolute;
                top: 20%;
                left: 70%;
                width: 25%;
                background-color: #ffe4e1; /* Màu hồng nhạt */
                color: #333;
                font-family: Arial, sans-serif;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden; /* Đảm bảo không bị tràn ra ngoài */
            }

            .detail-container p {
                margin: 0;
                padding: 10px 0;
                font-size: 14px;
            }


        </style>
        <script>
            function showCompanyDetails(companyId) {
              console.log('Fetching details for company ID:', companyId);

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log('Received response for company ID:', companyId);
                    document.getElementById("company-detail").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "getCompanyDetails?companyId=" + companyId, true);
            xhttp.send();
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row" >
                <div class="col-sm-2"></div>
                <div class="col-md-8" style="margin-left: 25%; margin-top: 10%; display: inline-flex">
                    <div class="company-list">
                        <div class="custom-container">
                            <h2>List Companies in System</h2>
                            <c:forEach var="company" items="${companyList}" varStatus="status">
                                <div class="custom-company-item" onclick="showCompanyDetails('${company.idCompany}')">
                                    <c:out value="${company.nameCompany}" />

                                    <c:if test="${listStatus[status.index].status == 1}">
                                        <button class="custom-button" style="background-color: red">
                                            <a class="custom-link" href="AdminController?action=lock&id=${company.idCompany}">Lock</a>
                                        </button>
                                    </c:if>
                                    <c:if test="${listStatus[status.index].status != 1}">
                                        <button class="custom-button">
                                            <a class="custom-link" href="AdminController?action=unlock&id=${company.idCompany}">Unlock</a>
                                        </button>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                    <div class="company-detail" id="company-detail">
                        <!-- Thông tin công ty sẽ hiển thị ở đây -->
                        <p>Vui lòng chọn một công ty để xem chi tiết.</p>
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
