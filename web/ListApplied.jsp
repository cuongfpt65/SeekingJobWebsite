<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Post" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Job Search</title>
        <style>
            .post-item {
                display: block;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-decoration: none;
                color: #333;
                transition: background-color 0.3s ease;
            }
            .post-item:hover {
                background-color: #f9f9f9;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                background-color: white;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 50%;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                position: relative;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: stretch;
                width: 100%;
            }
            .form-container > div {
                margin-bottom: 20px;
            }
            .slider-container {
                margin-top: 10px;
            }
            .relative-position {
                position: relative;
            }
            #majorButton, #locationButton, #jobTypeButton {
                width: 100%;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                text-align: left;
            }
            .options-container {
                display: none;
                position: absolute;
                background-color: white;
                border: 1px solid #ccc;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                width: 100%;
                max-height: 200px;
                overflow-y: auto;
            }
            .hidden-options {
                display: none;
            }

            .container {
                width: 80%;
                margin: 0 auto;
            }

            .navbar {
                background-color: #333;
                overflow: hidden;
            }

            .navbar a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }



            .post {
                background-color: white;
                margin: 20px 0;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .post h2 {
                margin-top: 0;
            }
            .search{
                display: flex;

            }


        </style>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@500;800&display=swap" />
    </head>
    <body>

        <div class="container">           

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-md-8">
                    <div class="search">
                        <h1>List of Apply</h1>
                        <div class="col" style="margin-top: 10px; width: 50px">

                            <input type="text" oninput="SearchByAjax(this)" class="form-control" id="searchInput" placeholder="Search jobs...">

                        </div>
                    </div>


                    <table style="width: 100%; border-collapse: collapse; background-color: white;">
                        <thead>
                            <tr style="background-color: #007BFF; color: white;">
                                <th style="padding: 10px; position: relative;">
                                    Title

                                </th>
                                <th style="padding: 10px;">Name Employee</th>
                                <th style="padding: 10px;">File CV</th>
                                <th style="padding: 10px;">Status
                                    <div style="display: inline-block; margin-left: 10px;">
                                        <select class="form-control form-control-sm d-inline-block" onchange="filterByAjaxStatus(this)" style="width: auto;">
                                            <option value="">All</option>
                                            <option value="Reject">Reject</option>
                                            <option value="Accept">Accept</option>
                                            <option value="Waiting">Waiting</option>                                       
                                        </select>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="content" id="content">                    
                            <c:forEach items="${listApply}" var="a" varStatus="sta">
                                <tr>
                                    <td style="padding: 10px; border: 1px solid #ddd;"> ${a.tilte}</td>
                                    <td style="padding: 10px; border: 1px solid #ddd;"><a href="employeeProfile?action=Company&idEmployee=${list[sta.index].empoyeeId}">${a.nameEmployee}</a></td>
                                    <td style="padding: 10px; border: 1px solid #ddd;"> <a href="${a.cv}" download> Click to download CV</a></td>
                                    <td style="padding: 10px; border: 1px solid #ddd;">
                                        <form action="ApplyController" method="post">
                                            <input type="hidden" name="ApplyId" value="${a.applyId}" />
                                            <c:if test="${a.status eq 'Reject'}">
                                                ${a.status} 
                                            </c:if>

                                            <c:if test="${a.status eq 'Accept'}">
                                                ${a.status} 
                                            </c:if>
                                            <c:if test="${a.status eq 'Waiting'}">
                                                <button type="submit" name="status" value="accept" style="background-color: #28a745; color: white; border: none; padding: 5px 10px; cursor: pointer;" onclick="handleButtonClick(${a.status})">Accept</button>
                                                <button type="submit" name="status" value="reject" style="background-color: #dc3545; color: white; border: none; padding: 5px 10px; cursor: pointer;" onclick="handleButtonClick(${a.status})">Reject</button>
                                            </c:if>

                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-2"></div>



            </div>
        </div>
        <script>
            function SearchByAjax(p) {

                var txtSearch = p.value;

                $.ajax({

                    url: "./SearchAjax",
                    type: "get",
                    data: {
                        apply: txtSearch


                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                    }

                }
                );

            }
            
             function filterByAjaxStatus(p) {

                var txtSearch = p.value;

                $.ajax({

                    url: "./SearchAjax",
                    type: "get",
                    data: {
                        status: txtSearch


                    },
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                    }

                }
                );

            }

        </script>

    </body>

</html>
