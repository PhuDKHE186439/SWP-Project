/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.compartment;
import model.location;
import model.train;

/**
 *
 * @author My Asus
 */
public class CompartmentDAO extends DBContext {

    public List<compartment> getAllCompartmentFromTrain(int trainID) {
        List<compartment> list = new ArrayList<>();
        String sql = "select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,"
                + "z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription "
                + "from compartment p left join train tr on tr.TrainID=p.TrainID"
                + " left join location l on l.LocationID = tr.StartLocationID "
                + "left join location z on z.LocationID = tr.ArrivalLocationID Where tr.TrainID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new compartment(rs.getInt("CompartmentID"),
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
                                        rs.getString("ArrivalLocationDescription")))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CompartmentDAO dao = new CompartmentDAO();
        System.out.println(dao.getAllCompartmentFromTrain(1));
    }
}