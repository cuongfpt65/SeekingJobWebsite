<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Details</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2ad4b7c07493dab1c0ef139f1087f2766cdd33fd
            <c:forEach items="${postD}" var="post">
                <h1>${post.title}</h1>
                <p><strong>Id:</strong> ${post.id}</p>
                <p><strong>Company ID:</strong> <a <link rel="stylesheet" href="url">  ${post.idCompany} </a></p> 
<<<<<<< HEAD
=======
=======
            <button><a href="/postController?action= cancel" class="btn btn-info">Cancel</a></button>
            <c:forEach items="${postD}" var="post">
                <h1>${post.title}</h1>
                <p><strong>Company ID:</strong> ${post.idCompany}</p>
>>>>>>> afbe72abc743a92e73350a2a1c5ba532499ee510
>>>>>>> 2ad4b7c07493dab1c0ef139f1087f2766cdd33fd
                <p><strong>Salary:</strong> ${post.salary}</p>
                <p><strong>Time Posted:</strong> ${post.timePosted}</p>
                <p><strong>Start Date:</strong> ${post.start}</p>
                <p><strong>End Date:</strong> ${post.end}</p>
                <p><strong>Major:</strong> ${post.major}</p>
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 2ad4b7c07493dab1c0ef139f1087f2766cdd33fd
                <p><strong>Job Types: </strong> ${post.jobTypes}</p>
                <p><strong>Location: </strong> ${post.location}</p>
                
                <button><a href="/postController?action=applyJob&postId=${post.id}" class="btn btn-info">Apply Job</a></button>

                <button><a href="/postController?action=updatePost&postId=${post.id}" class="btn btn-info">Update</a></button>

                <button><a href="/postController?action=deletePost&postId=${post.id}" class="text-light">Delete</a></button>
            </c:forEach>
<<<<<<< HEAD
=======
=======
            </c:forEach>
            <button><a href="/postController?action=update" class="btn btn-info">Update</a></button>
            <button><a href="/postController?action=delete" class="btn btn-info">Delete</a></button>
            
>>>>>>> afbe72abc743a92e73350a2a1c5ba532499ee510
>>>>>>> 2ad4b7c07493dab1c0ef139f1087f2766cdd33fd
        </div>

    </body>
</html>
