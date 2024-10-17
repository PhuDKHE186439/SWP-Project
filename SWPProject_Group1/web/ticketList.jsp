<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Perfume Product Page</title>
  <style>
      body{
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: 'Poppins', sans-serif;
        background-color: #B7B5E4;
      }

      /* Button Style */
      .createButtonContainer {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 20px;
      }

      .createButton {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      .createButton:hover {
        background-color: #45a049;
      }

      /* Main Ticket Style */
      .ticketContainer{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
        width: 80%;
        max-width: 600px;
      }
      .ticket{
        animation: bouncingCard 0.6s ease-out infinite alternate;
        background-color: white;
        color: darkslategray;
        border-radius: 12px;
        padding: 16px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 100%;
      }
      .ticketShadow{
        animation: bouncingShadow 0.6s ease-out infinite alternate;
        margin-top: 4px;
        width: 95%;
        height: 12px;
        border-radius: 50%;
        background-color: rgba(0, 0, 0, 0.4);
        filter: blur(12px);
      }

      /* Ticket Content */
      .ticketTitle{
        font-size: 1.5rem;
        font-weight: 700;
        padding: 12px 16px 4px;
      }
      hr{
        width: 90%;
        border: 1px solid #efefef;
      }
      .ticketDetail{
        font-size: 1.1rem;
        font-weight: 500;
        padding: 4px 16px;
      }
      .ticketSubDetail{
        display: flex;
        justify-content: space-between;
        font-size: 1rem;
        padding: 12px 16px;
      }
      .ticketSubDetail .code{
        margin-right: 24px;
      }

      /* Ticket Ripper */
      .ticketRip{
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .circleLeft{
        width: 12px;
        height: 24px;
        background-color: #B7B5E4;
        border-radius: 0 12px 12px 0;
      }
      .ripLine{
        width: 100%;
        border-top: 3px solid #B7B5E4;
        border-top-style: dashed ;
      }
      .circleRight{
        width: 12px;
        height: 24px;
        background-color: #B7B5E4;
        border-radius: 12px 0 0 12px;
      }

      /* Ticket Actions: Delete and Update Buttons */
      .ticketActions {
        display: flex;
        justify-content: space-between;
        padding: 16px;
        margin-top: 10px;
      }
      .ticketActions form {
        flex: 1;
        margin-right: 10px;
      }
      .ticketActions form:last-child {
        margin-right: 0;
      }
      .btn {
        display: inline-block;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: 600;
        text-align: center;
        border-radius: 5px;
        border: none;
        cursor: pointer;
      }
      .btn-danger {
        background-color: #e74c3c;
        color: white;
      }
      .btn-danger:hover {
        background-color: #c0392b;
      }
      .btn-primary {
        background-color: #3498db;
        color: white;
      }
      .btn-primary:hover {
        background-color: #2980b9;
      }

  </style>
  
</head>
<body>

  <c:forEach var="i" items="${requestScope.data}">
    <div class="ticketContainer">
        <div class="ticket">
            <div class="ticketTitle">Name passenger: ${i.getStringNamePassenger()}</div>
            <hr />
            <div class="ticketDetail">
                <div>Train Name: ${i.getTrainName()}</div>
                <div>Seat: ${i.getSeatNumber()}</div>
                <div>Purchase Date: ${i.purchaseDate}</div>
            </div>
            <div class="ticketRip">
                <div class="circleLeft"></div>
                <div class="ripLine"></div>
                <div class="circleRight"></div>
            </div>
            <div class="ticketSubDetail">
                <div class="code">Time Arrive</div>
                <div class="date">${i.timeArrive}</div>
            </div>
            <!-- Nút Delete và Update -->
            <div class="ticketActions">
                <form action="ticketDelete" method="get">
                    <input type="hidden" name="ticketID" value="${i.ticketID}" />
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
                <form action="ticketUpdate" method="get">
                    <input type="hidden" name="ticketID" value="${i.ticketID}" />
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
        <div class="ticketShadow"></div>
    </div>
  </c:forEach>

</body>
