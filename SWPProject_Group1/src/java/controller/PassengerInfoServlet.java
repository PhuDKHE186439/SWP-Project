package controller;

import dal.AccountDAO;
import dal.PassengerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.account;
import model.passenger;

@WebServlet("/viewPassengerInfo")
public class PassengerInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get PassengerID from URL
        String passengerIDParam = request.getParameter("passengerID");

        // Validate passengerID
        if (passengerIDParam == null || passengerIDParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Passenger ID is required");
            return;
        }

        int passengerID;
        try {
            passengerID = Integer.parseInt(passengerIDParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Passenger ID format");
            return;
        }

        // Call DAO to retrieve passenger information
        PassengerDAO dao = new PassengerDAO();
        passenger passenger = dao.getPassengerByID(passengerID);

        if (passenger != null) {
            // Construct HTML response with passenger information
            StringBuilder htmlResponse = new StringBuilder();
            htmlResponse.append("<div><strong>Passenger ID:</strong> ").append(passenger.getPassengerID()).append("</div>");
            htmlResponse.append("<div><strong>Name:</strong> ").append(passenger.getName()).append("</div>");
            htmlResponse.append("<div><strong>Email:</strong> ").append(passenger.getEmail()).append("</div>");
            htmlResponse.append("<div><strong>Phone:</strong> ").append(passenger.getPhoneNumber()).append("</div>");
          htmlResponse.append("<div><strong>Age:</strong> ").append(passenger.getAge()).append("</div>");

            // Add more fields as necessary

            // Set the response type to HTML
            response.setContentType("text/html");
            response.getWriter().write(htmlResponse.toString());
        } else {
            // If passenger not found, return a 404 error
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Passenger not found");
        }
    }
}
