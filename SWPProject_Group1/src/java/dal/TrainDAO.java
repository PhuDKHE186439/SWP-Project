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
import model.train;
import java.sql.Time;

/**
 *
 * @author My Asus
 */
public class TrainDAO extends DBContext {

    public List<train> getAll() {
        List<train> list = new ArrayList<>();
        String sql = "select * from train where `isDelete` = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String status = rs.getString("status");  // Thêm cột status
                Time startTime = rs.getTime("startTime");  // Thêm cột startTime
                Time estimatedEndTime = rs.getTime("estimatedEndTime");  // Thêm cột estimatedEndTime
                int numberOfCarriages = rs.getInt("numberOfCarriages");
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getSize() {
        List<train> list = new ArrayList<>();
        String sql = "select * from train ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String status = rs.getString("status");  // Thêm cột status
                Time startTime = rs.getTime("startTime");  // Thêm cột startTime
                Time estimatedEndTime = rs.getTime("estimatedEndTime");  // Thêm cột estimatedEndTime
                int numberOfCarriages = rs.getInt("numberOfCarriages");
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
            }
            return list.size();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insertTrain(train t) {
        String sql = """
                     INSERT INTO `trainproject`.`train`
                     (`TrainID`,
                     `TrainScheduleTime`,
                     `TrainName`,
                     `NumberOfSeat`,
                     `StartLocationID`,
                     `ArrivalLocationID`, status, startTime,estimatedEndTime,numberOfCarriages)
                     VALUES
                     (?,?,?,?,?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, t.getTrainID());
            st.setString(2, t.getTrainScheduleTime());
            st.setString(3, t.getTrainName());
            st.setString(4, t.getNumberOfSeat());
            st.setInt(5, t.getStartLocationID());
            st.setInt(6, t.getArrivalLocationID());
            st.setString(7, t.getStatus());
            st.setTime(8, t.getStartTime());
            st.setTime(9, t.getEstimatedEndTime());
            st.setInt(10, t.getNumberOfCarriages());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateTrain(train t, int id) {
        String sql = """
                     UPDATE `trainproject`.`train`
                     SET
                     `TrainScheduleTime` = ?,
                     `TrainName` = ?,
                     `NumberOfSeat` = ?,
                     `StartLocationID` = ?,
                     `ArrivalLocationID` = ?,
                     status = ?, startTime = ?,estimatedEndTime = ?,numberOfCarriages = ?
                     WHERE `TrainID` = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(10, t.getTrainID());
            st.setString(1, t.getTrainScheduleTime());
            st.setString(2, t.getTrainName());
            st.setString(3, t.getNumberOfSeat());
            st.setInt(4, t.getStartLocationID());
            st.setInt(5, t.getArrivalLocationID());
            st.setString(6, t.getStatus());
            st.setTime(7, t.getStartTime());
            st.setTime(8, t.getEstimatedEndTime());
            st.setInt(9, t.getNumberOfCarriages());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteTrain(int id) {
        String sql = """
                     UPDATE `trainproject`.`train`
                     SET
                     `isDelete` = 1 
                     WHERE `TrainID` = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<train> getAllByLocation(String startId, String endId) {
        List<train> list = new ArrayList<>();
        String sql = "select * from train where `isDelete` = 0 and (? = '' or StartLocationID = ?) and (? = '' or ArrivalLocationID = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, startId);
            st.setString(2, startId);
            st.setString(3, endId);
            st.setString(4, endId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String status = rs.getString("status");  // Thêm cột status
                Time startTime = rs.getTime("startTime");  // Thêm cột startTime
                Time estimatedEndTime = rs.getTime("estimatedEndTime");  // Thêm cột estimatedEndTime
                int numberOfCarriages = rs.getInt("numberOfCarriages");
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
