<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<link href="Css/home.css" rel="stylesheet" type="text/css"/>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Company</title>
        <style>
            .post-item {
                display: block;
                padding: 10px;
                margin: 10px;
                color: #333;
                border: 1px solid #000;
                border-radius: 5px;
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .post-item:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                border-color: #ADD8E6;
            }

            .post-item .post-title {
                color: #333; /* Màu chữ mặc định của tiêu đề */
                transition: color 0.3s ease; /* Hiệu ứng chuyển màu chữ mềm mại */
            }

            .post-item:hover .post-title {
                color: #32CD32; /* Đổi màu chữ của tiêu đề thành màu xanh lá khi hover */
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
                width: 100%;
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

            .post-itemm {
                display: flex;
            }

            .post-content {
                margin-left: 30px;
            }

            .container {
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Hiệu ứng mờ */
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 8px;
            }

            .major {
                display: flex;
                font-size: large; /* Điều chỉnh kích thước chữ */
                font-weight: bold; /* Làm chữ đậm hơn */
                font-style: italic; /* In nghiêng chữ */
                align-items: center; /* Căn giữa biểu tượng và chữ */
                gap: 12px; /* Khoảng cách giữa biểu tượng và chữ */
            }

            .major svg {
                width: 1em; /* Kích thước của biểu tượng SVG theo kích thước chữ */
                height: 1em; /* Kích thước của biểu tượng SVG theo kích thước chữ */
            }

            .title {
                display: flex;
                font-size: x-large; /* Điều chỉnh kích thước chữ */
                font-weight: bold; /* Làm chữ đậm hơn */
                font-style: italic; /* In nghiêng chữ */
                align-items: center; /* Căn giữa biểu tượng và chữ */
            }

            .search2 {
                display: inline-block;
                position: relative;
            }

            .search2 input[type="text"] {
                width: 200px;
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            // Function to handle Ajax request for search
            function performSearch() {
                var searchQuery = $('#searchQuery').val();
                var selectedLocations = $('input[name="locations"]:checked').map(function () {
                    return $(this).val();
                }).get();

                // Perform Ajax request here to fetch search results
                $.ajax({
                    url: 'search',
                    type: 'GET',
                    data: {
                        searchQuery: searchQuery,
                        locations: selectedLocations
                                // Include other filters as needed (majors, jobTypes, etc.)
                    },
                    success: function (response) {
                        // Handle successful response (e.g., update UI with search results)
                        console.log('Search results:', response);
                        // Example: Update search results container
                        $('#searchResults').html(response);
                    },
                    error: function (xhr, status, error) {
                        // Handle error
                        console.error('Error:', error);
                    }
                });
            }

// Initialize search button click event
            $('#searchButton').click(function () {
                performSearch();
            });

// Initialize change event for outside filters (locations, majors, jobTypes)
            $('input[name="locations"]').change(function () {
                performSearch(); // Trigger search on location filter change
            });

// Similarly, add change event listeners for majors and jobTypes filters
// Example:
            $('input[name="majors"]').change(function () {
                performSearch(); // Trigger search on majors filter change
            });

            $(function () {
                $("#salary-slider").slider({
                    range: true,
                    min: 1000,
                    max: 1000000,
                    step: 1000,
                    values: [1000, 1000000],
                    slide: function (event, ui) {
                        $("#minSalary").val(ui.values[0]);
                        $("#maxSalary").val(ui.values[1]);
                        $("#salaryRange").text(ui.values[0] + " - " + ui.values[1]);
                    }
                });
                $("#minSalary").val($("#salary-slider").slider("values", 0));
                $("#maxSalary").val($("#salary-slider").slider("values", 1));
                $("#salaryRange").text($("#salary-slider").slider("values", 0) + " - " + $("#salary-slider").slider("values", 1));

                updateInitialSelections();

                function updateInitialSelections() {
                    var initialSelectedMajors = $('input[name="majors"]:checked').map(function () {
                        return $(this).val();
                    }).get();
                    $('#majorButton').text(initialSelectedMajors.length > 0 ? initialSelectedMajors.join(", ") : 'Choose major');

                    var initialSelectedLocations = $('input[name="locations"]:checked').map(function () {
                        return $(this).val();
                    }).get();
                    $('#locationButton').text(initialSelectedLocations.length > 0 ? initialSelectedLocations.join(", ") : 'Choose location');

                    var initialSelectedJobTypes = $('input[name="jobTypes"]:checked').map(function () {
                        return $(this).val();
                    }).get();
                    $('#jobTypeButton').text(initialSelectedJobTypes.length > 0 ? initialSelectedJobTypes.join(", ") : 'Choose job type');
                }

                $('#resetButton').click(function () {
                    $('input[type="checkbox"]').prop('checked', false);
                    $("#salary-slider").slider("values", [1000, 1000000]);
                    $("#minSalary").val(1000);
                    $("#maxSalary").val(1000000);
                    $("#salaryRange").text("1000 - 1000000");
                    updateInitialSelections();
                });
            });

            function toggleOptions(containerId) {
                var options = document.getElementById(containerId);
                if (options.style.display === 'none' || options.style.display === '') {
                    options.style.display = 'block';
                } else {
                    options.style.display = 'none';
                }
            }

            function updateSelected(id, buttonId) {
                var selected = [];
                $('input[name="' + id + '"]:checked').each(function () {
                    selected.push($(this).val());
                });
                $('#' + buttonId).text(selected.length > 0 ? selected.join(", ") : 'Choose ' + id);
            }

            function handleEnterKey(event, containerId) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    document.getElementById(containerId).style.display = 'none';
                }
            }

            function openModal() {
                document.getElementById('myModal').style.display = 'block';
            }

            function closeModal() {
                document.getElementById('myModal').style.display = 'none';
            }

            $(document).click(function (event) {
                var $target = $(event.target);
                if (!$target.closest('.modal-content, #filterButton').length) {
                    closeModal();
                }
            });
        </script>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <div class="frame-group">
                        <form action="SearchController?searchPost=true" method="post"">
                            <div class="search2">
                                <input placeholder="Search..." type="text" name="search">
                                <button type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                    <c:forEach items="${listq}" var="post" varStatus="status">
                        <c:if test="${status.index < 5}">
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
                                        <a  href="/postController?action=details&postId=${post.id}" class="register" style="text-decoration: none; color: white;"><div></div>Job details</a>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="pagination">
                    <ul class="oagination">
                        <c:if test="${tag > 1}">
                            <li class="page-item disabled"><a href="Home?index=${tag-1}">Previous</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${endP}" var="i">
                            <li class="page-item ${tag == i?"active":""}"><a  href="Home?index=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                            <c:if test="${tag < endP}">
                            <li class="page-item"><a href="Home?index=${tag+1}" class="page-link">Next</a></li>
                            </c:if>
                    </ul>
                </div>
                <div class="col-sm-2">

                </div>
            </div>

        </div>
    </div>
</body>
<style>
    /*Phan trang*/

    .pagination {
        display: flex;
        padding-left: 0;
        list-style: none;
        justify-content: space-around;
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
</html>
<%@include file="./Header/Footer.jsp" %>