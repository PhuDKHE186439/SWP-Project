/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.compartment;
import model.location;
import model.seat;
import model.ticket;
import model.ticketClass;
import model.train;
import java.sql.Time;

/**
 *
 * @author My Asus
 */
public class TrainDAO extends DBContext {

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

    public List<train> getAllTrain() {
        List<train> list = new ArrayList<>();
        String sql = "select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,"
                + "z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription from train p left join location l on l.LocationID = p.StartLocationID "
                + "left join location z on z.LocationID = p.ArrivalLocationID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new train(rs.getInt("TrainID"),
                        rs.getString("TrainScheduleTime"),
                        rs.getString("TrainName"),
                        rs.getInt("NumberOfSeat"),
                        new location(rs.getInt("StartLocationID"),
                                rs.getString("StartLocationName"),
                                rs.getString("StartLocationDescription")),
                        new location(rs.getInt("ArrivalLocationID"),
                                rs.getString("ArrivalLocationName"),
                                rs.getString("ArrivalLocationDescription"))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public train getAllTrainByID(int trainID) {

        String sql = "select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,"
                + "z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription from train p left join location l on l.LocationID = p.StartLocationID "
                + "left join location z on z.LocationID = p.ArrivalLocationID WHere TrainID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new train(rs.getInt("TrainID"),
                        rs.getString("TrainScheduleTime"),
                        rs.getString("TrainName"),
                        rs.getInt("NumberOfSeat"),
                        new location(rs.getInt("StartLocationID"),
                                rs.getString("StartLocationName"),
                                rs.getString("StartLocationDescription")),
                        new location(rs.getInt("ArrivalLocationID"),
                                rs.getString("ArrivalLocationName"),
                                rs.getString("ArrivalLocationDescription")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<train> getAllTrainStartLocationAndArrivalLocation(int startLocation, int arrivalLocation) {
        List<train> list = new ArrayList<>();
        String sql = "select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,"
                + "z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription from train p left join location l on l.LocationID = p.StartLocationID "
                + "left join location z on z.LocationID = p.ArrivalLocationID Where StartLocationID=? And ArrivalLocationID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, startLocation);
            st.setInt(2, arrivalLocation);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new train(rs.getInt("TrainID"),
                        rs.getString("TrainScheduleTime"),
                        rs.getString("TrainName"),
                        rs.getInt("NumberOfSeat"),
                        new location(rs.getInt("StartLocationID"),
                                rs.getString("StartLocationName"),
                                rs.getString("StartLocationDescription")),
                        new location(rs.getInt("ArrivalLocationID"),
                                rs.getString("ArrivalLocationName"),
                                rs.getString("ArrivalLocationDescription"))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    //tu day la phan cua Hung
    public List<train> getTrains(String ngayDi, String ngayVe, String gaDi, String gaDen) throws SQLException {
        List<train> list = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng phù hợp với định dạng ngày nhập vào

        try {
            Date ngayDiDate = dateFormat.parse(ngayDi);
            Date ngayVeDate = dateFormat.parse(ngayVe);
            int gaDiInt = Integer.parseInt(gaDi);
            int gaDenInt = Integer.parseInt(gaDen);
            String sql = """
                         select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,                z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription from train p left join location l on l.LocationID = p.StartLocationID                left join location z on z.LocationID = p.ArrivalLocationID
                                     WHERE TrainScheduleTime BETWEEN ? AND ? AND StartLocationID = ? AND ArrivalLocationID = ?""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setDate(2, new java.sql.Date(ngayVeDate.getTime()));
            st.setInt(3, gaDiInt);
            st.setInt(4, gaDenInt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new train(rs.getInt("TrainID"),
                        rs.getString("TrainScheduleTime"),
                        rs.getString("TrainName"),
                        rs.getInt("NumberOfSeat"),
                        new location(rs.getInt("StartLocationID"),
                                rs.getString("StartLocationName"),
                                rs.getString("StartLocationDescription")),
                        new location(rs.getInt("ArrivalLocationID"),
                                rs.getString("ArrivalLocationName"),
                                rs.getString("ArrivalLocationDescription"))));
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // Xử lý lỗi nếu ngày không đúng định dạng
        }
        return list;
    }

    public List<ticket> getTickets(String ngayDi, String ngayVe) throws SQLException {
        List<ticket> list = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng phù hợp với định dạng ngày nhập vào

        try {
            Date ngayDiDate = dateFormat.parse(ngayDi);
            Date ngayVeDate = dateFormat.parse(ngayVe);
            String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID Where TimeArrive BETWEEN ? AND ?""";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setDate(2, new java.sql.Date(ngayVeDate.getTime()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ticket(rs.getInt("TicketID"),
                        rs.getInt("PassengerID"),
                        new ticketClass(rs.getInt("TicketClassID"),
                                rs.getString("CategoryName")),
                        rs.getString("PurchaseDate"),
                        rs.getDouble("TicketPrice"),
                        new seat(rs.getInt("SeatID"),
                                new compartment(rs.getInt("CompartmentID"),
                                        rs.getInt("CompartmentNumber"), new train(rs.getInt("TrainID"), rs.getString("TrainScheduleTime"), rs.getString("TrainName"), rs.getInt("NumberOfSeat"), new location(rs.getInt("StartLocationID"), rs.getString("StartLocationName"), rs.getString("StartLocationDescription")), new location(rs.getInt("ArrivalLocationID"), rs.getString("ArrivalLocationName"), rs.getString("ArrivalLocationDescription")))), rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive"), rs.getInt("Status")));
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // Xử lý lỗi nếu ngày không đúng định dạng
        }
        return list;
    }

    public List<location> getLocations(int locationId) {
        List<location> list = new ArrayList<>();
        String sql = "select * from location where LocationID <> ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, locationId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new location(rs.getInt("LocationID"), rs.getString("LocationName"), rs.getString("Description")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public seat getSeatById(int seatId) {
        String sql = "select *,l.LocationName As StartLocationName, l.Description as StartLocationDescription,"
                + "z.LocationName as ArrivalLocationName, z.Description as ArrivalLocationDescription "
                + "from seat p left join compartment cm on p.CompartmentID = cm.CompartmentID"
                + "left join train tr on tr.TrainID=cm.TrainID"
                + " left join location l on l.LocationID = tr.StartLocationID "
                + "left join location z on z.LocationID = tr.ArrivalLocationID Where p.SeatID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seatId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

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
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
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
                list.add(new train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), new LocationDAO(), status, startTime, estimatedEndTime, numberOfCarriages));
            }
            return list.size();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void updateTrain(train t, int id) {
        String sql = """
                     UPDATE `trainproject`.`train`
                     SET
                     `TrainScheduleTime` = ?,
                     `TrainName` = ?,
                     `NumberOfSeat` = ?,
                     `StartLocationID` = ?, `ArrivalLocationID` = ?,
                                          status = ?, startTime = ?,estimatedEndTime = ?,numberOfCarriages = ?
                                          WHERE `TrainID` = ?
                                          """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(10, t.getTrainID());
            st.setString(1, t.getTrainScheduleTime());
            st.setString(2, t.getTrainName());
            st.setInt(3, t.getNumberOfSeat());
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

    public void insertTrain(train t) {
        String sql = """
                     INSERT INTO `trainproject`.`train`
                     (`TrainID`,
                     `TrainScheduleTime`,
                     `TrainName`,
                     `NumberOfSeat`,
                     `StartLocationID`, `ArrivalLocationID`, status, startTime,estimatedEndTime,numberOfCarriages)
                                          VALUES (?,?,?,?,?,?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, t.getTrainID());
            st.setString(2, t.getTrainScheduleTime());
            st.setString(3, t.getTrainName());
            st.setInt(4, t.getNumberOfSeat());
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

    public static void main(String[] args) throws SQLException {
        TrainDAO dao = new TrainDAO();
        System.out.println(dao.getTrains("2024-09-17", "2024-09-17", "1", "2"));
    }
}
