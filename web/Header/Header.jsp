
<link rel="stylesheet" href="./Css/MenuAndFooter.css" />
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
            margin-left: -55px;
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
        font-size: 16px;
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


</style>

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
            <a href="CompanyController?action=listCompany" class="nav-link ">Company</a>
            <a href="AboutUs.jsp" class="nav-link ">About</a>
            <a href="Contact.jsp" class="nav-link ">Contact</a>
        </nav>
        <div class="column1h">
            <a href="Login.jsp" class="buttonh">
                <div class="log-in">Log in</div>
            </a>
            <a href="/RegisterController" class="button1h">
                <div class="sign-up">Sign up</div>
            </a>
        </div>
    </div>
</header>
