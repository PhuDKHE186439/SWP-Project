<%-- 
    Document   : trainInfomation
    Created on : Oct 6, 2024, 12:41:32 PM
    Author     : Relax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Train Head Icon</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh; /* Căn giữa theo chiều dọc */
                background-color: #f0f0f0; /* Màu nền nhẹ */
            }

            .train-head {
                display: flex;
                flex-direction: column; /* Đặt theo chiều dọc */
                align-items: center; /* Căn giữa theo chiều ngang */
                background-color: #444;
                border-radius: 15px 15px 0 0; /* Thay đổi bán kính viền */
                position: relative;
                margin: 50px auto;
                border-bottom: 7.5px solid #333; /* Tăng kích thước viền */
                padding: 10px; /* Thêm khoảng đệm */
                box-sizing: border-box; /* Bao gồm padding trong kích thước */
                width: 250px; /* Đặt chiều rộng cố định cho tàu */
                min-width: 210px; /* Kích thước tối thiểu của tàu */
            }

            /* Phần tên tàu */
            .train-name {
                color: white;
                font-weight: bold;
                font-size: 16px; /* Kích thước chữ */
                background-color: #222; /* Nền màu tối cho tên tàu */
                border-radius: 5px;
                padding: 2px 5px; /* Thêm khoảng đệm xung quanh chữ */
                text-align: center; /* Căn giữa chữ */
                white-space: nowrap; /* Không cho xuống dòng */
                margin-bottom: 10px; /* Thêm khoảng cách giữa tên tàu và cửa sổ */
            }

            /* Phần cửa sổ tàu */
            .train-window {
                width: 100%; /* Chiều rộng bằng 100% */
                height: 120px; /* Chiều cao cửa sổ */
                background-color: #87CEEB;
                border-radius: 5px;
                border: 2px solid #444; /* Viền mỏng */
                position: relative; /* Để căn giữa nội dung bên trong */
                padding: 10px; /* Thêm khoảng đệm bên trong */
                box-sizing: border-box; /* Bao gồm padding trong kích thước */
                display: flex;
                flex-direction: column; /* Đặt theo chiều dọc */
                justify-content: center; /* Căn giữa theo chiều dọc */
                color: #333; /* Màu chữ cho thông tin */
                margin-bottom: 23px;
            }

            /* Đèn tàu hỏa */
            .light {
                width: 30px; /* Kích thước đèn */
                height: 30px; /* Kích thước đèn */
                background-color: yellow;
                border-radius: 50%;
                position: absolute;
                bottom: 0px; /* Dịch đèn xuống một khoảng để không chạm vào kính */
                box-shadow: 0 0 15px yellow; /* Tăng độ sáng bóng */
            }

            .light.left {
                left: 45px; /* Đèn bên trái */
            }

            .light.right {
                right: 45px; /* Đèn bên phải */
            }

            /* Thông tin tàu */
            .train-info {
                font-size: 14px; /* Kích thước chữ cho thông tin tàu */
                text-align: left; /* Căn trái chữ */
                line-height: 0.7; /* Rút ngắn khoảng cách giữa các dòng */
                margin: 0; /* Xóa margin nếu có */
            }

        </style>
    </head>
    <body>

        <div class="train-head">
            <div class="train-name">
                <%= request.getParameter("trainName") != null && !request.getParameter("trainName").isEmpty() 
                            ? request.getParameter("trainName") 
                            : "Chưa có thông tin" %>
            </div> <!-- Tên tàu dài -->
            <div class="train-window">
                <div class="train-info">
                    <p><strong>Thời gian đi:</strong> 
                        <%= request.getParameter("departureTime") != null && !request.getParameter("departureTime").isEmpty() 
                            ? request.getParameter("departureTime") 
                            : "Chưa có thông tin" %>
                    </p>
                    <p><strong>Thời gian đến:</strong> 
                        <%= request.getParameter("arrivalTime") != null && !request.getParameter("arrivalTime").isEmpty() 
                            ? request.getParameter("arrivalTime") 
                            : "Chưa có thông tin" %>
                    </p>
                    <p><strong>Số chỗ ngồi trống:</strong> 
                        <%= request.getParameter("availableSeats") != null && !request.getParameter("availableSeats").isEmpty() 
                            ? request.getParameter("availableSeats") 
                            : "Chưa có thông tin" %>
                    </p>
                    <p><strong>Tổng số chỗ:</strong> 
                        <%= request.getParameter("totalSeats") != null && !request.getParameter("totalSeats").isEmpty() 
                            ? request.getParameter("totalSeats") 
                            : "Chưa có thông tin" %>
                    </p>
                </div>
            </div>

            <div class="light left"></div> <!-- Đèn bên trái -->
            <div class="light right"></div> <!-- Đèn bên phải -->
        </div>

    </body>
</html>
