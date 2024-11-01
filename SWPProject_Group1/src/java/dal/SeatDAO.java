/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.compartment;
import model.location;
import model.seat;
import model.train;

/**
 *
 * @author My Asus
 */
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
            System.out.println(e);
        }
        return list;
    }
    
    public void updateStatusSeat(int seatId, int status) {
        String sql = """
                     UPDATE `trainproject`.`seat`
                     SET
                     `AvailabilityStatus` = ? 
                                          WHERE `SeatID` = ?
                                          """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, seatId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SeatDAO dao = new SeatDAO();
        System.out.println(dao.getAllSeatFromComaprt(2));
    }
}
