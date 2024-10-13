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
import model.location;
import model.train;

/**
 *
 * @author Admin
 */
public class LocationDAO extends DBContext {

    public List<location> getAllLocation() {
        List<location> list = new ArrayList<>();
        String sql = "select * from location";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new location(rs.getInt("LocationID"), rs.getString("LocationName"), rs.getString("Description")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public location getLocationByID(int id) {
        String sql = "select * from location where LocationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new location(rs.getInt("LocationID"), rs.getString("LocationName"), rs.getString("Description"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

   
}
