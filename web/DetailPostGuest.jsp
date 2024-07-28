<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="./Header/Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <link rel="stylesheet" href="./Css/home.css" />
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
    </head>
    <body>
     
        <title>Post Details Guest</title>
        <div class="container">

            <div class="row">   
                <div class="col-sm-2">
                    
                </div>
               

                <div class="col-sm-7 tam">
                    <div class="post-itemmmm">
                        <h2 class="title">${postD.title}</h2>
                        <div class="ct">
                            <p class="idcompany" rel="stylesheet" href="url">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <path d="M1.5 20.2484H22.5" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M13.4995 20.2484V3.74841C13.4995 3.5495 13.4204 3.35874 13.2798 3.21808C13.1391 3.07743 12.9484 2.99841 12.7495 2.99841H3.74945C3.55054 2.99841 3.35977 3.07743 3.21912 3.21808C3.07847 3.35874 2.99945 3.5495 2.99945 3.74841V20.2484" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M20.9995 20.2484V9.74841C20.9995 9.5495 20.9204 9.35874 20.7798 9.21808C20.6391 9.07743 20.4484 8.99841 20.2495 8.99841H13.4995" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M5.99945 6.74841H8.99945" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M7.49945 12.7484H10.4995" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M5.99945 16.4984H8.99945" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M16.4995 16.4984H17.9995" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M16.4995 12.7484H17.9995" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>

                                ${postD.idCompany} 

                            </p>

                            <p>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <g clip-path="url(#clip0_2368_5215)">
                                <path d="M16.25 3.125H3.75C3.40482 3.125 3.125 3.40482 3.125 3.75V16.25C3.125 16.5952 3.40482 16.875 3.75 16.875H16.25C16.5952 16.875 16.875 16.5952 16.875 16.25V3.75C16.875 3.40482 16.5952 3.125 16.25 3.125Z" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M13.75 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.25 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M3.125 6.875H16.875" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                </g>
                                <defs>
                            <clipPath id="clip0_2368_5215">
                                <rect width="20" height="20" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            ${postD.timePosted}
                            </p>
                        </div>


                        <div class="post-imageee col-sm-4">
                            <img src="${postD.image}">

                        </div>
                        <p class="majorrrr">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <g clip-path="url(#clip0_2128_1971)">
                            <path d="M6.5625 5.71875V3.6315C6.5625 2.80078 7.24219 2.12109 8.07291 2.12109H15.9271C16.7579 2.12109 17.4375 2.80078 17.4375 3.6315V5.71875" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M22.3594 12.4688V20.4727C22.3594 21.246 21.7264 21.8789 20.9531 21.8789H3.04688C2.27358 21.8789 1.64062 21.2461 1.64062 20.4727V12.5156" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M10.125 14.8359C5.16614 14.5524 0.703125 13.1344 0.703125 10.5819V7.25391C0.703125 6.47939 1.33481 5.84766 2.10938 5.84766H21.8906C22.6651 5.84766 23.2969 6.47944 23.2969 7.25391V10.5819C23.2969 13.1504 18.7775 14.5701 13.7812 14.8411" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.2656 13.4414H13.7344V15.0586C13.7344 15.948 13.0066 16.6758 12.1172 16.6758H11.8828C10.9934 16.6758 10.2656 15.948 10.2656 15.0586V13.4414Z" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                            </g>
                            <defs>
                        <clipPath id="clip0_2128_1971">
                            <rect width="24" height="24" fill="white"/>
                        </clipPath>
                        </defs>
                        </svg>
                        ${postD.major}
                        </p>



                        <div class="post-conten ">

                            <p style="display: flex; align-items: center;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <g clip-path="url(#clip0_2368_5215)">
                                <path d="M16.25 3.125H3.75C3.40482 3.125 3.125 3.40482 3.125 3.75V16.25C3.125 16.5952 3.40482 16.875 3.75 16.875H16.25C16.5952 16.875 16.875 16.5952 16.875 16.25V3.75C16.875 3.40482 16.5952 3.125 16.25 3.125Z" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M13.75 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.25 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M3.125 6.875H16.875" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                </g>
                                <defs>
                            <clipPath id="clip0_2368_5215">
                                <rect width="20" height="20" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            <span style="margin-left: 5px;">${postD.start} / ${postD.end}</span>
                            </p>




                            <div class=" jl">

                                <p class="icon-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 6V12L16 14" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    ${postD.jobTypes}
                                </p>     
                                <p class="icon-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <mask id="mask0_2128_1984" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                    <path d="M0 1.90735e-06H24V24H0V1.90735e-06Z" fill="white"/>
                                </mask>
                                <g mask="url(#mask0_2128_1984)">
                                <path d="M19.3096 6.37335V4.49624C19.3096 3.4619 18.471 2.62335 17.4367 2.62335H2.80957C1.77405 2.62335 0.93457 3.46284 0.93457 4.49835C0.93457 5.53387 1.77405 6.37335 2.80957 6.37335H21.1867C22.221 6.37335 23.0596 7.2119 23.0596 8.24624V11.0609" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                <path d="M23.0596 16.6859V19.5005C23.0596 20.5348 22.221 21.3734 21.1867 21.3734H2.80957C1.77405 21.3734 0.93457 20.5339 0.93457 19.4984V4.49835" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                <path d="M23.0596 16.6859H18.3721C16.8188 16.6859 15.5596 15.4266 15.5596 13.8734C15.5596 12.3201 16.8188 11.0609 18.3721 11.0609H23.0596V16.6859Z" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                </g>
                                </svg>
                                <span style="color: red;  font-weight: bold;" class="salary-text">${postD.salary}/Month</span>
                                </p>

                                <p class="icon-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M21 10C21 17 12 23 12 23C12 23 3 17 3 10C3 7.61305 3.94821 5.32387 5.63604 3.63604C7.32387 1.94821 9.61305 1 12 1C14.3869 1 16.6761 1.94821 18.364 3.63604C20.0518 5.32387 21 7.61305 21 10Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 13C13.6569 13 15 11.6569 15 10C15 8.34315 13.6569 7 12 7C10.3431 7 9 8.34315 9 10C9 11.6569 10.3431 13 12 13Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    ${postD.location}
                                </p>
                            </div>
                            <p>${postD.description}</p>
                        </div>

                        `
                        <div class="button-ud">
                            <button class="btn-custom po">
                                <a href="ApplyController?action=apply&postId=${postD.id}&companyId=${postD.idCompany}" class="btn btn-info" onclick="confirmSubmission(event);">Apply</a>
                            </button>
                        </div>


                    </div>
                </div>
                <div class="col-sm-3">
                    <div>
                        <c:forEach items="${listqq}" var="post" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <div class="card4" style="padding: 20px">

                                    <div class=" textbadge-icon">
                                        <div class="logo-text">
                                            <img class="icon" alt="" src="/imgs/room/${post.image}">
                                            <div class="textinput">
                                                <div class="title">  ${post.title}</div>
                                                <div class="armstrong-ohara-and">  ${post.idCompany}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="icons-text-buttton">
                                        <div class="">
                                            <div class="map-pin-parent">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                <g clip-path="url(#clip0_2128_1971)">
                                                <path d="M6.5625 5.71875V3.6315C6.5625 2.80078 7.24219 2.12109 8.07291 2.12109H15.9271C16.7579 2.12109 17.4375 2.80078 17.4375 3.6315V5.71875" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M22.3594 12.4688V20.4727C22.3594 21.246 21.7264 21.8789 20.9531 21.8789H3.04688C2.27358 21.8789 1.64062 21.2461 1.64062 20.4727V12.5156" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M10.125 14.8359C5.16614 14.5524 0.703125 13.1344 0.703125 10.5819V7.25391C0.703125 6.47939 1.33481 5.84766 2.10938 5.84766H21.8906C22.6651 5.84766 23.2969 6.47944 23.2969 7.25391V10.5819C23.2969 13.1504 18.7775 14.5701 13.7812 14.8411" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M10.2656 13.4414H13.7344V15.0586C13.7344 15.948 13.0066 16.6758 12.1172 16.6758H11.8828C10.9934 16.6758 10.2656 15.948 10.2656 15.0586V13.4414Z" stroke="#3892E4" stroke-width="2" stroke-miterlimit="22.9256" stroke-linecap="round" stroke-linejoin="round"/>
                                                </g>
                                                <defs>
                                                <clipPath id="clip0_2128_1971">
                                                    <rect width="24" height="24" fill="white"/>
                                                </clipPath>
                                                </defs>
                                                </svg>
                                                <div class="location">${post.major}</div>
                                            </div>
                                            <div class=" map-pin-parent">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M12 6V12L16 14" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                                <div class="location">${post.jobTypes}</div>
                                            </div>
                                            <div class="map-pin-parent">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                <mask id="mask0_2128_1984" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                                    <path d="M0 1.90735e-06H24V24H0V1.90735e-06Z" fill="white"/>
                                                </mask>
                                                <g mask="url(#mask0_2128_1984)">
                                                <path d="M19.3096 6.37335V4.49624C19.3096 3.4619 18.471 2.62335 17.4367 2.62335H2.80957C1.77405 2.62335 0.93457 3.46284 0.93457 4.49835C0.93457 5.53387 1.77405 6.37335 2.80957 6.37335H21.1867C22.221 6.37335 23.0596 7.2119 23.0596 8.24624V11.0609" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                                <path d="M23.0596 16.6859V19.5005C23.0596 20.5348 22.221 21.3734 21.1867 21.3734H2.80957C1.77405 21.3734 0.93457 20.5339 0.93457 19.4984V4.49835" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                                <path d="M23.0596 16.6859H18.3721C16.8188 16.6859 15.5596 15.4266 15.5596 13.8734C15.5596 12.3201 16.8188 11.0609 18.3721 11.0609H23.0596V16.6859Z" stroke="#3892E4" stroke-width="2" stroke-miterlimit="10"/>
                                                </g>
                                                </svg>
                                                <div class="location">${post.salary}/Month</div>
                                            </div>
                                            <div class="map-pin-parent">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                <path d="M21 10C21 17 12 23 12 23C12 23 3 17 3 10C3 7.61305 3.94821 5.32387 5.63604 3.63604C7.32387 1.94821 9.61305 1 12 1C14.3869 1 16.6761 1.94821 18.364 3.63604C20.0518 5.32387 21 7.61305 21 10Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M12 13C13.6569 13 15 11.6569 15 10C15 8.34315 13.6569 7 12 7C10.3431 7 9 8.34315 9 10C9 11.6569 10.3431 13 12 13Z" stroke="#3892E4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                                <div class="location">${post.location}</div>
                                            </div>

                                        </div>
                                        <div class="button2">
                                            <a  href="/postController?action=details&postId=${post.id}" class="register" style="text-decoration: none; color: white;"><div></div>Job details</a>

                                        </div>

                                    </div>


                                </div>

                            </c:if>
                        </c:forEach>
                        
                    </div>
                </div>           
            </div>
        </div>



</div>
<style>
    .location{
        margin: 10px;
    }
    .jl{
        display: flex;
        justify-content: space-between;
        color: var(--Gray-600, #6C757D);
        font-family: "Abhaya Libre ExtraBold";
        font-size: 16px;
        font-style: normal;
        font-weight: 800;
        line-height: normal;
    }
    icon-container{
        display: flex;
        margin-bottom: 1rem;
        margin-right: 20px;

    }


    .container{
        max-width: 100%;
    }
    .tam{

        max-width: 100%;
        display: block;
        padding: 10px;
        margin: 5px 0;
        margin-top: 10px;
        border-radius: 8px;
        text-decoration: none;
        color: #333;
        transition: background-color 0.3s ease;
    }
    .post-itemmmm{
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Hiệu ứng mờ */
        max-width: 80%;
        display: block;
        padding: 10px;
        margin: auto;
        border-radius: 8px;
        text-decoration: none;
        color: #333;
        transition: background-color 0.3s ease;
    }
    .title{
        font-size: xx-large;
        font-weight: bold;
        font-style: italic;
        display: flex;
        align-items: center;
        gap: 12px;
        color: var(--Gray-600, #6C757D);
        font-family: "Abhaya Libre ExtraBold";
        font-size: 45px;
        font-style: normal;
        font-weight: 800;
        line-height: normal;
    }
    .post-imageee{
            max-width: 100%;
        width: 680px;
        height: 472px;
        margin: auto;
        flex-shrink: 0;
        border-radius: 8px;
        background: var(--Gray-500, #767F8C);
    }
    .post-imageee img {    max-width: 100%;
        
        width: 100%; /* hoặc thiết lập chiều rộng cụ thể như 340px */
        height: 100%; /* hoặc thiết lập chiều cao cụ thể như 236px */
        object-fit: cover; /* Đảm bảo ảnh giữ nguyên tỷ lệ và lấp đầy khung */
        border-radius: 8px; /* Giữ viền tròn */
    }
    .button-ud{
        display: flex;
        justify-content: space-between;
    }
    .ct{
        display: flex;
        justify-content: flex-start;
    }
    .idcompany{
        margin-right: 60px;
        color: var(--Gray-600, #6C757D);
        font-family: "Abhaya Libre ExtraBold";
        font-size: 16px;
        font-style: normal;
        font-weight: 800;
        line-height: normal;

    }
    .majorrrr{
        color: var(--Gray-600, #6C757D);
        font-family: "Abhaya Libre ExtraBold";
        font-size: 30px;
        font-style: normal;
        font-weight: 800;
        line-height: normal;
        margin-top: 20px;
        margin-bottom: 40px;
    }
    .majorrrr svg {
        width: 1em; /* Kích thước của biểu tượng SVG theo kích thước chữ */
        height: 1em; /* Kích thước của biểu tượng SVG theo kích thước chữ */
    }
    .col-sm-3{
        max-width: 100%;
    }

    /*Phan trang*/

    .pagination {
        display: flex;
        padding-left: 0;
        list-style: none;
        justify-content: space-around;
        margin: auto;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
        display: flex;
    }
    s
    .pagination li a:hover {
        color: #666;
    }
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {
        background: #0397d6;
    }
    .pagination li.disabled i {
        color: #ccc;

    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px


    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
        outline: none !important;
    }
    .oagination{
        display: flex;
        list-style: none;
    }


</style>
<script>
    function deletePost(postid) {
        if (confirm('Are you sure you want to delete this post?')) {
            window.location.href = '/postController?action=deletePost&postId=' + postid;
        }
    }
</script>
</body>

</html>
<%@include file="./Header/Footer.jsp" %>
