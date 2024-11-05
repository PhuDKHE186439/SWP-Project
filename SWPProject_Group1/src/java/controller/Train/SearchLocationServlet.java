package controller.Train;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dal.TrainDAO;
import model.location;
import model.train;

@WebServlet(name = "SearchLocationServlet", urlPatterns = "/searchLocation")
public class SearchLocationServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("search".equals(action)) {
            // Handle train search
            handleTrainSearch(request, response);
        } else {
            // Handle location search (original functionality)
            handleLocationSearch(request, response);
        }
    }
    
    private void handleLocationSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String keyword = request.getParameter("keyword");
        TrainDAO trainDAO = new TrainDAO();
        List<location> locations = trainDAO.searchLocations(keyword);
        
        // Convert to JSON
        JsonArray jsonArray = new JsonArray();
        for (location loc : locations) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("id", loc.getLocationID());
            jsonObj.addProperty("name", loc.getLocationName());
            jsonArray.add(jsonObj);
        }
        
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
    }
    
    private void handleTrainSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tripType = request.getParameter("tripType");
            String ngayDi = request.getParameter("ngayDi");
            String ngayVe = request.getParameter("ngayVe");
            String gaDi = request.getParameter("l1");
            String gaDen = request.getParameter("l2");
            
            TrainDAO dao = new TrainDAO();
            JsonObject result = new JsonObject();
            
            if ("roundTrip".equals(tripType) && ngayVe != null && !ngayVe.isEmpty()) {
                // Get outbound trains
                List<train> outboundTrains = dao.getTrains(ngayDi, null, gaDi, gaDen);
                // Get return trains
                List<train> returnTrains = dao.getTrains(ngayVe, null, gaDen, gaDi);
                
                // Convert to JSON
                result.add("outboundTrains", convertTrainsToJson(outboundTrains));
                result.add("returnTrains", convertTrainsToJson(returnTrains));
                result.addProperty("isRoundTrip", true);
            } else {
                // One-way trip
                List<train> trains = dao.getTrains(ngayDi, null, gaDi, gaDen);
                result.add("outboundTrains", convertTrainsToJson(trains));
                result.addProperty("isRoundTrip", false);
            }
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(result.toString());
            out.flush();
            
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            JsonObject error = new JsonObject();
            error.addProperty("error", e.getMessage());
            PrintWriter out = response.getWriter();
            out.print(error.toString());
            out.flush();
        }
    }
    
    private JsonArray convertTrainsToJson(List<train> trains) {
        JsonArray jsonArray = new JsonArray();
        for (train t : trains) {
            JsonObject trainObj = new JsonObject();
            trainObj.addProperty("trainId", t.getTrainID());
            trainObj.addProperty("trainName", t.getTrainName());
            trainObj.addProperty("scheduleTime", t.getTrainScheduleTime());
            trainObj.addProperty("numberOfSeats", t.getNumberOfSeat());
            
            // Add location information
            JsonObject startLocation = new JsonObject();
            startLocation.addProperty("id", t.getStartLocation().getLocationID());
            startLocation.addProperty("name", t.getStartLocation().getLocationName());
            startLocation.addProperty("description", t.getStartLocation().getDescription());
            trainObj.add("startLocation", startLocation);
            
            JsonObject arrivalLocation = new JsonObject();
            arrivalLocation.addProperty("id", t.getArrivalLocation().getLocationID());
            arrivalLocation.addProperty("name", t.getArrivalLocation().getLocationName());
            arrivalLocation.addProperty("description", t.getArrivalLocation().getDescription());
            trainObj.add("arrivalLocation", arrivalLocation);
            
            jsonArray.add(trainObj);
        }
        return jsonArray;
    }
}