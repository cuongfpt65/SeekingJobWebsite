

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@include file="./Header/HeaderEmployee.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of CVs</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1>List of CVs</h1>
            <a href="cv-employee?action=upload" class="btn btn-success btn-sm">Add new</a>
            <table class="table table-striped mt-4">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                         <th scope="col">Download</th>
                        <th scope="col">File Name</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cv" items="${cvList}">
                        <tr>
                            <td>${cv.id}</td>
                            <td>
                                <a download href="${cv.fileName}">Download</a>
                            </td>
                            <td>
                                <img src="${cv.fileName}" width="50px" height="50px"/>
                            </td>
                            <td>
                                <a href="cv-employee?id=${cv.id}&action=edit" class="btn btn-primary btn-sm">Edit</a>
                                <a onclick="return confirm('Are you sure to delete?')" href="cv-employee?id=${cv.id}&action=delete" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${cvList.size() == 0}">
                        <tr>
                            <td colspan="10" class="text-center">No have cv</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
<%@include file="./Header/Footer.jsp" %>