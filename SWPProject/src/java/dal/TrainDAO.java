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

    public seat getSeatById(int seatId) {
        String sql = "select * from seat where SeatID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seatId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                seat c = new seat();
                c.setSeatID(rs.getInt(1));
                c.setCompartmentID(rs.getInt(2));
                c.setSeatNumber(rs.getString(3));
                c.setAvailabilityStatus(rs.getInt(4));
                c.setSeatType(rs.getString(5));
                compartment cc = getCompartmentById(rs.getInt(2));
                c.setCompartment(cc);
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public compartment getCompartmentById(int cId) {
        String sql = "select * from compartment where CompartmentID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                compartment c = new compartment();
                c.setCompartmentID(rs.getInt(1));
                c.setCompartmentNumber(rs.getInt(2));
                c.setTrainID(rs.getInt(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public train getTrainById(int parseInt) throws SQLException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng phù hợp với định dạng ngày nhập vào
        String sql = "SELECT * FROM train "
                + " WHERE TrainID = ? "; // Xử lý lỗi nếu ngày không đúng định dạng
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, parseInt);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            train t = new train();
            t.setTrainID(rs.getInt(1));
            t.setTrainScheduleTime(rs.getDate(2) + "");
            t.setTrainName(rs.getString(3));
            t.setNumberOfSeat(rs.getString(4));
            t.setStartLocationID(rs.getInt(5));
            t.setArrivalLocationID(rs.getInt(6));
            location start = getLocationById(rs.getInt(5));
            t.setStartLocation(start);
            location end = getLocationById(rs.getInt(6));
            t.setArrivalLocation(end);
            return t;
        }
        return null;
    }

    public location getLocationById(int locationId) {
        String sql = "select * from location where LocationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, locationId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new location(rs.getInt("LocationID"), rs.getString("LocationName"), rs.getString("Description"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<compartment> getCompartmentsOfTrain(int trainId) {
        List<compartment> list = new ArrayList<>();
        String sql = "select CompartmentID, CompartmentNumber, TrainID"
                + " from compartment where TrainID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trainId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                compartment c = new compartment();
                c.setCompartmentID(rs.getInt(1));
                c.setCompartmentNumber(rs.getInt(2));
                c.setTrainID(rs.getInt(3));
                list.add(c);
            }
            for (compartment c : list) {
                sql = "select * from seat where CompartmentID = ?";
                st = connection.prepareStatement(sql);
                st.setInt(1, c.getCompartmentID());
                List<seat> seats = new ArrayList();
                while (rs.next()) {
                    seat s = new seat();
                    s.setSeatID(rs.getInt(1));
                    s.setSeatNumber(rs.getString(3));
                    seats.add(s);
                }
                c.setSeats(seats);
            }
        } catch (SQLException e) {
            System.out.println(e);
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

    public List<train> getTrains(String ngayDi, String ngayVe, String gaDi, String gaDen) throws SQLException {
        List<train> list = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng phù hợp với định dạng ngày nhập vào

        try {
            Date ngayDiDate = dateFormat.parse(ngayDi);
            Date ngayVeDate = dateFormat.parse(ngayVe);
            int gaDiInt = Integer.parseInt(gaDi);
            int gaDenInt = Integer.parseInt(gaDen);
            String sql = "SELECT * FROM train "
                    + " WHERE TrainScheduleTime "
                    + " BETWEEN ? AND ? AND StartLocationID = ? AND ArrivalLocationID = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setDate(2, new java.sql.Date(ngayVeDate.getTime()));
            st.setInt(3, gaDiInt);
            st.setInt(4, gaDenInt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                train t = new train();
                t.setTrainID(rs.getInt(1));
                t.setTrainScheduleTime(rs.getDate(2) + "");
                t.setTrainName(rs.getString(3));
                t.setNumberOfSeat(rs.getString(4));
                t.setStartLocationID(rs.getInt(5));
                t.setArrivalLocationID(rs.getInt(6));
                location start = getLocationById(rs.getInt(5));
                t.setStartLocation(start);
                location end = getLocationById(rs.getInt(6));
                t.setArrivalLocation(end);
                list.add(t);
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
            String sql = "SELECT * FROM ticket "
                    + " WHERE TimeArrive "
                    + " BETWEEN ? AND ? ";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setDate(2, new java.sql.Date(ngayVeDate.getTime()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ticket t = new ticket();
                t.setTicketID(rs.getInt(1));
                t.setPassengerID(rs.getInt(2));
                t.setTicketClassID(rs.getInt(3));
                t.setPurchaseDate(rs.getString(4));
                t.setTicketPrice(rs.getDouble(5));
                t.setSeatID(rs.getInt(6));
                t.setTimeArrive(rs.getString(7));
                t.setStatus(rs.getInt(8));
                t.setCompartmentID(rs.getInt(9));
                t.setCompartmentNumber(rs.getInt(10));
                t.setCompartment(getCompartmentById(rs.getInt(9)));
                t.setSeat(getSeatById(rs.getInt(6)));
                list.add(t);
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // Xử lý lỗi nếu ngày không đúng định dạng
        }
        return list;
    }
}
