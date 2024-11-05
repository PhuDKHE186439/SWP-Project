/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
/**
 *
 * @author P C
 */
@WebServlet(name = "SearchLocationServlet", urlPatterns = "/searchLocation")
public class SearchLocationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
}

