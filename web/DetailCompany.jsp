<%-- 
Document   : DetailCompany
Created on : Jun 16, 2024, 7:10:32 PM
Author     : Trần Tấn Lợi-CE171879
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="LinkforCompany/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Detail</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <style>
            .pagination-container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .resize-buttons {
                display: flex;
                gap: 10px;
                margin-left: 20px;
            }

            #resizable-image {
                width: 100px; /* Initial width */
                transition: width 0.3s; /* Smooth resizing */
            }

            .icon-button img {
                width: 24px;
                height: 24px;
            }

            .page-item.active .page-link {
                z-index: 1;
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            .page-link {
                color: #007bff;
            }

            .page-link:hover {
                color: #0056b3;
            }

            .avatar-icon {
                width: 100px;
                height: 100px;
                border-radius: 50%;
            }
            .content {
                padding: 20px;
            }
            .container-badges .badge1, .container-badges .badge2 {
                display: inline-block;
                margin-right: 10px;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .nav1{

                flex-wrap: wrap;
                padding-left: 0;
                margin-bottom: 0;
                list-style: none;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }

            .content {
                width: 99%;

                margin-top: 20px;
            }

            .group-parent1 {
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .candidate-settings-wrapper {
                margin-bottom: 20px;
            }

            .tab-parent {
                display: ruby;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .tab, .tab1 {
                cursor: pointer;
                padding: 10px 20px;
                background-color: #e9ecef;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            .tab:hover, .tab1:hover {
                background-color: #ced4da;
            }

            .user-icon {
                margin-right: 8px;
                vertical-align: middle;
            }

            .personal, .personal1 {
                display: inline-block;
                vertical-align: middle;
            }

            .ad {
                display: none;
            }

            .ad.active {
                display: block;
            }

            .head-profil {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .avatar-icon {
                margin-left: 10%;
                width: 30%;
                height: 50%;
            }


            .title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .info1 {
                display: flex;
                flex-wrap: wrap;
            }

            .loaction1, .price {
                display: flex;
                align-items: center;
                margin-right: 20px;
            }

            .fimap-pin-icon {
                margin-right: 5px;
            }

            .container-badges {
                display: flex;
                align-items: center;
                margin-top: 20px;
            }

            .badge1, .badge2, .badge3 {
                display: flex;
                align-items: center;
                margin-right: 20px;
            }

            .phonecall-icon {
                max-width: 100%;
                height: auto; /* Maintains the aspect ratio of the image */

                margin-right: 5px;
            }
            .anh{
                max-width: 100%;
                height: auto; /* Maintains the aspect ratio of the image */
            }

            .separator {
                height: 1px;
                background-color: #dee2e6;
                margin: 20px 0;
            }

            .my-post-parent {
                margin-top: 40px;
            }

            .my-post {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            /* Set the table to take the full width of its container */
            table.nav-parent {
                width: 100%;
                border-collapse: collapse;
            }

            /* Ensure that thead cells and tbody cells align properly */
            thead.nav1 td,
            tbody td {
                padding: 10px;
                text-align: left;
            }

            /* Set specific widths for each column */
            thead.nav1 .date-applied,
            tbody .date-applied {
                width: 30%;
            }

            thead.nav1 .detail,
            tbody .detail {
                width: 40%;
            }

            thead.nav1 .jobs,
            tbody .jobs {
                width: 30%;
            }

            /* Additional styling for the table */
            thead.nav1 {
                background-color: #f0f0f0;
            }

            thead.nav1 td.bold-text {
                font-weight: bold;
            }

            tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
            }

            tbody tr:hover {
                background-color: #e0e0e0;
            }


            .heading {
                display: flex;
                align-items: center;
            }



            .sunior-ux-designer {
                position: relative;
                line-height: 24px;
                font-weight: 500;
            }

            .featured {
                position: relative;
                line-height: 20px;
            }

            .badge {
                border-radius: 48px;
                background-color: #3695fd;
                display: block;
                flex-direction: initial;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 1px 10px;
                font-size: 10px;
                color: #f9fafb;
            }

            .heading1 {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 8px;
            }

            .fimap-pin-icon {
                width: 20px;
                position: relative;
                height: 20px;
                overflow: hidden;
                flex-shrink: 0;
            }

            .loaction {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 6px;
            }

            .info {
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                gap: 16px;
                font-size: 14px;
                color: #5e6670;
            }

            .heading-parent {
                position: absolute;
                top: calc(50% - 28px);
                left: 72px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 10px;
            }

            .heading2 {
                width: 443px;
                position: relative;
                height: 56px;
            }

            .june-12-2021 {
                width: 148px;
                position: relative;
                font-size: 14px;
                line-height: 20px;
                color: #5e6670;
                display: inline-block;
                flex-shrink: 0;
            }

            .primary {
                position: relative;
                line-height: 24px;
                text-transform: capitalize;
                font-weight: 600;
            }

            .button {
                border-radius: 3px;
                background-color: #f1f2f4;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 12px 24px;
                color: #0a65cc;
            }

            .job {
                position: relative;
                border-radius: 8px;
                width: 100%;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                padding: 20px;
                box-sizing: border-box;
                gap: 20px;
                text-align: left;
                font-size: 16px;
                color: #18191c;
                font-family: Inter;
            }



            .phonecall-parent {
                display: ruby;
                flex-direction: column;
            }
            /* Base button styling */
            /* Button container */
            .button3 {
                display: inline-block;
                overflow: hidden;
                border-radius: 4px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Primary button style */
            .primary {
                display: block;
                padding: 12px 24px;
                background-color: #007bff;
                color: #fff;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                font-weight: 600;
                transition: background-color 0.3s ease;
            }

            .primary:hover {
                background-color: #0056b3;
            }

            .primary:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
            }

            .button12 {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #ffffff;
                border-radius: 4px;
                text-align: center;
                text-decoration: none;
            }

            .primary-btn {
                color: #ffffff;
            }

            .input-field-parent {
                margin-top: 20px;
            }

            .input-field-1 {
                margin-bottom: 20px;
            }

            .field-label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .input-field-2 {
                width: 100%;
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 4px;
            }

            .change-password {
                margin-top: 40px;
            }

            .text1 {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .input-field-16 {
                width: 100%;
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 4px;
            }

            .delete-account-frame {
                margin-top: 40px;
            }

            .delete-account {
                margin-bottom: 20px;
            }

            .delete-account-text {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .delete-account-info {
                margin-bottom: 20px;
                color: #6c757d;
            }

            .delete-account-button {
                display: flex;
                align-items: center;
                padding: 10px 20px;
                background-color: #dc3545;
                color: #ffffff;
                border-radius: 4px;
                text-align: center;
                text-decoration: none;
            }

            .warning-icon {
                margin-right: 10px;
            }


            .input-field-parent {
                margin-left: 20px; /* Khoảng cách với hình ảnh */
            }
            .input-field-1 {
                margin-bottom: 15px; /* Khoảng cách giữa các cặp input fields */
            }

            .input-field-2 {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }


        </style>
    </head>
    <body>
        <div class="content">
            <div class="row">

                <div class="col-sm-2"></div>
                <div class="col-md-8">
                    <div class="group-parent1">
                        <div class="candidate-settings-wrapper">
                            <div class="candidate-settings">
                                <div class="account-parent">
                                    <div class="tab-parent">
                                        <div  class="tab" onclick="showTab('informationTab')" >
                                            <img class="user-icon" alt="" src="img/User.svg">
                                            <div class="personal">Information</div>
                                        </div>
                                        <div class="tab1" onclick="showTab('profileTab')">
                                            <img class="user-icon" alt="" src="img/UserCircle.svg">
                                            <div class="personal1">Settings Profile</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="informationTab" class="ad">
                            <div class="head-profil">
                                <img class="avatar-icon" alt="" src="img/${br.logo}">
                                <div class="content">
                                    <div class="title">
                                        <b class="michael-scott" style="font-weight: 900;">${br.nameCompany}</b>
                                    </div>
                                    <div class="info1">
                                        <div class="loaction1">
                                            <img class="fimap-pin-icon" alt="" src="img/fi_map-pin.svg">
                                            <div class="washington">${br.location}</div>
                                        </div>
                                        <div class="price">
                                            <img class="fimap-pin-icon" alt="" src="img/GlobeSimple.svg">
                                            <div class="k-80kmonth">${br.address}</div>
                                        </div>
                                    </div>
                                    <div class="container-badges">
                                        <div class="badge1">
                                            <div class="text">
                                                <span>#</span>
                                                <span class="span">${br.vat}</span>
                                            </div>
                                        </div>
                                        <div class="badge2">
                                            <img class="phonecall-icon" alt="" src="img/PhoneCall.svg">
                                            <div class="text">
                                                <span class="span1"></span>
                                                <span class="span">${br.phone}</span>
                                            </div>
                                        </div>
                                        <div class="badge3"></div>
                                    </div>
                                    <div class="separator"></div>
                                    <div class="michael-scott1">${br.nameCEO}</div>
                                    <i class="the-analogies-and">${br.description}</i>
                                </div>
                            </div>

                            <div class="my-post-parent">
                                <div class="my-post">My Post</div>
                                <table class="nav-parent">
                                    <thead class="nav1">
                                        <tr>
                                            <td class="date-applied bold-text">DATE POST</td>
                                            <td class="detail bold-text">JOBS</td>
                                            <td class="jobs bold-text">Detail</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listqq}" var="post">
                                            <tr>
                                                <td>
                                                    <div class="heading2">
                                                        <div class="employers-logo">
                                                            <img class="anh" alt="" src="img/${post.image}">
                                                        </div>
                                                        <div class="heading-parent">
                                                            <div class="phonecall-parent">
                                                                <div class="sunior-ux-designer">${post.title}</div>
                                                                <div class="badge">
                                                                    <div class="english">${post.jobTypes}</div>
                                                                </div>
                                                            </div>
                                                            <div class="info">
                                                                <div class="loaction">
                                                                    <img class="fimap-pin-icon" alt="" src="img/fi_map-pin.svg">
                                                                    <div class="english">${post.location}</div>
                                                                </div>
                                                                <div class="loaction">
                                                                    <div class="english">${post.salary}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="june-12-2021">${post.start}</div>
                                                </td>
                                                <td>
                                                    <div class="button3">
                                                        <a href="/postController?action=details&postId=${post.id}" class="primary">View details</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="pagination d-flex justify-content-center align-items-center" style="margin-left: -145px; ">
                                    <c:if test="${tag>1}"> <div class="icon-button">
                                            <a href="Paging?index=${tag-1}" aria-label="Previous">
                                                <img class="fiarrow-left-icon" alt="Previous" src="img/arrow-left-svgrepo-com.svg">
                                            </a>
                                        </div></c:if>

                                        <ul class="pagination m-0">
                                        <c:forEach begin="1" end="${endp}" var="i">
                                            <li class="page-item ${tag == i ? 'active' : ''}">
                                                <a href="Paging?index=${i}" class="page-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <c:if test="${tag<endp}"> <div class="icon-button">
                                            <a href="Paging?index=${tag+1}" aria-label="Next">
                                                <img class="fiarrow-right-icon" alt="Next" src="img/right-arrow-svgrepo-com.svg">
                                            </a>
                                        </div></c:if>


                                    </div>



                                </div>
                            </div>
                            <div id="profileTab" class="ad">
                                <div class="profile-company">
                                    <form id="updateForm" action="CompanyController?action=update" method="post">
                                        <div class="group-parent">

                                            <div class="head-profil">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="avatar-icon text-center">
                                                            <div class="upload-profile-photo">
                                                                <div class="content1">
                                                                    <img class="upload-cloud-icon" style="max-width: 200%;" src="${br.logo}">
                                                            </div>
                                                            <input type="file" name="logo" id="file-upload" class="file-upload">
                                                            <label for="file-upload" class="upload-label">
                                                                <i class="fa fa-upload"></i>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <input style="display:none;" name="email" type="text" value="${br.email}">
                                                    <input style="display:none;" name="password" type="text" value="${br.password}">

                                                    <div class="input-field-parent">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">Company</div>
                                                                    <input class="form-control" name="nameCompany" placeholder="Company" value="${br.nameCompany}" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">CEO</div>
                                                                    <input class="form-control" name="nameCEO" placeholder="CEO" type="text" value="${br.nameCEO}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">Address</div>
                                                                    <input class="form-control" name="address" value="${br.address}" placeholder="Address" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">Location</div>
                                                                    <input class="form-control" name="location" value="${br.location}" placeholder="Location" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">Phone</div>
                                                                    <input class="form-control" name="phone" value="${br.phone}" placeholder="Phone" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">VAT</div>
                                                                    <input class="form-control" name="vat" value="${br.vat}" placeholder="VAT" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="input-field-1">
                                                                    <div class="field-label">Description</div>
                                                                    <input class="form-control" name="description" value="${br.description}" placeholder="Description" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </form>



                                <form action="CompanyController?action=change" method="post">
                                    <div class="change-password">
                                        <div class="text1">Change Password</div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-field-1">
                                                    <div class="field-label">Current Password</div>
                                                    <input class="form-control" name="password" placeholder="Password" type="password">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-field-1">
                                                    <div class="field-label">New Password</div>
                                                    <input class="form-control" name="newpassword" id="newpassword" placeholder="New Password" type="password">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-field-1">
                                                    <div class="field-label">Confirm Password</div>
                                                    <input class="form-control" name="renewpassword" id="renewpassword" placeholder="Confirm Password" type="password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </div>
                                        <div style="color: red;"><strong>${checkPass}</strong></div>
                                    </div>
                                </form>

                                <form action="CompanyController?action=delete" method="post">
                                    <div class="delete-account-frame">
                                        <div class="delete-account" style="display: contents;">
                                            <div class="delete-account-text">Delete Your Account</div>
                                            <div class="delete-account-info">If you delete your SeekingJob account, you will no longer be able to get information about matched jobs, follow employers, receive job alerts, access shortlisted jobs, and more. You will be unsubscribed from all services of SeekingJob.com.</div>
                                        </div>

                                        <button type="submit" class="delete-account-button">
                                            <img class="warning-icon" src="img/Warning.svg">   
                                            <div class="delete-account-btn">Delete Account</div>
                                        </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>



    </body>

    <script>
function validateForm() {
            var string1 = document.getElementById("newpassword").value;
            var string2 = document.getElementById("renewpassword").value;

            if (string1 === string2) {
                return true; // cho phép gửi form đi
            } else {
                alert("The New Password and Confirm Password fields do not match. Please try again");
                return false; // ngăn chặn việc gửi form
            }
        }
      

        document.addEventListener('DOMContentLoaded', function () {
            showTab('informationTab');
        });

        function showTab(tabId) {
            var tabs = document.querySelectorAll('.ad');
            tabs.forEach(function (tab) {
                tab.classList.remove('active');
            });

            var selectedTab = document.getElementById(tabId);
            if (selectedTab) {
                selectedTab.classList.add('active');
            }
        }


        function showMess() {
            var op = confirm('Are you sure to delete this account');
            if (op === true) {
                window.location.href = '';
            }
        }
    </script>
</body>
</html>
