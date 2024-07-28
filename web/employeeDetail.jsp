<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <style>
       
            .profile {
                width: 70%;
                background-color: white;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                padding: 20px;
            }
            .profile h1 {
                text-align: center;
                text-transform: uppercase;
                font-size: 28px;
                color: #333;
                margin-bottom: 20px;
            }
            .section {
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                background: linear-gradient(to bottom, #ffffff, #f0f8ff);
            }
            .section h2 {
                text-transform: uppercase;
                font-size: 20px;
                color: #2c3e50;
                margin-bottom: 10px;
            }
            .section p {
                margin: 8px 0;
                font-size: 16px;
            }
            .highlight {
                font-weight: bold;
                color: #2c3e50;
            }
            .highlight-phone {
                font-weight: bold;
                color: #e74c3c;
            }
            a {
                color: #2c3e50;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body >
        

        <div class="profile" style="max-width: 50%; text-align: center; margin: 3% auto">
            <h1>Profile</h1>

            <div class="section">
                <h2>Base</h2>
                <p><strong class="highlight">Full Name:</strong> ${seeprofile.lastName} ${seeprofile.firstName}</p>
                <p><strong>Day of Birth:</strong> ${seeprofile.dob}</p>
                <p><strong>Gender:</strong> ${seeprofile.gender}</p>
            </div>

            <div class="section">
                <h2>Major</h2>
                <p><strong class="highlight">Major:</strong> ${seeprofile.major}</p>
                <p><strong>Academic:</strong> ${seeprofile.academic}</p>
            </div>

            <div class="section">
                <h2>Contact</h2>
                <p><strong>Email:</strong> <a href="mailto:${seeprofile.email}">${seeprofile.email}</a></p>
                <p><strong class="highlight-phone">Phone contact:</strong> <a href="tel:${seeprofile.phone}">${seeprofile.phone}</a></p>
            </div>
        </div>

    </body>
</html>
