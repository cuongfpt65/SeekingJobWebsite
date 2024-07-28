<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Static Cv employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
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
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Th?ng kê CV</h1>
    <div class="stat-container">
        <div class="stat">
            <h2 id="totalCV">0</h2>
            <p>S? CV g?i v?</p>
        </div>
        <div class="stat">
            <h2 id="acceptedCV">0</h2>
            <p>S? CV ?ã ch?p nh?n</p>
        </div>
        <div class="stat">
            <h2 id="rejectedCV">0</h2>
            <p>S? CV ?ã t? ch?i</p>
        </div>
        <div class="stat" id="acceptRateStat">
            <h2 id="acceptRate">0%</h2>
            <p>T? l? ch?p nh?n</p>
        </div>
    </div>
    <div class="chart-container">
        <canvas id="cvChart"></canvas>
    </div>

    <script>
        // D? li?u m?u
        let totalCV = 120;
        let acceptedCV = 30;
        let rejectedCV = 90;

        // Tính t? l? ch?p nh?n
        let acceptRate = (acceptedCV / totalCV) * 100;

        // C?p nh?t d? li?u lên trang
        document.getElementById('totalCV').innerText = totalCV;
        document.getElementById('acceptedCV').innerText = acceptedCV;
        document.getElementById('rejectedCV').innerText = rejectedCV;
        document.getElementById('acceptRate').innerText = acceptRate.toFixed(2) + '%';

        // Thay ??i màu s?c d?a trên t? l? ch?p nh?n
        let acceptRateStat = document.getElementById('acceptRateStat');
        if (acceptRate < 50) {
            acceptRateStat.classList.add('red');
        } else if (acceptRate >= 50 && acceptRate < 80) {
            acceptRateStat.classList.add('yellow-green');
        } else {
            acceptRateStat.classList.add('green');
        }

        // T?o bi?u ?? tròn
        const ctx = document.getElementById('cvChart').getContext('2d');
        const cvChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Ch?p nh?n', 'T? ch?i'],
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
                            label: function(tooltipItem) {
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
