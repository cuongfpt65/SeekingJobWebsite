<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Static Admin </title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Number of account: ${countAccount}</h1>
    
    <!-- Đoạn mã để vẽ biểu đồ -->
    <canvas id="postChart" width="400" height="200"></canvas>
    
    <script>
        var countPosts = ${countPost}; // Giả sử countPost là một mảng JavaScript được truyền từ JSP

        var labels = []; // Mảng chứa tên của các post
        var data = []; // Mảng chứa số lượng bài đăng

        // Lặp qua mảng countPosts để tạo dữ liệu cho biểu đồ
        countPosts.forEach(function(post, index) {
            labels.push("Day " + (index + 1));
            data.push(post);
        });

        // Tạo context để vẽ biểu đồ trong canvas
        var ctx = document.getElementById('postChart').getContext('2d');

        // Tìm giá trị cao nhất trong mảng data
        var maxData = Math.max(...data);
        var minData = Math.min(...data);

        // Tạo mảng màu sắc cho các cột
        var backgroundColors = data.map(function(post) {
            if (post === maxData) {
                return 'green'; // Màu đỏ cho cột cao nhất
            } else if (post === minData){
                return 'red'; 
            }
            
        else {
                return 'rgba(54, 162, 235, 0.5)'; // Màu mặc định cho các cột khác
            }
        });

        // Tạo biểu đồ dạng bar chart
        var postChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Number of Posts',
                    data: data,
                    backgroundColor: backgroundColors,
                    borderColor: 'rgba(54, 162, 235, 1)', // Màu viền của cột
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true // Bắt đầu từ 0 trên trục y
                    }
                }
            }
        });
    </script>
</body>
</html>
