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

    public static void main(String[] args) throws SQLException {
        TrainDAO dao = new TrainDAO();
        System.out.println(dao.getTrains("2024-09-17", "2024-09-17","1","2"));
    }
}
