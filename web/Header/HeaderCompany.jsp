
<style>
    body {
        margin: 0;
        font-family: 'DM Sans', sans-serif;
        background-color: #f5f5f5;
    }

    .frame-child1 {
        width: 29px;
        height: 29px;
    }

    .namless1 {
        line-height: 150%;
        margin: 0;
    }

    .group-parent1 {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
        gap: 12px;
        font-size: 24px;
    }

    .columnh {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        justify-content: flex-start;
        gap: 48px;
    }

    .log-in {
        line-height: 150%;
        font-weight: 500;
    }

    .buttonh, .button1h {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        padding: 8px 20px;
        text-decoration: none;
        color: #141414;
        transition: all 0.3s ease-in-out; /* Added transition effects */
    }

    .buttonh {
        box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.03);
        border-radius: 6px;
        background-color: #fff;
        border: 1px solid rgba(20, 20, 20, 0.1);
    }

    .button1h {
        border-radius: 4px;
        background-color: #3575e2;
        color: #fff;
    }

    .buttonh:hover {
        background-color: #f0f0f0; /* Light gray on hover */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Larger shadow on hover */
        transform: translateY(-2px); /* Slight lift effect */
    }

    .button1h:hover {
        background-color: #285bb5; /* Darker blue on hover */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Larger shadow on hover */
        transform: translateY(-2px); /* Slight lift effect */
    }

    .column1h {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        gap: 16px;
    }

    .container1 {
        width: 100%;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .navbar1 {
        width: 100%;
        position: -webkit-sticky; /* For Safari */
        position: sticky;
        top: 0;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        background-color: #fff;
        height: 72px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 0px 64px;
        box-sizing: border-box;
        text-align: left;
        font-size: 7px;
        color: #141414;
        font-family: 'DM Sans';
        z-index: 1000; /* Ensure the navbar stays on top of other content */
    }

    .nav-link {
        text-decoration: none;
        color: #141414;
        font-weight: 500;
        position: relative;
        overflow: hidden;
        transition: color 0.3s ease-in-out; /* Added transition effects */
    }

    .nav-link::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -2px;
        width: 100%;
        height: 2px;
        background-color: #3575e2;
        transform: scaleX(0);
        transform-origin: right;
        transition: transform 0.3s ease-in-out;
    }

    .nav-link:hover {
        color: #3575e2;
    }

    .nav-link:hover::after {
        transform: scaleX(1);
        transform-origin: left;
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


</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link

    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=DM Sans:wght@400;500;700&display=swap"
    />
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Abel:wght@400&display=swap"
    />
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
    />
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Lexend:wght@600&display=swap"
    />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="navbar1">
    <div class="container1">
        <div class="group-parent1">
            <img
                class="frame-child1"
                loading="lazy"
                alt=""
                src="img/Group 3.svg"
                />

            <h3 class="namless1">SeekingJobWebsite</h3>
        </div>
        <nav class="columnh">
            <a href="Home" class="nav-link">Home</a>
            <a href="/postController?action=" class="nav-link">Draft Post</a>
            <a href="/postController?action=loadCreatePost" class="nav-link ">Create Post</a>
            <a href="ApplyController?action=listApply" class="nav-link ">List CV</a>
            <a href="StaticController" class="nav-link">Static</a>
            <a href="AboutUsCompany.jsp" class="nav-link ">About</a>
            <a href="ContactCompany.jsp" class="nav-link ">Contact</a>

        </nav>
        <div class="column1h">
            <div class="account-dropdown">
                <a href="#" class="buttonh">
                    <span class="account-text" style="margin-right: 10px;">${br.nameCompany}</span>
                    <i class="fas fa-user-circle"></i>
                </a>
                <div class="dropdown-content">
                    <a href="CompanyController?action=profileCompany">Profile</a>
                    <a href="CompanyController?action=listUp">Update Profile</a>
                    <a href="/LogoutController">Logout</a>

                </div>
            </div>
        </div>
    </div>
</header>
