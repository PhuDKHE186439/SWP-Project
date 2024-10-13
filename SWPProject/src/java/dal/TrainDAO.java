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



/**
 *
 * @author My Asus
 */
public class TrainDAO extends DBContext {
    public List<train> getAll(){
        List<train> list = new ArrayList<>();
        String sql = "select * from train where `isDelete` = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new train(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),new LocationDAO()));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;        
    }
    
    public int getSize(){
        List<train> list = new ArrayList<>();
        String sql = "select * from train ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new train(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),new LocationDAO()));
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
                     `ArrivalLocationID`)
                     VALUES
                     (?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, t.getTrainID());
            st.setString(2, t.getTrainScheduleTime());
            st.setString(3,t.getTrainName());
            st.setString(4, t.getNumberOfSeat());
            st.setInt(5, t.getStartLocationID());
            st.setInt(6, t.getArrivalLocationID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateTrain(train t,int id) {
        String sql = """
                     UPDATE `trainproject`.`train`
                     SET
                     `TrainScheduleTime` = ?,
                     `TrainName` = ?,
                     `NumberOfSeat` = ?,
                     `StartLocationID` = ?,
                     `ArrivalLocationID` = ?
                     WHERE `TrainID` = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(6, t.getTrainID());
            st.setString(1, t.getTrainScheduleTime());
            st.setString(2,t.getTrainName());
            st.setString(3, t.getNumberOfSeat());
            st.setInt(4, t.getStartLocationID());
            st.setInt(5, t.getArrivalLocationID());
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
}
