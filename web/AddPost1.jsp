
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Post</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <form action="postController" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                        <table class="table table-borderless">
                            <h3 class="addPost">Create Post</h3>
                            <div class="card-body">
                                <div class="im">
                                    <div class="post-image" style="position: relative;">
                                        <img type="text" id="imagePreview" src="${fn:escapeXml(up.image)}" style="display: ${fn:escapeXml(up.image != null ? 'block' : 'none')}; position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: 1;">
                                        <svg class="image-icon" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" fill="none" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 0;">
                                        <path d="M32 32L24 24L16 32" stroke="#ADB2BA" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M24 24V42" stroke="#ADB2BA" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M40.7828 36.7809C42.7335 35.7175 44.2745 34.0347 45.1626 31.9982C46.0507 29.9617 46.2353 27.6874 45.6873 25.5343C45.1392 23.3812 43.8898 21.472 42.1362 20.1078C40.3826 18.7437 38.2246 18.0024 36.0028 18.0009H33.4829C32.8775 15.6594 31.7492 13.4856 30.1827 11.6429C28.6163 9.80025 26.6525 8.33664 24.439 7.36216C22.2256 6.38767 19.82 5.92766 17.4031 6.01671C14.9862 6.10576 12.621 6.74154 10.4852 7.87628C8.34942 9.01101 6.49867 10.6152 5.07209 12.5681C3.64552 14.5211 2.68023 16.772 2.24881 19.1517C1.81739 21.5314 1.93106 23.978 2.58128 26.3075C3.23149 28.6369 4.40133 30.7887 6.00285 32.6009" stroke="#ADB2BA" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M32 32L24 24L16 32" stroke="#ADB2BA" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                        <p class="im-t">Bannar images optical dimension 16:9 Supported format JPEG, PNG, GIF. </p>

                                    </div>

                                    <input type="file" name="image" class="form-control" onchange="readURL(this)" accept="image/gif, image/jpeg, image/png">
                                </div>
                                <div>
                                    <div class="mb-3">
                                        <label for="title" class="form-label">Title</label>
                                        <input type="text" name="title"  class="form-control">

                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" name="description"  id="description" class="editor-textarea form-label" placeholder="Type your description here..."></textarea>

                                        <label for="salary" class="form-label">Salary</label>
                                        <input type="text" name="salary"  class="form-control">

                                        <input type="hidden" id="timePosted" name="timePosted" readonly  class="form-control">
                                    </div>


                                    <div class="post_2">
                                        <div class="jt">
                                            <label for="startDate" class="form-label">Start Date</label>
                                            <input type="date" id="startDate" name="start"  class="form-control">
                                        </div>
                                        <div>
                                            <label for="endDate" class="form-label">End Date</label>
                                            <input type="date" id="endDate" name="end"  class="form-control">
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div>
                                            <label for="major" class="form-label">Major</label>
                                            <select name="major" id="major" required class="form-select">
                                                <option value="">Select Major</option>
                                                <option value="Software Engineering">Software Engineering</option>
                                                <option value="Artificial Intelligence">Artificial Intelligence</option>
                                                <option value="Digital Design">Digital Design</option>
                                                <option value="Information Security">Information Security</option>
                                                <option value="Automotive Technology">Automotive Technology</option>
                                                <option value="Semiconductor Design">Semiconductor Design</option>
                                                <option value="English Language">English Language</option>
                                                <option value="Korean Language">Korean Language</option>
                                                <option value="Chinese Language">Chinese Language</option>
                                                <option value="Japanese Language">Japanese Language</option>
                                                <option value="Business Administration">Business Administration</option>
                                                <option value="Tourism and Travel Management">Tourism and Travel Management</option>
                                                <option value="International Business">International Business</option>
                                                <option value="Hotel and Restaurant Management">Hotel and Restaurant Management</option>
                                                <option value="Logistics">Logistics</option>
                                                <option value="Communication Technology">Communication Technology</option>
                                                <option value="Public Relations">Public Relations</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="post_2">
                                        <div class="jt">
                                            <label for="jobTypes" class="form-label">Job Types</label>
                                            <select name="jobTypes" id="jobTypes"  class="form-select">
                                                <option value="">Select Job Types</option>
                                                <option value="Fulltime">Full time</option>
                                                <option value="Partime">Part time</option>
                                                <option value="Intern">Intern</option>
                                                <option value="Freelancer">Freelancer</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="location" class="form-label">Location</label>
                                            <select name="location" id="location"  class="form-select">
                                                <option value="">Select Location</option>
                                                <option value="An Giang">An Giang</option>
                                                <option value="Bến Tre">Bến Tre</option>
                                                <option value="Cần Thơ">Cần Thơ</option>
                                                <option value="Đồng Tháp">Đồng Tháp</option>
                                                <option value="Hậu Giang">Hậu Giang</option>
                                                <option value="Kiên Giang">Kiên Giang</option>
                                                <option value="Long An">Long An</option>
                                                <option value="Sóc Trăng">Sóc Trăng</option>
                                                <option value="Tiền Giang">Tiền Giang</option>
                                                <option value="Trà Vinh">Trà Vinh</option>
                                                <option value="Vĩnh Long">Vĩnh Long</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <tr class="button">
                                    <td>
                                        <button class="btn btn-custom cancel-btn">
                                            <a href="/Home">Cancel</a>
                                        </button>
                                    </td>
                                    <td>
                                        <button type="submit" name="action" value="addDraft" class="btn btn-custom draft-btn">
                                            Draft
                                        </button>
                                    </td>
                                    <td>
                                        <button type="submit" name="action" value="addPost" class="btn btn-custom post-btn">
                                            Post
                                        </button>
                                    </td>
                                </tr>
                            </div>
                        </table>
                    </form>
                </div>

            </div>
        </div>
        <script>
            //Thông báo rổng và check ngày
            function validateForm() {
                var fields = ["image", "title", "description", "salary", "start", "end", "major", "jobTypes", "location"];
                var fieldNames = {
                    "image": "Image",
                    "title": "Title",
                    "description": "Description",
                    "salary": "Salary",
                    "start": "Start Date",
                    "end": "End Date",
                    "major": "Major",
                    "jobTypes": "Job Types",
                    "location": "Location"
                };

                var action = document.activeElement.getAttribute('value'); // Get the value of the clicked button

                if (action === "addPost") {
                    for (var i = 0; i < fields.length; i++) {
                        var fieldValue = document.getElementsByName(fields[i])[0].value;
                        if (fieldValue.trim() === "") {
                            alert("Please fill in the " + fieldNames[fields[i]] + " field.");
                            return false;
                        }
                    }

                    var currentDate = new Date();
                    var startDate = new Date(document.getElementsByName('start')[0].value);
                    var endDate = new Date(document.getElementsByName('end')[0].value);

                    // Kiểm tra nếu startDate nhỏ hơn currentDate
                    if (startDate.setHours(0, 0, 0, 0) < currentDate.setHours(0, 0, 0, 0)) {
                        alert("Start date cannot be earlier than today's date.");
                        return false;
                    }

                    if (startDate >= endDate) {
                        alert("Start date must be before end date. Please enter a valid date range.");
                        return false;
                    }
                }
                if (action === "addDraft") {
                    var fieldValue = document.getElementsByName("title")[0].value;
                    if (fieldValue.trim() === "") {
                        alert("Please fill in the Title field.");
                        return false;
                    }
                }

                return true;
            }



            //
            $('input[name="salary"]').on('blur', function () {
                var salaryValue = $(this).val().trim();
                if (salaryValue !== '') {
                    salaryValue = salaryValue.replace(/[^\d.]/g, '');
                    var parts = salaryValue.split('.');
                    var integerPart = parseInt(parts[0]);

                    if (integerPart < 1) {
                        $(this).val('');
                        alert('Salary must be greater than or equal to 1.');
                    } else {
                        var decimalPart = parts.length > 1 ? '.' + parts[1] : '';
                        integerPart = integerPart.toLocaleString('en-US');
                        var formattedSalary = '$' + integerPart + decimalPart;
                        $(this).val(formattedSalary);
                    }
                }
            });



            $(document).ready(function () {
                function setDefaultDate(inputId, offsetDays = 0) {
                    var dateInput = document.getElementById(inputId);
                    var today = new Date();
                    today.setDate(today.getDate() + offsetDays);
                    var year = today.getFullYear();
                    var month = ('0' + (today.getMonth() + 1)).slice(-2);
                    var day = ('0' + today.getDate()).slice(-2);
                    var formattedDate = year + '-' + month + '-' + day;
                    dateInput.value = formattedDate;
                }
                setDefaultDate('startDate');
                setDefaultDate('endDate', 7);

                function fillCurrentTime() {
                    var currentTime = new Date();
                    var year = currentTime.getFullYear();
                    var month = ('0' + (currentTime.getMonth() + 1)).slice(-2);
                    var day = ('0' + currentTime.getDate()).slice(-2);
                    var hours = ('0' + currentTime.getHours()).slice(-2);
                    var minutes = ('0' + currentTime.getMinutes()).slice(-2);
                    var seconds = ('0' + currentTime.getSeconds()).slice(-2);
                    var formattedDateTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                    document.getElementById('timePosted').value = formattedDateTime;
                }
                fillCurrentTime();

                $('input[name="salary"]').on('blur', function () {
                    var salaryValue = $(this).val().trim();
                    if (salaryValue !== '') {
                        salaryValue = salaryValue.replace(/[^\d.]/g, '');
                        var parts = salaryValue.split('.');
                        var integerPart = parts[0];
                        var decimalPart = parts.length > 1 ? '.' + parts[1] : '';
                        integerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                        var formattedSalary = '$' + integerPart + decimalPart;
                        $(this).val(formattedSalary);
                    }
                });

                $('input[name="salary"]').on('input', function () {
                    $(this).val($(this).val().replace(/[^\d.]/g, ''));
                });
            });

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').attr('src', e.target.result);
                        $('#imagePreview').show();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $(document).ready(function () {
                $('.post-image').on('click', function () {
                    $('input[name="image"]').click();
                });
            });
            document.addEventListener('keydown', function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    validateForm();
                    return false;
                }
            });


        </script>
        <style>
            .post_2{
                display: flex;
                justify-content: flex-start;
            }
            .card-body{
                display: flex;
                justify-content: center;
                align-items: flex-start;
                gap: 32px;
            }
            .btn{
                border-radius: 4px;
                background: var(--Gray-50, #F1F2F4);
            }
            .im-t{
                margin-top: 110px;
                margin-bottom: 1rem;
                max-width: 83%;
            }
            .jt{
                margin-right: 100px;
            }
            .post_2{
                display: flex;
                justify-content: flex-start;
            }
            .btn-black-text {
                color: black !important;
            }
            .post-image {
                width: 100%; /* Ensure the image takes the full width of the container */
                max-width: 340px; /* Set a maximum width */
                height: 236px; /* Maintain aspect ratio */
                border: 2px dashed rgba(200, 204, 209, 0.70);
                border-radius: 8px;
                background: rgba(241, 242, 244, 0.40);
                overflow: hidden; /* Hide any overflow */
                display: flex;
                justify-content: center;
                align-items: center;




            }

            .post-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 8px;
            }

            .col-sm-8 {
                margin-top: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .menu {
                height: 200px;
                background: red;
            }

            .editor-textarea {
                width: 100%;
                padding: 10px;
                resize: none;
                height: 100px;
                box-sizing: border-box;
                font-size: 14px;

            }
            .button{
                display: flex;
                justify-content: space-between;
            }
            .button {
                text-align: center; /* Căn giữa các nút trong bảng */
            }

            .btn-custom {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s, transform 0.3s;
                color: white;
                background-color: #007bff; /* Màu nền mặc định */
            }

            .btn-custom a {
                color: white;
                text-decoration: none;
            }

            .btn-custom:hover {
                transform: scale(1.05);
            }

            .btn-custom:active {
                transform: scale(0.98);
                background-color: inherit; /* Giữ màu nền không thay đổi khi nhấn */
            }

            .cancel-btn {
                background-color: #dc3545; /* Màu đỏ cho Cancel */
            }

            .draft-btn {
                background-color: #ffc107; /* Màu vàng cho Draft */
            }

            .post-btn {
                background-color: #28a745; /* Màu xanh lá cho Post */
            }
        </style>
    </body>
</html>
<%@include file="./Header/Footer.jsp" %>