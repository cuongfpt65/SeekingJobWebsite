<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Post" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/HeaderEmployee.jsp" %>

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
            .search-form input[type="text"] {
                width: 300px; /* Adjust this value as needed */
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
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

            .search-bar {
                margin: 20px 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .search-bar input[type="text"] {
                width: 80%;
                padding: 10px;
                margin-right: -4px;
            }

            .search-bar button {
                padding: 11px;
                background-color: #333;
                color: white;
                border: none;
            }

            .search-bar button img {
                width: 20px;
                height: 20px;
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
            .listApp{
                margin-top: 5%;
            }

        </style>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    </head>
    <body>

        <div class="container">               
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-md-7 " >
                    <h1 style="margin: 0 auto; text-align: center" class="listApp">List of Apply</h1>
                    <table style="width: 80%; border-collapse: collapse; background-color: white;margin: 0 auto; margin-left: 11%; margin-top: 5%">
                        <thead>
                            <tr style="background-color: #007BFF; color: white;">
                                <th style="padding: 10px;">Tilte Post Applied                               
                                </th>
                                <th style="padding: 10px;">Name Company
                                    <div style="display: inline-block; margin-left: 10px;">
                                      
                                        <select class="form-control form-control-sm d-inline-block" onchange="filterByAjaxStatusCompany(this)" style="width: auto;">
                                            <option value="">All</option>
                                            <c:forEach items="${name}" var="n">
                                            <option value="${n}">${n}</option>
                                            </c:forEach>                                   
                                        </select>
                                    </div>
                                </th>
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
                                <th style="padding: 10px;">Action</th>
                            </tr>
                        </thead>
                        <tbody class="listapp" id="listapp">

                            <c:forEach items="${listApply}" var="a">
                                <tr>
                                    <td style="padding: 10px; border: 1px solid #ddd;"> ${a.tilte}</td>
                                    <td style="padding: 10px; border: 1px solid #ddd;">${a.nameEmployee}</td>
                                    <td style="padding: 10px; border: 1px solid #ddd;"> <a href="${a.cv}" download> Click to download CV</a></td>
                                    <td style="padding: 10px; border: 1px solid #ddd;">${a.status}</td>
                                    <td style="padding: 10px; border: 1px solid #ddd; justify-content: center; text-align: center">
                                        <c:if test="${a.status eq 'Waiting'}">
                                            <form action="ApplyController" method="post">
                                                <input type="hidden" name="ApplyId" value="${a.applyId}" />
                                                <button type="submit" name="status" value="delete" style="background-color: red; color: white; border: none; padding: 5px 10px; cursor: pointer;">Delete</button>                                           
                                            </form>  
                                        </c:if>                               
                                    </td>
                                </tr>
                            
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
                <div class="col-ms-2"></div>
            </div>


        </div>

        <%@include file="./Header/Footer.jsp" %>
    </body>

    <script>
        
        function filterByAjaxStatus(p) {
         
            var txtSearch = p.value;
            $.ajax({

                url: "./SearchAjax",
                type: "get",
                data: {
                    statusEmployee: txtSearch


                },
                success: function (data) {
                    var row = document.getElementById("listapp");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                }

            }
            );

        }
          function filterByAjaxStatusCompany(p) {
         
            var txtSearch = p.value;
            $.ajax({

                url: "./SearchAjax",
                type: "get",
                data: {
                    nameCompany: txtSearch


                },
                success: function (data) {
                    var row = document.getElementById("listapp");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                }

            }
            );

        }
    </script>
</html>
