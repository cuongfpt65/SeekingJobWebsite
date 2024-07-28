<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Company</title>

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=DM Sans:wght@400;500;700&display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Abel:wght@400&display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Lexend:wght@600&display=swap"
            />
        <style>
            .badge-icon {
                align-self: stretch;
                height: 28px;
            }
            .logo-icon {
                width: 40px;
                position: relative;
                height: 40px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .developer-expert {
                position: relative;
            }
            .armstrong-ohara-and {
                position: relative;
                font-size: 16px;
            }
            .text {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
            }
            .logo-text {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
            }
            .textbadge-icon {
                align-self: stretch;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .briefcase2-2-icon {
                width: 24px;
                position: relative;
                height: 24px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .icon-text {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 12px;
            }
            .g135-icon {
                width: 24px;
                position: relative;
                height: 24px;
                object-fit: cover;
            }
            .icons-text {
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: flex-start;
                gap: 24px;
            }
            .register {
                position: relative;
                text-transform: capitalize;
            }
            .button {
                border-radius: 8px;
                background-color: #3544cd;
                height: 40px;
                overflow: hidden;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 14px 20px;
                box-sizing: border-box;
                color: white;
                outline: none;
            }
            a{

                color: white;
                text-decoration: none;
                border: none;
            }

            .icons-text-buttton {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
                font-size: 16px;
                color: #6c757d;
            }
            .card {
                align-self: stretch;
                box-shadow: 0px 3px 8px rgba(48, 150, 137, 0.08);
                border-radius: 20px;
                background-color: #fff;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 40px;
                gap: 28px;
            }
            .badge {
                border-radius: 8px;
                background-color: #fafafa;
                height: 28px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;
                padding: 8px;
                box-sizing: border-box;
            }
            .badge-icon1 {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
            }
            .logo-text1 {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
                font-size: 28px;
                color: #000;
            }
            .icons-text-buttton1 {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
                color: #6c757d;
            }
            .card1 {
                align-self: stretch;
                box-shadow: 0px 3px 8px rgba(48, 150, 137, 0.08);
                border-radius: 20px;
                background-color: #fff;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 40px;
                gap: 28px;
                font-size: 16px;
                color: #3544cd;
            }
            .cards1 {
                max-width: 1000px;
                margin-left: -324px;
                width: 1283px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 24px;
            }
            .cards {
                width: 1318px;
                height: 1752px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }
            .side-bar-cars-banner {
                position: absolute;
                   top: 163px;
                left: 50px;
                width: 1440px;
                height: 1877px;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 60px 72px 120px;
                box-sizing: border-box;
            }
            .find-company {
                position: relative;
                line-height: 150%;
            }
            .find-company-wrapper {
                width: 1312px;
                height: 119px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }
            .name-company-wrapper {
                width: 420px;
                background-color: #fff;
                border: 1px solid rgba(20, 20, 20, 0.1);
                box-sizing: border-box;
                overflow: hidden;
                flex-shrink: 0;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                padding: 18px;
            }
            .search1 {
                position: relative;
                line-height: 150%;
                font-weight: 500;
            }
            .button2 {
                border-radius: 0px 4px 4px 0px;
                background-color: #3575e2;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 18px 40px;
                margin-left: -1px;
                color: #fff;
            }
            .frame-group {
                align-self: stretch;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.04);
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: center;
                font-size: 16px;
                color: rgba(20, 20, 20, 0.5);
            }
            .frame-parent {
                align-self: stretch;
                height: 131px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
            }
            .search {
                position: absolute;
                top: 75px;

                width: 1440px;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;
                padding: 80px 64px;
                box-sizing: border-box;
                font-size: 56px;
                color: #141414;
                font-family: 'DM Sans';
            }
            .companyl {
                width: 100%;
                position: relative;
                border-radius: 8px;
                background-color: #fff;
                border: 2px solid rgba(20, 20, 20, 0.1);
                box-sizing: border-box;
                height: 2255px;
                overflow: hidden;
                text-align: left;
                font-size: 28px;
                color: #000;
                font-family: 'Abhaya Libre ExtraBold';
            }
            .search2 {
                display: inline-block;
                position: relative;
            }

            .search2 input[type="text"] {
                    margin-left: 42px;
                width: 400px;
                padding: 10px;
                border: none;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .search2 button[type="submit"] {
                background-color: #4e99e9;
                border: none;
                color: #fff;
                cursor: pointer;
                padding: 10px 20px;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                position: absolute;
                top: 0;
                right: 0;
                transition: .9s ease;
            }

            .search2 button[type="submit"]:hover {
                transform: scale(1.1);
                color: rgb(255, 255, 255);
                background-color: blue;
            }

        </style>
    </head>
    <body>
        <div class="companyl">
            <div class="side-bar-cars-banner">
                <div class="cards">
                    <div class="cards1">
                        <c:forEach items="${listc}" var="c" >
                            <div class="card">
                                <div class="textbadge-icon">
                                    <div class="badge-icon">
                                    </div>
                                    <div class="logo-text">
                                        <img class="logo-icon" alt="" src="${c.logo}">
                                        <div class="text">
                                            <div class="developer-expert">${c.nameCompany}</div>
                                            <div class="armstrong-ohara-and">${c.nameCEO}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="icons-text-buttton">
                                    <div class="icons-text">
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/briefcase 2.svg">
                                            <div class="developer-expert">${c.vat}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/phone.png">
                                            <div class="developer-expert">${c.phone}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="g135-icon" alt="" src="img/g135.svg">
                                            <div class="developer-expert">${c.location}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/map-pin.svg">
                                            <div class="developer-expert">${c.description}</div>
                                        </div>
                                    </div>

                                    <a href="CompanyController?action=accountEmploy&CompanyId=${c.idCompany}"> <div class="button">Detail </div></a>

                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <div class="search">
                <div class="frame-parent">
                    <form action="SearchController?searchCompany=searchCompany" method="post"">
                        <div class="search2">
                            <input placeholder="Search..." type="text" name="searchC">
                            <button type="submit" >Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </body>
    <script>
        function toggleMoreCategories() {
            var moreCategories = document.getElementById("more-categories");
            if (moreCategories.style.display === "none") {
                moreCategories.style.display = "block";
            } else {
                moreCategories.style.display = "none";
            }
        }
    </script>
</html>
<%@include file="./Header/Footer.jsp" %>