<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Ghế Tàu</title>
    <style>
        .seat-table {
            border-collapse: collapse;
            margin: 20px 0;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .seat {
            width: 60px; /* Chiều rộng cho mỗi ghế */
            height: 60px; /* Chiều cao cho mỗi ghế */
            background-color: #4CAF50; /* Màu nền của ghế */
            color: white;
            text-align: center;
            line-height: 60px; /* Căn giữa chữ trong ô */
            margin: 5px; /* Khoảng cách giữa các ghế */
            position: relative; /* Để tooltip có thể căn cứ vào vị trí của ô ghế */
            cursor: pointer; /* Hiển thị tay cầm khi di chuột vào */
            border: none; /* Không viền cho button */
            border-radius: 5px; /* Đường viền mềm mại */
        }
        .tooltip {
            visibility: hidden;
            width: 120px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 100%; /* Đưa tooltip lên trên ghế */
            left: 50%;
            margin-left: -60px;
            opacity: 0; /* Bắt đầu với độ trong suốt */
            transition: opacity 0.3s;
        }
        .seat:hover .tooltip {
            visibility: visible;
            opacity: 1; /* Hiển thị tooltip khi hover */
        }
    </style>
    <script>
        function goToPayment(seatNumber) {
            const price = 200000; // Giá vé
            
                window.location.href = `payment.jsp?seatNumber=${seatNumber}&price=${price}`;
           
        }
    </script>
</head>
<body>

    <table class="seat-table">
        <tbody>
            <% 
            int totalSeats = 30; // Tổng số ghế
            int seatsPerRow = 10; // Số ghế mỗi hàng
            for (int i = 1; i <= totalSeats; i++) { 
            %>
                <% if (i % seatsPerRow == 1) { %><tr><% } %>
                <td>
                    <div class="seat" onclick="goToPayment(<%= i %>)">
                        <%= i %>
                        <span class="tooltip">Giá: 200.000 VNĐ<br>Trạng thái: <%= (i % 2 == 0) ? "Đã đặt" : "Trống" %></span>
                    </div>
                </td>
                <% if (i % seatsPerRow == 0 || i == totalSeats) { %></tr><% } %>
            <% } %>
        </tbody>
    </table>

</body>
</html>
