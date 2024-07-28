

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Company Information</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <%@include file="./Header/HeaderEmployee.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Edit CV</h1>
            <form action="cv-employee" method="post" enctype="multipart/form-data" class="mt-4">
                <div class="form-group">
                    <input type="hidden" class="form-control-file" id="cvId" name="cvId" required value="${cv.id}">
                    <label for="cvUpload">Upload CV:</label>
                    <input type="file" class="form-control-file" id="cvUpload" name="cvUpload">
                    <input type="hidden" class="form-control-file" id="oldCV" name="oldCV" value="${cv.fileName}" required>
                </div>
                <div class="form-group">
                    <label for="cvUpload">CV old:</label><br>
                    <img src="${cv.fileName}" width="200px" height="200px" alt="alt"/> 
                </div>
              
                <button type="submit"  name="action" value="edit" class="btn btn-primary">Update</button>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
<%@include file="./Header/Footer.jsp" %>