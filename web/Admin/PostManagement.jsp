
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post Management</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="style/PostManagement.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .navbar {
                background-color: #007bff;
            }
            .navbar-brand {
                color: #fff !important;
            }
            .card-header {
                background-color: #007bff;
                color: #fff;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .listPost{
                margin-top: 10%;
                margin-left: 20%;
            }


            .modal2 {
                display: none;
                position: fixed;
                z-index: 1;

                width: 50%;
                height: 50%;
                overflow: auto;
                margin-top: 15% ;
                margin-left: 25%;

            }

            .modal-content2 {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }
            .close2 {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close2:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>


        <div class="container mt-4" >
            <div class="listPost">

                <div class="row mb-3">
                    <div class="col">
                        <div data-toggle="modal" data-target="#reviewModal">
                            <button class="continue-application">
                                <div>
                                    <div class="pencil"></div>
                                    <div class="folder">
                                        <div class="top">
                                            <svg viewBox="0 0 24 27">
                                            <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                                            </svg>
                                        </div>
                                        <div class="paper"></div>
                                    </div>
                                </div>
                                Check Post
                            </button>

                        </div>
                    </div>

                    <div class="col">

                        <input type="text" oninput="SearchByAjax(this)" class="form-control" id="searchInput" placeholder="Search jobs...">

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                Job List
                            </div>

                            <div class="card-body">
                                <ul class="list-group" id="jobList">
                                    <c:forEach var="job" items="${jobs}" varStatus="status">
                                        <li class="list-group-item">
                                            <h5>${job.title}</h5>
                                            <p>Author: ${listNameCompany[status.index]}</p>
                                            <p>Overview: ${job.description}</p>
                                            <div class="d-flex justify-content-end">
                                                <button class="btn btn-sm btn-secondary mr-2" onclick="showModal('${job.id}')">Hide</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteJob('${job.id}')">Delete</button>


                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Review Modal -->
            <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="reviewModalLabel">Review Posts</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <c:if test="${checking!=null}">
                                <ul class="list-group" id="reviewList">                              
                                <c:forEach var="post" items="${checking}" varStatus="sta">
                                    <li class="list-group-item">
                                        <h5>${post.title}</h5>
                                        <p>Author: ${nameCompanyChecking[sta.index]}</p>
                                        <p>${post.description}</p>
                                        <div class="d-flex justify-content-end">
                                            <form action="AdminController?Id=${post.id}" method="Post">
                                                <button name="status" value="approve" class="btn btn-sm btn-success mr-2" onclick=" approvePost('${post.id}')">Approve</button>
                                                <button name="status" value="reject" class="btn btn-sm btn-danger" onclick="rejectPost('${post.id}')">Reject</button>
                                            </form>

                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            </c:if>
                            <c:if test="${checking==null}">
                                <p>Not any post need Approve</p>
                            </c:if>
                            
                        </div>
                        <ul id="content">

                        </ul>
                    </div>
                </div>
            </div>

            <!-- Hiden -->
            <div id="myModal" class="modal modal2">
                <div class="modal-content modal-content2">
                    <span class="close close2" onclick="closeModal()">&times;</span>
                    <p>Are you sure you want to hiden?</p>
                    <form action="AdminController" method="Post">
                        <input type="hidden" name="Id" id="jobId">
                        <button name="status" value="hide"  >Confirm</button>
                    </form>
                    <button onclick="closeModal()">Cancel</button>
                </div>
            </div>

            <!--Delete -->
            <div id="myDelete" class="modal modal2">
                <div class="modal-content modal-content2">
                    <span class="close close2" onclick="closeModal()">&times;</span>
                    <p>Are you sure you want to delete?</p>
                    <form action="AdminController" method="Post">
                        <input type="hidden" name="Id" id="jobIdDetete">

                        <button name="status" value="delete"  >Confirm</button>
                    </form>
                    <button onclick="closeModal()">Cancel</button>
                </div>
            </div>

        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <script>

                        function showModal(id) {
                            document.getElementById("myModal").style.display = "block";
                            document.getElementById("jobId").value = id;
                        }
                        function deleteJob(id) {
                            document.getElementById("myDelete").style.display = "block";

                            document.getElementById("jobIdDetete").value = id;
                            // Logic to delete the job can be added here
                        }

                        function approvePost(id) {
                            var txt = "Post with id: " + id + " approved";
                            alert(txt);
                         
                          
                            // Logic to approve the post can be added here
                        }

                        function rejectPost(id) {
                            var txt = "Post with id: " + id + " be deleted";
                            alert(txt);
                            // Logic to reject the post can be added here
                        }
                        // ?óng popup
                        function closeModal() {
                            document.getElementById("myModal").style.display = "none";
                            document.getElementById("myDelete").style.display = "none";
                        }



                        // ?óng popup khi nh?n bên ngoài modal
                        window.onclick = function (event) {
                            if (event.target === document.getElementById("myModal") || event.target === document.getElementById("myDelete")) {
                                closeModal();
                            }
                        }

                        function SearchByAjax(p) {

                            var txtSearch = p.value;

                            $.ajax({

                                url: "./SearchAjax",
                                type: "get",
                                data: {
                                    txt: txtSearch

                                },
                                success: function (data) {
                                    var row = document.getElementById("jobList");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                }

                            }
                            );

                        }

                   
        </script>
    </body>
</html>
