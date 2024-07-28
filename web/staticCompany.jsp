<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./Header/HeaderCompany.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Static</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
        <style>

            .menu {
                display: flex;
                position: relative;
            }

            .menu button {
                background: none;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 18px;
                color: black;
                transition: all 0.3s ease;
                position: relative;
            }

            .menu button:hover {
                color: orange; /* màu xanh trắng */
                font-size: 20px; /* chữ bự lên */
            }

            .menu button.selected {
                color: #00bfff; /* màu xanh trắng */
            }

            .menu button.selected::after {
                content: '';
                position: absolute;
                left: 0;
                bottom: 0;
                width: 100%;
                height: 4px;
                background: linear-gradient(to right, orange, white);
            }

            .underline {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 4px;
                background: linear-gradient(to right, orange, white);
                transition: left 0.3s ease, width 0.3s ease;
            }

            /*design for Applied*/

            .stat-container {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }
            .stat {
                text-align: center;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 10px;
                width: 150px;
            }
            .stat h2 {
                margin: 0;
                font-size: 2em;
            }
            .stat p {
                margin: 5px 0 0;
                font-size: 1.2em;
            }
            .red {
                background-color: #ffcccc;
            }
            .yellow-green {
                background-color: #ffffcc;
            }
            .green {
                background-color: #ccffcc;
            }
            .chart-container {
                width: 400px;
                margin: 50px auto;
            }
            .hidden {
                display: none;
            }
        </style>

    </style>
</head>
<body>

    <div class="container">
        <div class="row row1">
            <div class="col-sm-2"></div>
            <div class="col-md-8">
                <div class="menu">
                    <button class="menu-item selected" onclick="selectButton(this, 'Post')">Post</button>
                    <button class="menu-item" onclick="selectButton(this, 'Applied')">Applied</button>

                    <div class="underline"></div>
                </div>

            </div>
        </div>
        <div class="row row2">
            <div class="col-sm-2"></div>
            <div class="col-md-8">
                <h1 style="text-align:  center">Static Post</h1>
                <canvas id="lineChart" width="100" height="50"></canvas>
            </div>
        </div>
        <div class="row row3">
            <div class="col-sm-2">

            </div>
            <div class="col-md-8">
                <h1> Top view Post: </h1><h1 style="color: greenyellow"> ${topView.viewPost}</h1>
                <a href="/postController?action=details&postId=${topView.id}">Link post</a>

            </div>
            <div class="col-ms-2"></div>
        </div>
        <div class="row row4 hidden" >
            <div class="col-ms-2"></div>
            <div class="col-md-8"style="margin: 0 auto">
                <h1>Statics Apply</h1>
                <div class="stat-container">
                    <div class="stat">
                        <h2 id="totalCV">0</h2>
                        <p>Applied</p>
                    </div>
                    <div class="stat">
                        <h2 id="acceptedCV">0</h2>
                        <p>Accepted</p>
                    </div>
                    <div class="stat">
                        <h2 id="rejectedCV">0</h2>
                        <p>Rejected</p>
                    </div>
                    <div class="stat" id="acceptRateStat">
                        <h2 id="acceptRate">0%</h2>
                        <p>Accept per Applied</p>
                    </div>
                </div>
                <div class="chart-container">
                    <canvas id="cvChart"></canvas>
                </div>
            </div>
            <div class="col-ms-2"></div>
        </div>

    </div>




    <script>
        function selectButton(button, section) {
            // Đổi class 'selected' cho các nút menu
            const buttons = document.querySelectorAll('.menu-item');
            buttons.forEach(btn => btn.classList.remove('selected'));
            button.classList.add('selected');

            // Hiển thị hoặc ẩn các hàng dựa trên nút đã chọn
            if (section === 'Post') {

                document.querySelector('.row2').classList.remove('hidden');
                document.querySelector('.row3').classList.remove('hidden');
                document.querySelector('.row4').classList.add('hidden');
            } else if (section === 'Applied') {

                document.querySelector('.row2').classList.add('hidden');
                document.querySelector('.row3').classList.add('hidden');
                document.querySelector('.row4').classList.remove('hidden');
            }
            buttons.forEach(btn => btn.classList.remove('selected'));
            button.classList.add('selected');
            const buttonRect = button.getBoundingClientRect();
            const menuRect = button.parentElement.getBoundingClientRect();
            underline.style.left = (buttonRect.left - menuRect.left) + 'px';
            underline.style.width = buttonRect.width + 'px';

        }
        // Lấy dữ liệu từ Servlet
        const dataPoints = <%= request.getAttribute("dataPoints") %>;

        // Kiểm tra nếu có dữ liệu thì mới vẽ biểu đồ
        if (dataPoints && dataPoints.length > 0) {
            // Tạo biểu đồ đường sử dụng Chart.js
            const ctx = document.getElementById('lineChart').getContext('2d');
            const lineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'], // Nhãn trục X
                    datasets: [{
                            label: 'Number of posts of 7 day',
                            data: dataPoints,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1,
                            fill: false
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        } else {
            // Ẩn biểu đồ nếu không có dữ liệu
            document.getElementById('lineChart').style.display = 'none';
        }


        //menu
        const buttons = document.querySelectorAll('.menu button');
        const underline = document.querySelector('.underline');


        // Mặc định chọn button đầu tiên
        window.onload = () => {
            selectButton(document.querySelector('.menu button.selected'));
        };


        //for Applied

        let totalCV = ${countApply};
        let acceptedCV = ${countAcceptApply};
        let rejectedCV = ${countRejectApply};

        // Tính tỷ lệ chấp nhận
        let acceptRate = (acceptedCV / totalCV) * 100;

        // Cập nhật dữ liệu lên trang
        document.getElementById('totalCV').innerText = totalCV;
        document.getElementById('acceptedCV').innerText = acceptedCV;
        document.getElementById('rejectedCV').innerText = rejectedCV;
        document.getElementById('acceptRate').innerText = acceptRate.toFixed(2) + '%';

        // Thay đổi màu sắc dựa trên tỷ lệ chấp nhận
        let acceptRateStat = document.getElementById('acceptRateStat');
        if (acceptRate < 50) {
            acceptRateStat.classList.add('red');
        } else if (acceptRate >= 50 && acceptRate < 80) {
            acceptRateStat.classList.add('yellow-green');
        } else {
            acceptRateStat.classList.add('green');
        }

        // Tạo biểu đồ tròn
        const ctx = document.getElementById('cvChart').getContext('2d');
        const cvChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Accepted', 'Rejected'],
                datasets: [{
                        data: [acceptedCV, rejectedCV],
                        backgroundColor: ['#ccffcc', '#ffcccc'],
                        borderColor: ['#99cc99', '#cc9999'],
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function (tooltipItem) {
                                let label = tooltipItem.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += tooltipItem.raw;
                                return label;
                            }
                        }
                    }
                }
            }
        });
    </script>


</body>
</html>
