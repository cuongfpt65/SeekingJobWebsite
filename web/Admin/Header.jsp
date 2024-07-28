
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">

<link rel="icon" href="img/image 1.png" type="image/png">
<style>
    .link {
        color: #007bff;
        text-decoration: none;
        transition: all 0.3s;
    }
    .link:hover {
        background-color: #007bff;
        color: white;
        font-size: 1.1rem;
    }
    .heading {
        background: linear-gradient(90deg, #007bff 0%, #00d4ff 100%);
        color: white;
        padding: 1rem 0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
    }
    .logo{
        margin: 0 auto;
    }
    .asiding {
        width: 250px;
        background-color: #f8f9fa;
        height: calc(100vh - 70px); /* Adjust based on header height */
        padding: 1rem;
        position: fixed;
        top: 70px; /* Adjust based on header height */
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }
    .custom-nav {
        list-style-type: none; /* Lo?i b? d?u ch?m ??u dòng */
        padding: 0;
        margin: 0;
        background-color: #f8f9fa; /* Màu n?n c?a danh sách */
        border-radius: 8px; /* Bo góc */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* ?? bóng */
    }

    .custom-nav-item {
        position: relative; /* ?? con menu có th? ??t chính xác */
    }

    .custom-nav-link {
        display: block;
        padding: 10px 20px;
        color: #333; /* Màu ch? */
        text-decoration: none; /* B? g?ch chân */
        border-bottom: 1px solid #ddd; /* ???ng phân cách gi?a các m?c */
    }

    .custom-nav-link:hover {
        background-color: #e9ecef; /* Màu n?n khi hover */
        color: #007bff; /* Màu ch? khi hover */
    }

    .custom-nav-link.active {
        background-color: #007bff; /* Màu n?n c?a m?c hi?n t?i */
        color: #fff; /* Màu ch? c?a m?c hi?n t?i */
        border-bottom: none; /* B? ???ng phân cách d??i m?c hi?n t?i */
    }

    .sub-nav {
        list-style-type: none; /* Lo?i b? d?u ch?m ??u dòng */
        padding: 0;
        margin: 0;
        max-height: 0; /* ?n menu con */
        overflow: hidden; /* ?n các ph?n v??t ra ngoài kh?i */
        transition: max-height 0.3s ease; /* Hi?u ?ng chuy?n ??i */
        background-color: #e9ecef; /* Màu n?n c?a menu con */
        border-radius: 4px; /* Bo góc cho menu con */
    }

    .sub-nav.show {
        max-height: 200px; /* ??t chi?u cao t?i ?a cho menu con khi hi?n th? */
    }

    .sub-nav .custom-nav-item {
        border-bottom: 1px solid #ddd; /* ???ng phân cách gi?a các m?c con */
    }

    .sub-nav .custom-nav-item:last-child {
        border-bottom: none; /* B? ???ng phân cách d??i m?c con cu?i cùng */
    }
    .dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #fff;
        min-width: 160px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
        border-radius: 3px;
    }

    .dropdown-content a {
        color: #333;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        border-bottom: 1px solid #f1f1f1;
    }

    .dropdown-content a:last-child {
        border-bottom: none;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .account-dropdown:hover .dropdown-content {
        display: block;
    }
    .column1h {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        gap: 16px;
    }

</style>

<div class="heading">
    <div class="container d-flex align-items-center justify-content-between">
        <div class="logo" >
            <h1 >Admin Management</h1>
        </div>
        <div class="column1h">
            <div class="account-dropdown">
                <a href="#" class="buttonh">
                    <span class="account-text" style="margin-right: 10px;">${br.nameCompany}</span>
                    <i class="fas fa-user-circle"></i>
                </a>
                <div class="dropdown-content">               
                    <a href="/LogoutController">Logout</a>

                </div>
            </div>
        </div>

    </div>
</div>
<aside class="asiding">
    <ul class="custom-nav">
        <li class="custom-nav-item">
            <a class="custom-nav-link" href="${pageContext.request.contextPath}/">Dashboard</a>
        </li>
        <li class="custom-nav-item">
            <a class="custom-nav-link" href="${pageContext.request.contextPath}/AdminController?action=PostManagement">Post Management</a>
        </li>
        <li class="custom-nav-item">
            <a class="custom-nav-link" href="#" id="accountManagement">Account Management</a>
            <ul class="sub-nav">
                <li class="custom-nav-item">
                    <a class="custom-nav-link" href="${pageContext.request.contextPath}/AdminController?action=CompanyManagement">Company Management</a>
                </li>
                <li class="custom-nav-item">
                    <a class="custom-nav-link" href="${pageContext.request.contextPath}/AdminController?action=EmployeeManagement">Employee Management</a>
                </li>
            </ul>
        </li>

    </ul>

    <script>
        document.getElementById('accountManagement').addEventListener('click', function (event) {
            event.preventDefault();
            var subNav = this.nextElementSibling;
            if (subNav.classList.contains('show')) {
                subNav.classList.remove('show');
            } else {
                document.querySelectorAll('.sub-nav').forEach(function (nav) {
                    nav.classList.remove('show');
                });
                subNav.classList.add('show');
            }
        });

    </script>

</aside>


