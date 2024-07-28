<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Post" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <div class="navbar">
            <a href="home.jsp">Home</a>
            <a href="CreateController">Create Post</a>
            <a href="#">Post a Job</a>
            <a href="employeeProfile">Employee</a>
            <a href="CompanyController?action=listCompany">Company</a>
              <div class="button1">
                        <div class="primary">
                            <a href="LogoutController"> Sign out</a>  
                        </div>
                    </div>
        </div>



        <div class="container">
            <!-- Header with Filter Button and Search Form -->
            <div class="header">
                <button id="filterButton" onclick="openModal()">Filter Search</button>
                <form action="SearchController" method="post" class="search-form" style="flex-grow: 1; display: flex; justify-content: flex-end; margin-left: 20px;">
                    <input type="text" name="searchQuery" placeholder="Enter search term..." style="margin-right: 10px;">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>

            <!-- Filter Modal -->
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
            <div class="container">
                <h1>List of Posts</h1>
                <c:forEach items="${jobPosts}" var="post">
                    <a class="post-item" href="/postController?action=details&postId=${post.id}">
                        <h2>${post.title}</h2>
                        <p><strong>Company ID:</strong> ${post.idCompany}</p>
                        <p><strong>Salary:</strong> ${post.salary}</p>
                        <p><strong>Start Date:</strong> ${post.start}</p>
                        <p><strong>End Date:</strong> ${post.end}</p>
                    </a>
                </c:forEach>
            </div>
        </div>

    </body>
</html>
