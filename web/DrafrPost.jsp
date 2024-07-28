<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Nguyễn Văn Chiến_Ce170237
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>


    <head>
        <meta charset="UTF-8">
        <title>Post List</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
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
            .post-image {
                width: 100%; /* Ensure the image takes the full width of the container */
                max-width: 340px; /* Set a maximum width */
                height: 236px; /* Maintain aspect ratio */
                border-radius: 8px;
                background: var(--Gray-500, #767F8C);
                overflow: hidden; /* Hide any overflow */
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .post-image img {
                width: 100%; /* hoặc thiết lập chiều rộng cụ thể như 340px */
                height: 100%; /* hoặc thiết lập chiều cao cụ thể như 236px */
                object-fit: cover; /* Đảm bảo ảnh giữ nguyên tỷ lệ và lấp đầy khung */
                border-radius: 8px; /* Giữ viền tròn */
            }

            .post-itemm{
                display: flex;
            }
            .post-content{
                margin-left: 30px;
            }
            .col-sm-8{
                border: 1px solid #ddd;
            }
        </style>
        <script>
            function deleteDraft(postid) {
                if (confirm('Are you sure you want to delete this draft?')) {
                    window.location.href = '/postController?action=deleteDraft&postId=' + postid;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">

            <button><a href="/Home " class="btn btn-success">Cancel</a></button>
            <div class="row">


                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">

                    <c:forEach items="${listDraft}" var="post" varStatus="status">
                      
                            <div class="card4">

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
                                    <div class="icons-text">
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
                                        <a  href="/postController?action=detailDraftPC&postId=${post.id}" class="register" style="text-decoration: none; color: white;"><div></div>Job details</a>
                                    </div>
                                    <button onclick="deleteDraft('${pd.id}')" class="btn btn-danger">Delete</button>
                                </div>
                            </div>
                 
                    </c:forEach>
                </div>
                <div class="col-sm-2">

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>