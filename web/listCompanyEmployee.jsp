<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/HeaderEmployee.jsp" %>
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
            .badge-iconem {
                align-self: stretch;
                height: 28px;
            }
            .logo-iconem {
                width: 40px;
                position: relative;
                height: 40px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .developer-expertem {
                position: relative;
            }
            .armstrong-ohara-andem {
                position: relative;
                font-size: 16px;
            }
            .textem {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
            }
            .logo-textem {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
            }
            .textbadge-iconem {
                align-self: stretch;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .briefcase2-2-iconem {
                width: 24px;
                position: relative;
                height: 24px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .icon-textem {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 12px;
            }
            .g135-iconem {
                width: 24px;
                position: relative;
                height: 24px;
                object-fit: cover;
            }
            .icons-textem {
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: flex-start;
                gap: 24px;
            }
            .registerem {
                position: relative;
                text-transform: capitalize;
            }
            .buttonemem {
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
            .icons-text-butttonem {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
                font-size: 16px;
                color: #6c757d;
            }
            .cardem {
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
            .badgeem {
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
            .badge-icon1em {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
            }
            .logo-text1em {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 20px;
                font-size: 28px;
                color: #000;
            }
            .icons-text-buttton1em {
                align-self: stretch;
                display: flex;
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
                color: #6c757d;
            }
            .card1em {
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
            .cards1em {
                width: 1283px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 24px;
            }
            .cardsem {
                width: 1318px;
                height: 1752px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }
            .side-bar-cars-bannerem {
                position: absolute;
                
                left: -63px;
                width: 1347px;
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
            .button2em {
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
              
               
                width: 500px;
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
            .companylem {
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
        <div class="companylem">
            <div class="side-bar-cars-bannerem">
                <div class="cardsem">
                    <div class="cards1em">
                        <c:forEach items="${listc}" var="c" >
                            <div class="cardem">
                                <div class="textbadge-iconem">
                                    <div class="badge-iconem">
                                    </div>
                                    <div class="logo-textem">
                                        <img class="logo-iconem" alt="" src="${c.logo}">
                                        <div class="textem">
                                            <div class="developer-expertem">${c.nameCompany}</div>
                                            <div class="armstrong-ohara-andem">${c.nameCEO}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="icons-text-butttonem">
                                    <div class="icons-textem">
                                        <div class="icon-textem">
                                            <img class="briefcase2-2-iconem" alt="" src="briefcase(2) 2.svg">
                                            <div class="developer-expertem">${c.vat}</div>
                                        </div>
                                        <div class="icon-textem">
                                            <img class="briefcase2-2-iconem" alt="" src="clock.svg">
                                            <div class="developer-expertem">${c.phone}</div>
                                        </div>
                                        <div class="icon-textem">
                                            <img class="g135-icon" alt="" src="g135.png">
                                            <div class="developer-expertem">${c.location}</div>
                                        </div>
                                        <div class="icon-textem">
                                            <img class="briefcase2-2-icon" alt="" src="map-pin.svg">
                                            <div class="developer-expertem">${c.description}</div>
                                        </div>
                                    </div>
                                     <a href="CompanyController?action=accountEmploy&CompanyId=${c.idCompany}"> <div class="button">Detail </div></a>
                                </div>
                            </div>
                        </c:forEach>
                 
                            <h3 style="color: red"> ${fail}</h3>
                     
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