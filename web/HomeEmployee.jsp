<%-- 
    Document   : HomeEmployee
    Created on : Jul 24, 2024, 12:45:31 AM
    Author     : Trần Tấn Lợi-CE171879
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./Header/HeaderEmployee.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <link rel="stylesheet" href="./Css/home.css" />
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
            .side-bar-banner{
                height: 1686px;
            }

        </style>
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
        <div class="home" style="height: 2117px;">
            <div class="search">
                <div class="group-parent">
                    <div class="group">
                        <img class="group-child" alt="" src="Frame 2.png">
                    </div>
                    <div class="group-item">
                    </div>
                </div>
                <div class="frame-parent">
                    <div class="find-your-new-job-today-parent">
                        <b class="find-your-new-container">
                            <span>Find your </span>
                            <span class="new-job">new job</span>
                            <span> today</span>
                        </b>
                        <div class="thousands-of-jobs">Thousands of jobs in the computer, engineering and technology sectors are waiting for you.</div>
                    </div>

                </div>
            </div>

            <div class="side-bar-cars-banner">
                <div class="side-bar-banner">
                    <div class="side-bar">

                        <button id="filterButton" onclick="openModal()">Filter Search</button>
                        <form action="SearchController" method="post"">
                            <input  class="search-job" type="text" name="searchQuery" placeholder="Enter search term..." style="margin-right: 10px;">
                            <input type="submit" name="submit" value="Search">
                        </form>
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close" onclick="closeModal()">&times;</span>
                                <form action="SearchController" method="post" class="form-container">
                                    <label><strong>Location</strong></label>
                                    <div class="relative-position">
                                        <button type="button" id="locationButton" onclick="toggleOptions('location-options-container')">Choose location</button>
                                        <div id="location-options-container" class="options-container hidden-options">
                                            <c:forEach var="location" items="${locations}">
                                                <input type="checkbox" id="${location}" name="locations" value="${location}" onclick="updateSelected('locations', 'locationButton')" onkeypress="handleEnterKey(event, 'location-options-container')">
                                                <label for="${location}">${location}</label><br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <label><strong>Major</strong></label>
                                    <div class="relative-position">
                                        <button type="button" id="majorButton" onclick="toggleOptions('options-container')">Choose major</button>
                                        <div id="options-container" class="options-container hidden-options">
                                            <c:forEach var="major" items="${majors}">
                                                <input type="checkbox" id="${major}" name="majors" value="${major}" onclick="updateSelected('majors', 'majorButton')" onkeypress="handleEnterKey(event, 'options-container')">
                                                <label for="${major}">${major}</label><br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <label><strong>Type of job</strong></label>
                                    <div class="relative-position">
                                        <button type="button" id="jobTypeButton" onclick="toggleOptions('job-type-options-container')">Choose job type</button>
                                        <div id="job-type-options-container" class="options-container hidden-options">
                                            <c:forEach var="jobType" items="${jobTypes}">
                                                <input type="checkbox" id="${jobType}" name="jobTypes" value="${jobType}" onclick="updateSelected('jobTypes', 'jobTypeButton')" onkeypress="handleEnterKey(event, 'job-type-options-container')">
                                                <label for="${jobType}">${jobType}</label><br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="slider-container">
                                        <label for="salary"><strong>Salary range</strong></label>
                                        <div id="salary-slider"></div>
                                        <p id="salaryRange"></p>
                                        <input type="hidden" id="minSalary" name="minSalary">
                                        <input type="hidden" id="maxSalary" name="maxSalary">
                                    </div>
                                    <div>
                                        <input type="submit" value="Search">
                                        <button type="button" id="resetButton">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="img-parent">
                        <img class="img-icon" alt="" src="img/anh.png" style="top: 20px; left: -20px">
                        <div class="we-are-hiring">We are hiring</div>
                        <div class="apply-today">Apply Today!</div>
                    </div>
                </div>

                <div class="cards1">

                    <div class="cards2">
                        <c:forEach items="${listpost}" var="post" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <div class="card4">
                                    <div class="textbadge-icon">
                                        <div class="logo-text">
                                            <img class="icon" alt="" src="${post.image}">
                                            <div class="textinput">
                                                <div class="location">  ${post.title}</div>
                                                <div class="armstrong-ohara-and">  ${post.description}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="icons-text-buttton">
                                        <div class="icons-text">
                                            <div class="map-pin-parent">
                                                <img class="briefcase2-2-icon" alt="" src="img/briefcase 2.svg">
                                                <div class="location">${post.major}</div>
                                            </div>
                                            <div class="map-pin-parent">
                                                <img class="briefcase2-2-icon" alt="" src="img/clock.svg">
                                                <div class="location">${post.jobTypes}</div>
                                            </div>
                                            <div class="map-pin-parent">
                                                <img class="g135-icon" alt="" src="img/g135.svg">
                                                <div class="location">${post.salary}/Month</div>
                                            </div>
                                            <div class="map-pin-parent">
                                                <img class="briefcase2-2-icon" alt="" src="img/map-pin.svg">
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
                </div>
            </div>

    
        </div>

    </body>
</html>

<%@include file="./Header/Footer.jsp" %>