<%-- 
    Document   : HomeAdmin
    Created on : Jul 21, 2024, 6:54:19 PM
    Author     : Nguyen Chi Cuong - CE171013
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>Post Management</title>
        <style>

            .chart {
                width: 50%;
            }
            .square {
                width: 400px; /* Điều chỉnh kích thước ô vuông */
                height: 200px; /* Điều chỉnh kích thước ô vuông */
                border: 1px solid #000;
                background-color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

            }

            .squareJob {
                width: 400px; /* Điều chỉnh kích thước ô vuông */
                height: 200px; /* Điều chỉnh kích thước ô vuông */
                border: 1px solid #000;
                background-color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .number {
                font-size: 1em;
                text-align: center;
            }

            .diagram {
                width: 100%; /* Đảm bảo canvas chiếm toàn bộ chiều rộng của phần tử chứa */
                height: 70%; /* Chiếm 50% chiều cao của thẻ div */
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .diagramJob {
                width: 100%; /* Đảm bảo canvas chiếm toàn bộ chiều rộng của phần tử chứa */
                height: 70%; /* Chiếm 50% chiều cao của thẻ div */
                display: flex;
                justify-content: center;
                align-items: center;
            }



            .info-container {
                width: 100%; /* Chiếm toàn bộ chiều rộng của phần tử chứa */
                display: flex;
                flex-direction: row-reverse;
            }

            .info-item {
                width: 100%; /* Chiếm toàn bộ chiều rộng của phần tử chứa */
                text-align: center;
                padding: 5px;
                box-sizing: border-box;
                border-top: 1px solid #ddd;
                background-color: #f9f9f9;
                /* Điều chỉnh padding và margin nếu cần thiết */
            }

            .info-item:first-child {
                border-top: none; /* Xóa border-top của phần tử đầu tiên */
            }
            .chat-icon {
                position: fixed;
                bottom: 20px;
                right: 20px;


                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;

                font-size: 1.5em;
            }

            .chat-popup {
                position: fixed;
                bottom: 90px;
                right: 100px;
                width: 350px;
                height: 450px;
                display: none;
                flex-direction: column;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                animation: slide-in 0.3s forwards;
            }

            @keyframes slide-in {
                from {
                    opacity: 0;
                    transform: translateY(100%);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .chat-container {
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
            }

            .chat-header {
                padding: 10px;
                background-color: #007bff;
                color: white;
                text-align: center;
                font-size: 1.2em;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .chat-header .close-btn {
                background: none;
                border: none;
                color: white;
                font-size: 1.5em;
                cursor: pointer;
            }

            .chat-messages {
                flex: 1;
                padding: 10px;
                overflow-y: auto;
                border-bottom: 1px solid #ccc;
            }

            .message {
                margin-bottom: 10px;
            }

            .message-user {
                font-weight: bold;
                color: #007bff;
            }

            .message-text {
                margin-left: 10px;
                background-color: #e9ecef;
                border-radius: 5px;
                padding: 5px;
            }

            .chat-input {
                display: flex;
                padding: 10px;
                border-top: 1px solid #ccc;
                background-color: #f9f9f9;
            }

            .chat-input input {
                flex: 1;
                border: 1px solid #ccc;
                border-radius: 20px;
                padding: 10px;
                margin-right: 10px;
            }

            .chat-input button {
                border: none;
                background-color: #007bff;
                color: white;
                border-radius: 50%;
                padding: 10px;
                cursor: pointer;
            }

            .chat-input button:hover {
                background-color: #0056b3;
            }
            .chat-ul {
                position: relative;
                display: flex;
                gap: 25px;
                margin-left: 75%;
            }

            .ling {
                position: relative;
                list-style: none;
                width: 60px;
                height: 60px;
                background: #fff;
                border-radius: 60px;
                cursor: pointer;
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                transition: 0.5s;
            }

            .ling:hover {
                width: 180px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0);
            }

            .ling::before {
                content: "";
                position: absolute;
                inset: 0;
                border-radius: 60px;
                background: linear-gradient(45deg, var(--i), var(--j));
                opacity: 0;
                transition: 0.5s;
            }

            .ling:hover::before {
                opacity: 1;
            }

            .ling::after {
                content: "";
                position: absolute;
                top: 10px;
                width: 100%;
                height: 100%;
                border-radius: 60px;
                background: linear-gradient(45deg, var(--i), var(--j));
                transition: 0.5s;
                filter: blur(15px);
                z-index: -1;
                opacity: 0;
            }

            .ling:hover::after {
                opacity: 0.5;
            }

            .ling .icon {
                color: #777;
                font-size: 1.75em;
                transition: 0.5s;
                transition-delay: 0.25s;
            }

            .ling:hover .icon {
                transform: scale(0);
                color: #fff;
                transition-delay: 0s;
            }

            .ling span {
                position: absolute;
            }

            .ling .title {
                color: #fff;
                font-size: 1.1em;
                text-transform: uppercase;
                letter-spacing: 0.1em;
                transform: scale(0);
                transition: 0.5s;
                transition-delay: 0s;
            }

            .ling:hover .title {
                transform: scale(1);
                transition-delay: 0.25s;
            }
            .container2 {
                max-width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: first;
                gap: 20px;
            }
            .chart-container2 {
                width: 50%;
            }
            .legend-container2 p {
                margin-top: 10px;
                font-size: 10px;

            }
            body {
                font-family: 'Roboto', sans-serif;

            }

            .custom-square {
                background-color: #ffffff; /* White background */
                border: 1px solid #cce7ff; /* Light blue border */
                border-radius: 10px;
                padding: 20px;
                margin-top: 2%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s;
                max-width: 300px;
                width: 100%;
            }

            .custom-square:hover {
                transform: translateY(-5px);
            }

            .custom-number {
                font-size: 1.5em;
                color: #007acc; /* Darker blue for the title */
                font-weight: bold;
                margin-bottom: 10px;
                text-align: center;
            }

            .custom-info p {
                font-size: 1.1em;
                color: #333; /* Dark gray for text */
                margin: 5px 0;
            }

            .highlight {
                color: #007acc; /* Darker blue for highlighted numbers */
                font-weight: bold;
                font-size: 1.2em;
            }

            .custom-square-job {
                background-color: #ffe4e1; /* Light pink background */
                border: 1px solid #ffb6c1; /* Light pink border */
                border-radius: 10px;
                padding: 20px;
                
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s;
                max-width: 300px;
                width: 100%;
            }

            .custom-square-job:hover {
                transform: translateY(-5px);
            }

            .custom-square-job p {
                font-size: 1.1em;
                color: #333; /* Dark gray for text */
                margin: 5px 0;
            }

            .highlight2 {
                color: #ff69b4; /* Hot pink for highlighted numbers */
                font-weight: bold;
                font-size: 1.2em;
            }



            .squareJob2 {

                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 2%;
            }

            .container2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: rgba(0, 0, 0, 0.7); /* Semi-transparent dark background */
                border: 1px solid #7a2d80; /* Dark purple border */
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.7);
                position: relative;
              
                width: 100%;
            }

            .chart-container2 {
                width: 50%;
            }

            .legend-container2 {
                width: 40%;
                font-size: 1.1em;
                color: #e0e0e0; /* Light gray for text */
            }

            .legend-container2 p {
                margin: 10px 0;
            }

            .particles {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                pointer-events: none;
                overflow: hidden;
                z-index: 1;
                background: transparent;
            }

            .particle {
                position: absolute;
                background: #ffffff;
                border-radius: 50%;
                opacity: 0.7;
                pointer-events: none;
                animation: fall linear infinite;
            }

            @keyframes fall {
                from {
                    transform: translateY(-100vh) scale(1);
                    opacity: 0.7;
                }
                to {
                    transform: translateY(100vh) scale(0);
                    opacity: 0;
                }
            }



            .white-blue-box {
                display: flex;
                flex-direction: column;
                align-items: center;
                background: #ffffff; /* White background */
                border: 1px solid #87CEEB; /* Light blue border */
                border-radius: 10px;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 400px;
                height: 200px;
                position: relative;
            }

            .title {
                font-size: 1.3em;
                color: #4682B4; /* Steel blue for the title */
                font-weight: bold;
                margin-bottom: 10px;
                text-align: center;
            }

            .chart-area {
                width: 100%;
                height: 100px; /* Adjust height for canvas */
                margin-bottom: 10px;
            }

            .details {
                font-size: 0.9em;
                color: #4682B4; /* Steel blue for details text */
                text-align: center;
            }

            .details p {
                margin: 5px 0;
            }


        </style>
    </head>
    <body >
        <div class="container"  style="margin-left: 10%; margin-top: 10%">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-md-8" >
                    <div class="Post" style="display: flex; justify-content: space-between">
                        <div class="white-blue-box">
                            <div class="title">Posts in 5 Days</div>
                            <div class="chart-area">
                                <canvas id="myChart"></canvas>
                            </div>
                            <div class="details">
                              
                            </div>
                        </div>
                        <div class="custom-square-job squareJob">
                            <p>Number of User: <span class="highlight2">${countUser}</span></p>
                            <p>Number of Company: <span class="highlight2">${countCompany}</span></p> 
                            <p>Number of Employee: <span class="highlight2">${countEmployee}</span></p>                         
                        </div>

                    </div>
                    <div class="Post" style="display: flex; justify-content: space-between">


                        <div class="custom-square square">
                            <div class="custom-number number">Apply Management</div>
                            <div class="custom-info info">
                                <p>CV Applied: <span class="highlight">${countApplied}</span></p>
                                <p>CV Accepted: <span class="highlight">${countAccepted}</span></p>
                                <p>CV Rejected: <span class="highlight">${countRejected}</span></p>
                            </div>
                        </div>

                        <div class="squareJob2" style="margin-top: 2%; ">
                            <div class="container2">
                                <div class="chart-container2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="legend-container2">
                                    <p>Top 1: ${nameOfTopMajor[0]}</p>
                                    <p>Top 2: ${nameOfTopMajor[1]}</p>
                                    <p>Top 3: ${nameOfTopMajor[2]}</p>
                                    <p>Top 4: ${nameOfTopMajor[3]}</p>
                                    <p>Top 5: ${nameOfTopMajor[4]}</p>
                                </div>
                            </div>         
                        </div>
                    </div>

                </div>

                <div class="chat-icon" onclick="toggleChat()">
                    <ul class="chat-ul">
                        <li style="--i:#56CCF2;--j:#2F80ED;" class="ling">
                            <span class="icon">💬</span>
                            <span class="title">Messages</span>
                        </li>
                    </ul>
                </div>
                <div class="chat-popup" id="chatPopup">
                    <div class="chat-container">
                        <div class="chat-header">
                            <h2>Chat Room</h2>
                        </div>
                        <div class="chat-messages">
                            <div class="message">
                                <div class="message-user">User 1:</div>
                                <div class="message-text">Hello, how are you?</div>
                            </div>
                            <div class="message">
                                <div class="message-user">User 2:</div>
                                <div class="message-text">I'm good, thanks! What about you?</div>
                            </div>
                            <!-- Thêm nhiều tin nhắn ở đây -->
                        </div>
                        <div class="chat-input">
                            <input type="text" placeholder="Type a message...">
                            <button>Send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // Biểu đồ đường
            const ctx1 = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx1, {
                type: 'line',
                data: {
                    labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
                    datasets: [{
                            label: 'Dữ liệu',
                            data: ${listPost5Day},
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 2,
                            fill: true
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            beginAtZero: true
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });


            function toggleChat() {
                var chatPopup = document.getElementById("chatPopup");
                if (chatPopup.style.display === "none" || chatPopup.style.display === "") {
                    chatPopup.style.display = "flex";
                } else {
                    chatPopup.style.display = "none";
                }
            }


            // Dữ liệu cho biểu đồ
            const data2 = {

                labels: ["Top 1", 'Top 2', 'Top 3', 'Top 4', 'Top 5'],
                datasets: [{
                        data: ${listTopMajor},
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)'
                        ],
                        borderWidth: 1
                    }]
            };

            // Tùy chọn cho biểu đồ
            const options = {
                responsive: true,
                plugins: {
                    legend: {
                        display: false // Ẩn chú thích mặc định
                    },
                    title: {
                        display: true,
                        text: 'Top 5 Ngành Nghề'
                    }
                }
            };

            // Tạo biểu đồ
            const ctx = document.getElementById('myPieChart').getContext('2d');
            const myPieChart = new Chart(ctx, {
                type: 'pie',
                data: data2,
                options: options
            });

            // Tạo chú thích tùy chỉnh
            const legendContainer = document.getElementById('chartLegend');
            data2.labels.forEach((label, index) => {
                const legendItem = document.createElement('li');
                legendItem.innerHTML = `<span style="background-color:${data.datasets[0].backgroundColor[index]}; display:inline-block; width:20px; height:20px; margin-right:5px;"></span>${label}`;
                legendContainer.appendChild(legendItem);
            });
            document.addEventListener('DOMContentLoaded', function () {
                const particlesContainer = document.querySelector('.particles');
                const numParticles = 100;

                for (let i = 0; i < numParticles; i++) {
                    const particle = document.createElement('div');
                    particle.classList.add('particle');
                    particlesContainer.appendChild(particle);

                    const size = Math.random() * 10 + 5;
                    const left = Math.random() * 100;
                    const duration = Math.random() * 5 + 3;

                    particle.style.width = `${size}px`;
                    particle.style.height = `${size}px`;
                    particle.style.left = `${left}%`;
                    particle.style.animationDuration = `${duration}s`;
                }
            });

        </script>

    </body>

</html>
