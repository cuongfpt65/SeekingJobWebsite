<%-- 
    Document   : AboutUs
    Created on : Jul 24, 2024, 3:03:59 PM
    Author     : Trần Tấn Lợi-CE171879
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./Header/HeaderEmployee.jsp" %>
<link rel="stylesheet" href="./Css/about.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="stylesheet" href="./Css/home.css" />
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
        <style>.img-icon {
                width: 306px;
                position: relative;
                border-radius: 20px;
                height: 560px;
                overflow: hidden;
                flex-shrink: 0;
                object-fit: cover;
            }
            .img-icon1a {

                position: relative;
                border-radius: 20px;

                overflow: hidden;
                flex-shrink: 0;
                object-fit: cover;
            }
            .img-icon2 {
                width: 306px;
                position: relative;
                border-radius: 20px;
                height: 268px;
                overflow: hidden;
                flex-shrink: 0;
                object-fit: cover;
            }
            .imgs1 {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .imgs {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .were-only-working {
                margin: 0;
            }
            .were-only-working-container {
                position: relative;
            }
            .ultricies-purus-dolor {
                width: 600px;
                position: relative;
                font-size: 16px;
                line-height: 24px;
                color: rgba(0, 0, 0, 0.8);
                display: -webkit-inline-box;
                overflow: hidden;
                text-overflow: ellipsis;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
            }
            .were-only-working-with-the-be-parent {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 40px;
            }
            .text {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
            }
            .icon-text-child, .icon-text-item {
                width: 60px;
                height: 60px;
                border-radius: 8px;
                overflow: hidden;
                flex-shrink: 0;
                object-fit: cover;
                background-color: #e0f7fa; /* Light blue background */
                transition: transform 0.3s ease, filter 0.3s ease, background-color 0.3s ease;
            }

            .icon-texta {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .row {
                display: flex;
                flex-direction: column;
                gap: 32px;
            }

            .icon-texta:hover .icon-text-child,
            .icon-texta:hover .icon-text-item {
                transform: scale(1.1);
                filter: brightness(1) grayscale(0);
                background-color: #b2ebf2; /* Slightly darker blue on hover */
            }


            .icons-text {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 40px;
                font-size: 20px;
            }
            .text-iconsa {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;
                gap: 40px;
            }
            .excellence1-1-icon {
                width: 515.4px;
                position: relative;
                height: 515.4px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .info-block-2 {
                top: 10px;
                width: 100%;
                position: relative;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                padding: 60px 72px;
                box-sizing: border-box;
                gap: 64px;
                text-align: left;
                font-size: 24px;
                color: #000;
                font-family: 'Abhaya Libre ExtraBold';
            }

        </style>
    </head>
    <body>

        <div class="about-us1">
            <section class="info-block">
                <div class="texta">
                    <h1 class="et-nunc-ut">What about this website?</h1>
                    <div class="nunc-sed-a-nisl-purus-nibh-di-wrapper">
                        <div class="nunc-sed-a">
                            Job search websites provide a connection platform between employers and candidates, helping job seekers easily find and apply for jobs that suit their needs and skills. With thousands of jobs constantly updated, the website is a useful tool for anyone looking for new career opportunities.
                        </div>
                    </div>
                </div>
                <img class="img-icon1a" loading="lazy" alt="" src="./img/about.png" />
            </section>
            <section class="how-it-works">
                <div class="text1a">
                    <h1 class="how-it-works1">How it works</h1>
                    <div class="at-eu-lobortis-container">
                        <p class="at-eu-lobortis">
                        </p>
                        <p class="lectus-dolor-blandit">
                           
                        </p>
                    </div>
                </div>
                <footer class="cardsa">
                    <div class="carda">
                        <div class="icon-bga">
                            <img
                                class="account2-1-icon"
                                loading="lazy"
                                alt="Create Account Icon"
                                src="img/accountblue.svg"
                                />
                        </div>
                        <div class="text2a">
                            <div class="create-account">Sign Up</div>
                            <div class="nunc-sed-a1">
                                Sign up to track applications, save resumes, and get tailored job recommendations.
                            </div>
                        </div>
                    </div>
                    <div class="carda">
                        <div class="icon-bga">
                            <img
                                class="account2-1-icon"
                                loading="lazy"
                                alt="Create Account Icon"
                                src="img/cv.svg"
                                />
                        </div>
                        <div class="text2a">
                            <div class="create-account">Upload Resume</div>
                            <div class="nunc-sed-a1">
                                Upload your resume to showcase your skills and boost your job search.
                            </div>
                        </div>
                    </div>
                    <div class="carda">
                        <div class="icon-bga">
                            <img
                                class="account2-1-icon"
                                loading="lazy"
                                alt="Create Account Icon"
                                src="img/tui.svg"
                                />
                        </div>
                        <div class="text2a">
                            <div class="create-account">Find Jobs</div>
                            <div class="nunc-sed-a1">
                                Discover job opportunities that match your skills and interests.
                            </div>
                        </div>
                    </div>
                    <div class="carda">
                        <div class="icon-bga">
                            <img
                                class="account2-1-icon"
                                loading="lazy"
                                alt="Create Account Icon"
                                src="img/check.svg"
                                />
                        </div>
                        <div class="text2a">
                            <div class="create-account">Apply for Jobs</div>
                            <div class="nunc-sed-a1">
                                Follow our guide to submit a standout job application.
                            </div>
                        </div>
                    </div>


                </footer>
            </section>

        </div>
        <div class="info-block-2">
            <div class="imgs">
                <img class="img-icon" alt="" src="img/anh1.png">
                <div class="imgs1">

                    <img class="img-icon2" alt="" src="img/anh2.png">
                    <img class="img-icon2" alt="" src="img/anh3.png">

                </div>
            </div>
            <div class="text-iconsa">
                <div class="text">
                    <div class="text">
                        <div class="were-only-working-with-the-be-parent">
                            <div class="were-only-working-container">
                                <p class="were-only-working">We’re Only Working </p>
                                <p class="were-only-working">With The Best</p>
                            </div>
                            <div class="ultricies-purus-dolor">Safety - Quality - Fast </div>
                        </div>
                    </div>
                </div>
                <div class="icons-texta" style="
                     display: inline-flex;
                     ">
                    <div class="row">
                        <div class="icon-texta">
                            <img class="icon-text-child" alt="" src="img/pr.svg">
                            <div class="were-only-working-container"> Quality Job</div>
                        </div>
                        <div class="icon-texta">
                            <img class="icon-text-item" alt="" src="img/quality-assurance 1.svg">
                            <div class="were-only-working-container">Top Companies</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="icon-texta">
                            <img class="icon-text-child" alt="" src="img/re.svg">
                            <div class="were-only-working-container">Resume builder</div>
                        </div>
                        <div class="icon-texta">
                            <img class="icon-text-item" alt="" src="img/ex.svg">
                            <div class="were-only-working-container">Top Talents</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </body>
</html>
<%@include file="./Header/Footer.jsp" %>