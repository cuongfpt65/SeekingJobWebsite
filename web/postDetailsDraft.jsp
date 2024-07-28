<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Details Draft </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <button><a href="/postController?action=//// cancel" class="btn btn-success">Cancel</a></button>
            <c:forEach items="${postDD}" var="pdd">
                <h1>${pdd.title}</h1>
                <p><strong>Company ID:</strong> ${pdd.idCompany}</p>
                <p><strong>Salary:</strong> ${pdd.salary}</p>
                <p><strong>Time Posted:</strong> ${pdd.timePosted}</p>
                <p><strong>Start Date:</strong> ${pdd.start}</p>
                <p><strong>End Date:</strong> ${pdd.end}</p>
                <p><strong>Major:</strong> ${pdd.major}</p>
                
                <button><a href="/postController?action= ///////  add" class="btn btn-success">Post</a></button>
                <button><a href="/postController?action=deleteDraft" class="btn btn-info">Delete</a></button>

            </c:forEach>
        </div>

    </body>
</html>
