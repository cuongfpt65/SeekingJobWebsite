
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update CV</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <%@include file="./Header/HeaderEmployee.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Upload new CV</h1>
            <form action="cv-employee" method="post" enctype="multipart/form-data"  class="mt-4" >
                <div class="form-group">
                    <label for="cvUpload">Upload CV:</label>
                    <input type="file" name="cvUpload" class="form-control" onchange="readURL(this)" accept=".pdf">
                </div>
                <input type="hidden" class="form-control-file"  name="action" value="upload" required>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    <script>
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
</html>
<%@include file="./Header/Footer.jsp" %>