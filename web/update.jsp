<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Draft Post</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <form action="postController?oldImage=${up.image}" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="update">
                        <table class="table table-borderless">
                            <div class="card-body">
                                <div class="mb-3">

                                    <div class="post-image">
                                        <img id="imagePreview" src="/imgs/room/${up.image}" style="display: ${fn:escapeXml(up.image != null ? 'block' : 'none')};">
                                    </div>
                                    <label for="image" class="form-label">Image</label>
                                    <input type="file"  name="image" id="fileInput" class="form-control" onchange="readURL(this)" accept="image/gif, image/jpeg, image/png"    >
                                </div>
                                <div class="mb-3">
                                    <label for="id" class="form-label">ID Post</label>
                                    <input value="${up.id}" type="text" name="id" readonly required class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title</label>
                                    <input value="${up.title}" type="text" name="title" required class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <input value="${up.description}" type="text" name="description" required class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="salary" class="form-label">Salary</label>
                                    <input value="${up.salary}" type="text" name="salary" required class="form-control">
                                </div>
                                <input value="${up.timePosted}" type="hidden" id="timePosted" name="timePosted" readonly required class="form-control">
                                <div class="post_2">
                                    <div class="jt">
                                        <label for="startDate" class="form-label">Start Date</label>
                                        <input value="${up.start}" type="date" id="startDate" name="start" required class="form-control">
                                    </div>
                                    <div>
                                        <label for="endDate" class="form-label">End Date</label>
                                        <input value="${up.end}" type="date" id="endDate" name="end" required class="form-control">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="major" class="form-label">Major</label>
                                    <select name="major" id="major" required class="form-select">
                                        <option >${up.major}</option>
                                        
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
                                <div class="post_2">
                                    <div class="jt">
                                        <label for="jobTypes" class="form-label">Job Types</label>
                                        <select name="jobTypes" id="jobTypes" required class="form-select">
                                            <option >${up.jobTypes}</option>
                                            <option value="Fulltime">Full time</option>
                                            <option value="Partime">Part time</option>
                                            <option value="Intern">Intern</option>
                                            <option value="Freelancer">Freelancer</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label for="location" class="form-label">Location</label>
                                        <select name="location" id="location" required class="form-select">
                                            <option >${up.location}</option>
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
                                <tr>
                                    <td><button type="submit" class="btn btn-primary btn-black-text">Update</button></td>
                                    <td><button class="btn btn-success"><a href="/Home" class="btn btn-success">Cancel</a></button></td>
                                </tr>
                            </div>
                        </table>
                    </form>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        <script>
           

            function validateForm() {
                var fields = ["id", "title", "description", "salary", "start", "end", "major", "jobTypes", "location"];
                for (var i = 0; i < fields.length; i++) {
                    var fieldValue = document.getElementsByName(fields[i])[0].value;
                    if (fieldValue.trim() === "") {
                        alert("Please fill in all fields.");
                        return false;
                    }
                }
                return true;
            }

            $(document).ready(function () {
                $("form").submit(function (event) {
                    if (!validateForm()) {
                        event.preventDefault();
                    }
                });
            });

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

            $(document).ready(function () {
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

        </script>
        <style>
            .col-sm-8 {
                display: block;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-decoration: none;
                color: #333;
                transition: background-color 0.3s ease;
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
            .card-body {
                background-color: #f8f9fa;
                border-radius: 5px;
                padding: 20px;
            }

        </style>
    </body>
</html>


</html>
