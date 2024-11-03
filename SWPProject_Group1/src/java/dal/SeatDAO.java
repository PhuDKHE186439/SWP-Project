package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.compartment;
import model.location;
import model.seat;
import model.train;

public class SeatDAO extends DBContext {
    public List<seat> getAllSeatFromComaprt(int compartmentID) {
        List<seat> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from Seat p 
                     left join compartment cm on p.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID Where p.CompartmentID=? ;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, compartmentID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new seat(rs.getInt("SeatID"),
                        new compartment(rs.getInt("CompartmentID"),
                                rs.getInt("CompartmentNumber"),
                                new train(rs.getInt("TrainID"),
                                        rs.getString("TrainScheduleTime"),
                                        rs.getString("TrainName"),
                                        rs.getInt("NumberOfSeat"),
                                        new location(rs.getInt("StartLocationID"),
                                                rs.getString("StartLocationName"),
                                                rs.getString("StartLocationDescription")),
                                        new location(rs.getInt("ArrivalLocationID"),
                                                rs.getString("ArrivalLocationName"),
                                                rs.getString("ArrivalLocationDescription")))),
                        rs.getString("SeatNumber"), rs.getString("SeatType"),
                        rs.getInt("AvailabilityStatus")));
            }
        } catch (Exception e) {
            System.out.println("Error getting seats: " + e.getMessage());
        }
        return list;
    }

    public boolean updateSeatStatus(int seatId, int status) {
        String sql = "UPDATE Seat SET AvailabilityStatus = ? WHERE SeatID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, seatId);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error updating seat status: " + e.getMessage());
            return false;
        }
    }

    public seat getSeatById(int seatId) {
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                     from Seat p 
                     left join compartment cm on p.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID 
                     Where p.SeatID=? ;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seatId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new seat(rs.getInt("SeatID"),
                        new compartment(rs.getInt("CompartmentID"),
                                rs.getInt("CompartmentNumber"),
                                new train(rs.getInt("TrainID"),
                                        rs.getString("TrainScheduleTime"),
                                        rs.getString("TrainName"),
                                        rs.getInt("NumberOfSeat"),
                                        new location(rs.getInt("StartLocationID"),
                                                rs.getString("StartLocationName"),
                                                rs.getString("StartLocationDescription")),
                                        new location(rs.getInt("ArrivalLocationID"),
                                                rs.getString("ArrivalLocationName"),
                                                rs.getString("ArrivalLocationDescription")))),
                        rs.getString("SeatNumber"), rs.getString("SeatType"),
                        rs.getInt("AvailabilityStatus"));
            }
        } catch (Exception e) {
            System.out.println("Error getting seat by ID: " + e.getMessage());
        }
        return null;
    }

    // Test main method
    public static void main(String[] args) {
        SeatDAO dao = new SeatDAO();
        
        // Test getting all seats from compartment
        System.out.println("Testing getAllSeatFromComaprt(2):");
        System.out.println(dao.getAllSeatFromComaprt(2));
        
        // Test updating seat status
        System.out.println("\nTesting updateSeatStatus:");
        int testSeatId = 1; // Use an actual seat ID from your database
        boolean updateResult = dao.updateSeatStatus(testSeatId, 1);
        System.out.println("Update result for seat " + testSeatId + ": " + updateResult);
        
        // Test getting seat by ID
        System.out.println("\nTesting getSeatById:");
        seat testSeat = dao.getSeatById(testSeatId);
        if (testSeat != null) {
            System.out.println("Found seat: " + testSeat.getSeatNumber() + 
                             " (Type: " + testSeat.getSeatType() + 
                             ", Status: " + testSeat.getAvailabilityStatus() + ")");
        } else {
            System.out.println("Seat not found");
        }
    }
}