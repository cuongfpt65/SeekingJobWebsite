<%-- 
    Document   : listCompany
    Created on : Jul 24, 2024, 1:16:46 AM
    Author     : Nguyễn Văn Chiến-CE170237
--%>

<%@include file="./Header/HeaderCompany.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Post</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8" style="max-width: 70%; margin: 0 auto">
                    <form action="postController?id=${up.id}" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="updatePostDraft">
                        <table class="table table-borderless">
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
                                    <input type="file" name="image"class="form-control" onchange="readURL(this)" accept="image/gif, image/jpeg, image/png">    
                                    <input type="hidden" name="currentImage" id="currentImage" value="${fn:escapeXml(up.image)}">
                                </div>
                                <div class="container-4">
                                    <div class="mb-3">
                                        <label for="title" class="form-label">Title</label>
                                        <input value="${up.title}" type="text" name="title" required class="form-control">

                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" name="description"  id="description" class="editor-textarea form-label" placeholder="Type your description here...">${up.description}</textarea>

                                        <label for="salary" class="form-label">Salary</label>
                                        <input value="${up.salary}" type="text" name="salary" required class="form-control">
                                    </div>
                                    <input value="${up.timePosted}" type="hidden" id="timePosted" name="timePosted" readonly required class="form-control">
                                    <div class="post_2">
                                        <p>
                                            <label for="startDate" class="form-label">Start Date</label>
                                            <input value="${up.start}" type="date" id="startDate" name="start" required class="form-control">
                                        </p>
                                        <p>
                                            <label for="endDate" class="form-label">End Date</label>
                                            <input value="${up.end}" type="date" id="endDate" name="end" required class="form-control">
                                        </p>
                                    </div>
                                    <div class="mb-3">
                                        <label for="major" class="form-label">Major</label>
                                        <select name="major" id="major" required class="form-select">
                                            <option >${up.major}</option>
                                            <option value="Kỹ thuật phần mềm" >Kỹ thuật phần mềm</option>
                                            <option value="Trí tuệ nhân tạo">Trí tuệ nhân tạo</option>
                                            <option value="Thiết kế kỹ thuật số">Thiết kế kỹ thuật số</option>
                                            <option value="An toàn thông tin">An toàn thông tin</option>
                                            <option value="Công nghệ ô tô">Công nghệ ô tô</option>
                                            <option value="Thiết kế vi mạnh bán dẫn">Thiết kế vi mạnh bán đẫn</option>
                                            <option value="Ngôn ngữ Anh">Ngô ngữ anh</option>
                                            <option value="Ngôn ngữ Hàn">Ngô ngữ Hàn</option>
                                            <option value="Ngôn ngữ Trung">Ngô ngữ Trung</option>
                                            <option value="Ngô ngữ Nhật">Ngôn ngữ Nhật</option>
                                            <option value="Quản trị kinh doanh">Quản trị kinh doanh</option>
                                            <option value="Quản trị du lịch và lữ hành">Quản trị du lịch và lữ hành</option>
                                            <option value="Kinh doanh quốc tế">Kinh doanh quốc tế</option>
                                            <option value="Quản trị nhà hàng khách sạn">Quản trị nhà hàng khách sạn</option>
                                            <option value="LOGISTICS">LOGISTICS</option>
                                            <option value="Công nghệ truyền thông">Công nghệ truyền thông</option>
                                            <option value="Quan hệ công chúng">Quan hệ Công Chúng</option>
                                        </select>
                                    </div>
                                    <div class="post_2">
                                        <p>
                                            <label for="jobTypes" class="form-label">Job Types</label>
                                            <select name="jobTypes" id="jobTypes" required class="form-select">
                                                <option >${up.jobTypes}</option>
                                                <option value="Fulltime">Full time</option>
                                                <option value="Partime">Part time</option>
                                                <option value="Intern">Intern</option>
                                                <option value="Freelancer">Freelancer</option>
                                            </select>
                                        </p>
                                        <p>
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
                                        </p>
                                    </div>
                                    <tr class="post_2">
                                    <div class="button">
                                        <button  onclick="cancel('${postD.id}')" class="btn btn-danger">Cancel</button>
                                        <button type="submit" class="btn btn-primary btn-black-text">Update</button>    
                                    </div>
                                    </tr>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
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
                        var imagePreview = document.getElementById('imagePreview');
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = 'block';
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
            function cancel(up) {
                if (confirm('Are you sure you want to Cancel this post?')) {
                    window.location.href = '/postController?action=detailDraftPC&postId=' + up;
                }
            }

// Giữ nguyên hình ảnh hiện tại nếu không có hình ảnh mới được chọn
            document.querySelector('form').addEventListener('submit', function (event) {
                var imageInput = document.querySelector('input[name="image"]');
                if (!imageInput.files.length) {
                    // Không chọn tệp mới, giữ nguyên giá trị hiện tại
                    var currentImage = document.getElementById('currentImage').value;
                    var hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'image';
                    hiddenInput.value = currentImage;
                    document.querySelector('form').appendChild(hiddenInput);
                }
            });

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
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .button{
                display: flex;
                justify-content: space-around;
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
                width: 100%; /* hoặc thiết lập chiều rộng cụ thể như 340px */
                height: 100%; /* hoặc thiết lập chiều cao cụ thể như 236px */
                object-fit: cover; /* Đảm bảo ảnh giữ nguyên tỷ lệ và lấp đầy khung */
                border-radius: 8px; /* Giữ viền tròn */
            }
            .card-body {
                background-color: #f8f9fa;
                border-radius: 5px;
                padding: 20px;
                display: flex;
                justify-content: space-around;
            }
            .im{
                margin: 10px;
            }
            .post_2{
                display: flex;
                justify-content: space-between;
            }
            .editor-textarea {
                width: 100%;
                padding: 10px;
                resize: none;
                height: 100px;
                box-sizing: border-box;
                font-size: 14px;

            }
            .im-t{
                margin-top: 110px;
                margin-bottom: 1rem;
                max-width: 83%;
            }

        </style>
    </body>
</html>
<%@include file="./Header/Footer.jsp" %>
