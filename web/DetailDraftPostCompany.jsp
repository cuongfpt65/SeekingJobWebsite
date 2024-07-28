
<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Nguyễn Văn Chiến-CE170237
--%>

<%@include file="./Header/HeaderCompany.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    </head>
    <body>

       <title>Post Details Draft Of Company</title>

        <div class="container">
            <div class="row">   
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">


                    <div class="post-item">
                        <div class="post-image col-sm-5">
                            <img src="${postD.image}">

                        </div>

                        <div class="post-conten col-sm-3">
                            <p>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <g clip-path="url(#clip0_2368_5215)">
                                <path d="M16.25 3.125H3.75C3.40482 3.125 3.125 3.40482 3.125 3.75V16.25C3.125 16.5952 3.40482 16.875 3.75 16.875H16.25C16.5952 16.875 16.875 16.5952 16.875 16.25V3.75C16.875 3.40482 16.5952 3.125 16.25 3.125Z" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M13.75 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M6.25 1.875V4.375" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M3.125 6.875H16.875" stroke="#0A65CC" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
                                </g>
                                <a href="DrafrPost.jsp"></a>
                                <defs>
                            <clipPath id="clip0_2368_5215">
                                <rect width="20" height="20" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            ${postD.timePosted}
                            </p>

                            <p class="major">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <path d="M0.75 9L12 3L23.25 9L12 15L0.75 9Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M17.625 22.5V12L12 9" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M20.625 10.4V15.5113C20.6253 15.6731 20.573 15.8307 20.476 15.9601C19.8444 16.8005 17.18 19.875 12 19.875C6.82004 19.875 4.15558 16.8005 3.52402 15.9601C3.42699 15.8307 3.37469 15.6731 3.375 15.5113V10.4" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                ${postD.major}
                            </p>

                            <p rel="stylesheet" href="url">
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

                            <div>
                                <p class="icon-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M21.75 6H2.25C1.83579 6 1.5 6.33579 1.5 6.75V17.25C1.5 17.6642 1.83579 18 2.25 18H21.75C22.1642 18 22.5 17.6642 22.5 17.25V6.75C22.5 6.33579 22.1642 6 21.75 6Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    <path d="M16.5 6L22.5 11.25" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    <path d="M16.5 18L22.5 12.75" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    <path d="M7.5 6L1.5 11.25" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    <path d="M7.5 18L1.5 12.75" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="green"/>
                                    </svg>
                                    <span style="color: red; font-weight: bold;" class="salary-text">${postD.salary}/Month</span>
                                </p>
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



                                <p>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M9.75 16.5C11.4069 16.5 12.75 15.1569 12.75 13.5C12.75 11.8431 11.4069 10.5 9.75 10.5C8.09315 10.5 6.75 11.8431 6.75 13.5C6.75 15.1569 8.09315 16.5 9.75 16.5Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M5.00528 19.4999C5.43138 18.6022 6.10338 17.8439 6.94324 17.3129C7.78309 16.7819 8.75636 16.5 9.75 16.5C10.7436 16.5 11.7169 16.7819 12.5568 17.3129C13.3966 17.8439 14.0686 18.6022 14.4947 19.4999L20.25 19.5C20.3485 19.5 20.446 19.4806 20.537 19.4429C20.628 19.4052 20.7107 19.35 20.7803 19.2803C20.85 19.2107 20.9052 19.128 20.9429 19.037C20.9806 18.946 21 18.8485 21 18.75V5.25C21 5.05109 20.921 4.86032 20.7803 4.71967C20.6397 4.57902 20.4489 4.5 20.25 4.5H3.75C3.55109 4.5 3.36032 4.57902 3.21967 4.71967C3.07902 4.86032 3 5.05109 3 5.25V18.7501C3 18.8486 3.0194 18.9461 3.05709 19.0371C3.09478 19.1281 3.15003 19.2107 3.21967 19.2804C3.28932 19.35 3.372 19.4053 3.46299 19.4429C3.55399 19.4806 3.65151 19.5 3.75 19.5L5.00528 19.4999Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M16.5 16.5H18V7.5H6V9" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    ${postD.jobTypes}
                                </p>          

                                <p class="icon-containerr">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M5.25 21.75H18.75" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 12.75C13.6569 12.75 15 11.4069 15 9.75C15 8.09315 13.6569 6.75 12 6.75C10.3431 6.75 9 8.09315 9 9.75C9 11.4069 10.3431 12.75 12 12.75Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M19.5 9.75C19.5 16.5 12 21.75 12 21.75C12 21.75 4.5 16.5 4.5 9.75C4.5 7.76088 5.29018 5.85322 6.6967 4.4467C8.10322 3.04018 10.0109 2.25 12 2.25C13.9891 2.25 15.8968 3.04018 17.3033 4.4467C18.7098 5.85322 19.5 7.76088 19.5 9.75V9.75Z" stroke="#18191C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    ${postD.location}
                                </p>
                            </div>

                            `
                            <div class="button-ud">
                                <button class="btn-custom up">
                                    <a href="/postController?action=loadupdatePostDraft&postId=${postD.id}" class="btn-link">Update</a>
                                </button>

                                <button class="btn-custom po">
                                    <a href="/postController?action=Post&postId=${postD.id}" class="btn-link" onclick="return validateFieldsBeforePost();">Post</a>
                                </button>

                                <button class="btn-custom de" onclick="deletePost('${postD.id}')">Delete</button>
                            </div>


                        </div>
                    </div>
                    <div>
                        <h2>${postD.title}</h2>
                        <p class="description">${postD.description}</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
    </div>
    <div class="footer">

    </div>
</div>
<style>
  
    .container{
        max-width: 100%;
    }
    .major{
        font-size: x-large;
    }
    .col-sm-8{
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Hiệu ứng mờ */
        display: block;
        padding: 10px;
        margin: 5px 0;
        margin-top: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        text-decoration: none;
        color: #333;
        transition: background-color 0.3s ease;
    }

    .post-item{
        display: flex;


    }
    .post-image{
        max-width: 60%;
        width: 850px;
        height: 590px;
        flex-shrink: 0;
        border-radius: 8px;

        background: var(--Gray-500, #767F8C);
    }
    .post-image img {
        width: 100%; /* hoặc thiết lập chiều rộng cụ thể như 340px */
        height: 100%; /* hoặc thiết lập chiều cao cụ thể như 236px */
        object-fit: cover; /* Đảm bảo ảnh giữ nguyên tỷ lệ và lấp đầy khung */
        border-radius: 8px; /* Giữ viền tròn */
    }
    .post-conten{
        margin-left: 15px;
        margin-top: 10px

    }
    .button-ud{
        display: flex;
        justify-content: space-between;
    }
    .col-sm-3{
        width: 36%;
    }
    .description{
        width: 85%;
        height: auto;
    }

    .button-ud {
        display: flex;
        gap: 10px; /* Khoảng cách giữa các nút */
        margin: 20px 0; /* Khoảng cách phía trên và dưới */
    }

    .btn-custom {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s, transform 0.3s;
    }

    .btn-custom a {
        color: white;
        text-decoration: none;
        display: block;
    }

    .btn-custom:hover {
        transform: scale(1.05);
    }

    .btn-custom:active {
        transform: scale(0.98);
    }

    .btn-link {
        color: inherit; /* Kế thừa màu chữ từ nút */
    }

    /* Cụ thể cho các loại nút */
    .up {
        background-color: #007bff;
    }

    .po {
        background-color: #28a745;
    }

    .de {
        background-color: #dc3545;
    }


</style>
<script>
    function deletePost(postid) {
        if (confirm('Are you sure you want to delete this post?')) {
            window.location.href = '/postController?action=deletePost&postId=' + postid;
        }
    }
    function validateFieldsBeforePost() {
        var title = "${postD.title}";
        var description = "${postD.description}";
        var salary = "${postD.salary}";
        var start = "${postD.start}";
        var end = "${postD.end}";
        var major = "${postD.major}";
        var jobTypes = "${postD.jobTypes}";
        var location = "${postD.location}";

        var missingFields = [];

        if (title.trim() === '') {
            missingFields.push("Title");
        }
        if (description.trim() === '') {
            missingFields.push("Description");
        }
        if (salary.trim() === '') {
            missingFields.push("Salary");
        }
        if (start.trim() === '') {
            missingFields.push("Start Date");
        }
        if (end.trim() === '') {
            missingFields.push("End Date");
        }
        if (major.trim() === '') {
            missingFields.push("Major");
        }
        if (jobTypes.trim() === '') {
            missingFields.push("Job Types");
        }
        if (location.trim() === '') {
            missingFields.push("Location");
        }

        if (missingFields.length > 0) {
            var errorMessage = "Bạn cần nhập đầy đủ thông tin các trường sau để có thể đăng bài:\n";
            errorMessage += missingFields.join("\n");
            alert(errorMessage);
            return false;
        }

        return true;
    }
    function cancel(postid) {
        if (confirm('Are you sure you want to Cancel this post?')) {
            window.location.href = '/postController?action=listDraftOfCompany&postId=' + postid;
        }
    }



</script>
</body>
</html>
<%@include file="./Header/Footer.jsp" %>