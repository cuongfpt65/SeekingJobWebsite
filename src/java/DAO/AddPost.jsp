<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Post</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Hàm chuyển đổi ngày từ dd/mm/yyyy sang yyyy-mm-dd
                function parseDate(date) {
                    var parts = date.split("/");
                    return new Date(parts[2], parts[1] - 1, parts[0]);
                }

                // Hàm kiểm tra xem ngày kết thúc có sớm hơn ngày bắt đầu không
                function isValidDateRange(start, end) {
                    return start <= end;
                }

                // Kiểm tra ngày khi người dùng nhấn nút submit
                $("form").submit(function (event) {
                    var startDateInput = $("input[name='start']").val();
                    var endDateInput = $("input[name='end']").val();
                    var startDate = parseDate(startDateInput);
                    var endDate = parseDate(endDateInput);

                    if (!isValidDateRange(startDate, endDate)) {
                        alert("End date cannot be earlier than start date. Please enter a valid date range.");
                        event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
                        $("input[name='end']").focus(); // Đặt con trỏ vào trường "End Date"
                    }
                });
            });
        </script>
    </head>
    <body>
        <form action="add" method="post">
            <td><button><a href="/postController?action= ///////" class="btn btn-success">Cancel</a></button></td>
            <table>
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" required></td>
                </tr>
                <tr>
                    <td>Company ID</td>
                    <td><input type="text" name="IdCompany" required></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><input type="text" name="salary" required></td>
                </tr>
                 <tr>
                <td>Time Posted</td>
                <td><input type="text" id="timePosted" name="timePosted" required></td>
            </tr>
                <tr>
                    <td>Start Date (dd/mm/yyyy)</td>
                    <td><input type="date" id="startDate" name="start" pattern="\d{2}/\d{2}/\d{4}" required></td>
                </tr>
                <tr>
                    <td>End Date (dd/mm/yyyy)</td>
                    <td><input type="date" id="endDate" name="end" pattern="\d{2}/\d{2}/\d{4}" required></td>
                </tr>
                <tr>
                    <td>Major</td>
                    <td><input type="text" name="major" required></td>
                </tr>
                <tr>
                    <td><button><a href="/postController?action= addDraft" class="btn btn-success">Draft</a></button></td>

                    <td><button><a href="/postController?action= ///////  add" class="btn btn-success">Post</a></button></td>


                </tr>

            </table>
        </form>
        <script>
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
        </script>

    </body>
</html>
