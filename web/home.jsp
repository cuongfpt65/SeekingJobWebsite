<%-- 
    Document   : Home
    Created on : Jul 23, 2024, 2:32:55 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./Header/Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./Css/home.css" />
        <style>.paginationa {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
     margin: 18px -128px
}

.paginationa .page-item {
    margin: 0 5px;
}

.paginationa .page-item a {
    display: block;
    padding: 10px 15px;
    color: #007bff;
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.paginationa .page-item a:hover {
    background-color: #007bff;
    color: #fff;
}

.paginationa .page-item.disabled a {
    color: #6c757d;
    background-color: #e9ecef;
    border-color: #dee2e6;
    pointer-events: none;
}

.paginationa .page-item.active a {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
</style>
    </head>
    <body>
        <div class="home" style="height: 2117px;">
            <div class="search">
                <div class="group-parent">
                    <div class="group">
                        <img class="group-child" alt="" src="Frame 2.png">
                    </div>
                    <div class="group-item">
                    </div>
                </div>
                <div class="frame-parent">
                    <div class="find-your-new-job-today-parent">
                        <b class="find-your-new-container">
                            <span>Find your </span>
                            <span class="new-job">new job</span>
                            <span> today</span>
                        </b>
                        <div class="thousands-of-jobs">Thousands of jobs in the computer, engineering and technology sectors are waiting for you.</div>
                    </div>
                    <div class="frame-group">
                        <form action="SearchController" method="post"">
                            <div class="search2">
                                <input placeholder="Search..." type="text" name="searchQuery">
                                <button type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="side-bar-cars-banner">
            <div class="side-bar-banner">

            </div>

            <div class="cards1">

                <div class="cards2">
                    <c:forEach items="${listqq}" var="post" varStatus="status">
                       
                            <div class="card4" style="width: 760px">

                                <div class="textbadge-icon">
                                    <div class="logo-text">
                                        <img class="icon" alt="" src="${post.image}">
                                        <div class="textinput">
                                            <div class="location">  ${post.title}</div>
                                            <div class="armstrong-ohara-and">  ${post.description}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="icons-text-buttton">
                                    <div class="icons-text">
                                        <div class="map-pin-parent">
                                            <img class="briefcase2-2-icon" alt="" src="img/briefcase 2.svg">
                                            <div class="location">${post.major}</div>
                                        </div>
                                        <div class="map-pin-parent">
                                            <img class="briefcase2-2-icon" alt="" src="img/clock.svg">
                                            <div class="location">${post.jobTypes}</div>
                                        </div>
                                        <div class="map-pin-parent">
                                            <img class="g135-icon" alt="" src="img/g135.svg">
                                            <div class="location">${post.salary}/Month</div>
                                        </div>
                                        <div class="map-pin-parent">
                                            <img class="briefcase2-2-icon" alt="" src="img/map-pin.svg">
                                            <div class="location">${post.location}</div>
                                        </div>
                                    </div>
                                    <a href="/postController?action=details&postId=${post.id}" class="button2">
                                        <div class="register">Job details</div>
                                    </a>
                                </div>

                            </div>

                      
                    </c:forEach>
                </div>
                <div class="paginationa">
                        <ul class="paginationa">
                            <c:if test="${tag > 1}">
                                <li class="page-item disabled"><a href="Home?index=${tag-1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item ${tag == i?"active":""}"><a  href="Home?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag < endP}">
                                <li class="page-item"><a href="Home?index=${tag+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
            </div>
            
        </div>

    </div>

</body>
<script>
    function toggleMoreCategories() {
        var moreCategories = document.getElementById("more-categories");
        if (moreCategories.style.display === "none") {
            moreCategories.style.display = "block";
        } else {
            moreCategories.style.display = "none";
        }
    }
</script>
</html>
<%@include file="./Header/Footer.jsp" %>