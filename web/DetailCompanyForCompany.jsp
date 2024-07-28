<%-- 
    Document   : profileCompany
    Created on : Jul 25, 2024, 3:57:00 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Company</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@500;800&display=swap" />

        <style>
            .pagination-container {
                display: flex;
                justify-content: center;
                align-items: center;
                list-style: none;
                padding: 0;
            }

            .page-item {
                margin: 0 5px;
            }

            .page-link {
                display: block;
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .page-link:hover {
                background-color: #007bff;
                color: white;
            }

            .page-item.active .page-link {
                background-color: #007bff;
                color: white;
                border-color: #007bff;
            }

            .page-link[aria-label="Previous"], .page-link[aria-label="Next"] {
                font-weight: bold;
                padding: 8px 12px;
            }

            .page-link[aria-label="Previous"]:hover, .page-link[aria-label="Next"]:hover {
                background-color: #0056b3;
                color: white;
            }

            .persona-name {
                position: relative;
                font-weight: 800;
                word-wrap: break-word; /* Ensure long words wrap */
            }
            .drop-your-image {
                position: absolute;
                top: calc(50% - 33px);
                left: calc(50% - 98.5px);
                font-weight: 500;
                display: inline-block;
                width: 197px;
            }
            .image {
                width: 300px;
                position: relative;
                border-radius: 150px;
                background-color: #cee3ea;
                height: 300px;
                overflow: hidden;
                flex-shrink: 0;
                font-size: 28px;
                color: #4b6480;
            }
            .age {
                width: 193px;
                position: relative;
                text-transform: uppercase;
                font-weight: 800;
                display: flex;
                align-items: center;
                height: auto; /* Remove fixed height */
                flex-shrink: 0;
            }
            .diva {
                flex: 1;
                position: relative;
                font-size: 15px;
                font-weight: 500;
                color: #4b6480;
                word-wrap: break-word; /* Ensure long words wrap */
                word-break: break-all; /* Break long words */
            }
            .row-item {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }
            .details {
                width: 468px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 12px;
                text-align: left;
                font-size: 15px;
            }
            .profile {
                width: 619px;
                border-radius: 10px;
                background-color: #fafafa;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                padding: 40px 0px 32px;
                box-sizing: border-box;
                gap: 40px;
            }
            .stacked {
                width: 625px;
                height: auto; /* Remove fixed height */
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }
            .block {
                align-self: stretch;
                border-radius: 10px;
                background-color: #fafafa;
                overflow: hidden;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 4px 40px;
            }
            .content {
                align-self: stretch;
                position: relative;
                font-size: 20px;
                line-height: 130%;
                font-weight: 500;
                color: #4b6480;
                word-wrap: break-word; /* Ensure long words wrap */
            }
            .block1 {
                align-self: stretch;
                border-radius: 10px;
                background-color: #fafafa;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 32px;
                gap: 24px;
            }
            .block2 {
                align-self: stretch;
                border-radius: 10px;
                background-color: #fafafa;
                height: auto; /* Remove fixed height */
                overflow: hidden;
                flex-shrink: 0;
            }
            .stacked1 {
                width: 800px;
                height: auto; /* Remove fixed height */
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 32px;
                text-align: left;
                font-size: 20px;
            }
            .ux-persona {
                width: 100%;
                position: relative;
                border-radius: 10px;
                background-color: #fff;
                overflow: hidden;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 40px;
                box-sizing: border-box;
                gap: 24px;
                text-align: center;
                font-size: 20px;
                color: #1e3d60;
                font-family: 'Public Sans', sans-serif;
            }
            .list-post {
                margin-left: 40px;
                display: flex;
                position: relative;
                font-size: 40px;
                font-weight: 800;
                font-family: 'Public Sans';
                color: #1e3d60;
                text-align: center;
                text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            }

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
                color: #fff;
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
                
                width: 1283px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 24px;
            }
            .cards {
                    margin-left: -150px;
                width: 1318px;
                height: 1752px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }
            .side-bar-cars-banner {
                position: absolute;
                top: -90px;
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
                border: none;
                outline: none;
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
                left: 70px;
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
                height: 1640px;
                overflow: hidden;
                text-align: left;
                font-size: 28px;
                color: #000;
                font-family: 'Abhaya Libre ExtraBold';
            }


        </style>
    </head>
    <body>
        <div class="ux-persona">
            <div class="stacked">
                <div class="profile">
                    <div class="persona-name">${br.nameCompany}</div>
                    <img class="image"src="imgs/room/${br.logo}"/>


                    <div class="details">
                        <div class="row-item">
                            <div class="age">Vat</div>
                            <div class="diva">${br.vat}</div>
                        </div>
                        <div class="row-item">
                            <div class="age">Phone</div>
                            <div class="diva">${br.phone}</div>
                        </div>
                        <div class="row-item">
                            <div class="age">Location</div>
                            <div class="diva">${br.location}</div>
                        </div>
                        <div class="row-item">
                            <div class="age">Address</div>
                            <div class="diva">${br.address}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="stacked1">
                <div class="block">
                    <div class="persona-name">CEO: ${br.nameCEO} </div>
                </div>
                <div class="block1">
                    <div class="persona-name">Description</div>
                    <div class="content">${br.description}</div>
                </div>
                <div class="block2"></div>
            </div>
        </div>
        <div class="list-post">List Post</div>
        <div class="companyl">
            <div class="side-bar-cars-banner">
                <div class="cards">
                    <div class="cards1">
                        <c:forEach items="${listqq}" var="c" >
                            <div class="card">
                                <div class="textbadge-icon">
                                    <div class="badge-icon">
                                    </div>
                                    <div class="logo-text">
                                        <img class="icon" style="width: 50px;" alt="" src="imgs/room/${c.image}">
                                        <div class="text">
                                            <div class="developer-expert">${c.title}</div>
                                            <div class="armstrong-ohara-and">${c.description}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="icons-text-buttton">
                                    <div class="icons-text">
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/briefcase 2.svg">
                                            <div class="developer-expert">${c.major}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/clock.svg">
                                            <div class="developer-expert">${c.jobTypes}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="g135-icon" alt="" src="img/g135.svg">
                                            <div class="developer-expert">${c.salary}</div>
                                        </div>
                                        <div class="icon-text">
                                            <img class="briefcase2-2-icon" alt="" src="img/map-pin.svg">
                                            <div class="developer-expert">${c.location}/Month</div>
                                        </div>

                                    </div>
                                    <a class="button" href="/postController?action=details&postId=${c.id}">
                                        <div class="register">details</div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>

                    </div>        
                    <div class="pagination-container">
                        <c:if test="${tag > 1}">
                            <a href="Paging?index=${tag - 1}" aria-label="Previous" class="page-link">&laquo;</a>
                        </c:if>
                        <c:forEach begin="1" end="${endp}" var="i">
                            <li class="page-item ${tag == i ? 'active' : ''}">
                                <a href="Paging?index=${i}" class="page-link">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${tag < endp}">
                            <a href="Paging?index=${tag + 1}" aria-label="Next" class="page-link">&raquo;</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
<%@include file="./Header/Footer.jsp" %>