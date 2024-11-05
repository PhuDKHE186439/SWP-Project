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
    
    // Validate input parameters
    if (ngayDi == null || ngayDi.trim().isEmpty()) {
        throw new IllegalArgumentException("Ngày đi không được để trống");
    }
    if (gaDi == null || gaDi.trim().isEmpty()) {
        throw new IllegalArgumentException("Ga đi không được để trống");
    }
    if (gaDen == null || gaDen.trim().isEmpty()) {
        throw new IllegalArgumentException("Ga đến không được để trống");
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    PreparedStatement st = null;
    ResultSet rs = null;
    
    try {
        Date ngayDiDate = dateFormat.parse(ngayDi);
        int gaDiInt = Integer.parseInt(gaDi);
        int gaDenInt = Integer.parseInt(gaDen);
        
        String sql;
        
        if (ngayVe != null && !ngayVe.trim().isEmpty()) {
            // Trường hợp khứ hồi
            Date ngayVeDate = dateFormat.parse(ngayVe);
            
            // Validate ngày về phải sau ngày đi
            if (ngayVeDate.before(ngayDiDate)) {
                throw new IllegalArgumentException("Ngày về phải sau ngày đi");
            }
            
            sql = """
                  SELECT t.*, 
                         l1.LocationName AS StartLocationName, 
                         l1.Description AS StartLocationDescription,
                         l2.LocationName AS ArrivalLocationName, 
                         l2.Description AS ArrivalLocationDescription 
                  FROM train t 
                  LEFT JOIN location l1 ON l1.LocationID = t.StartLocationID 
                  LEFT JOIN location l2 ON l2.LocationID = t.ArrivalLocationID
                  WHERE t.TrainScheduleTime BETWEEN ? AND ?
                  AND t.StartLocationID = ? 
                  AND t.ArrivalLocationID = ?
                  AND t.NumberOfSeat > 0
                  ORDER BY t.TrainScheduleTime ASC
                  """;
                  
            st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setDate(2, new java.sql.Date(ngayVeDate.getTime()));
            st.setInt(3, gaDiInt);
            st.setInt(4, gaDenInt);
            
        } else {
            // Trường hợp một chiều
            sql = """
                  SELECT t.*, 
                         l1.LocationName AS StartLocationName, 
                         l1.Description AS StartLocationDescription,
                         l2.LocationName AS ArrivalLocationName, 
                         l2.Description AS ArrivalLocationDescription 
                  FROM train t 
                  LEFT JOIN location l1 ON l1.LocationID = t.StartLocationID 
                  LEFT JOIN location l2 ON l2.LocationID = t.ArrivalLocationID
                  WHERE DATE(t.TrainScheduleTime) = ?
                  AND t.StartLocationID = ? 
                  AND t.ArrivalLocationID = ?
                  AND t.NumberOfSeat > 0
                  ORDER BY t.TrainScheduleTime ASC
                  """;
                  
            st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(ngayDiDate.getTime()));
            st.setInt(2, gaDiInt);
            st.setInt(3, gaDenInt);
        }
        
        rs = st.executeQuery();
        
        while (rs.next()) {
            train t = new train(
                rs.getInt("TrainID"),
                rs.getString("TrainScheduleTime"),
                rs.getString("TrainName"),
                rs.getInt("NumberOfSeat"),
                new location(
                    rs.getInt("StartLocationID"),
                    rs.getString("StartLocationName"),
                    rs.getString("StartLocationDescription")
                ),
                new location(
                    rs.getInt("ArrivalLocationID"),
                    rs.getString("ArrivalLocationName"),
                    rs.getString("ArrivalLocationDescription")
                )
            );
            list.add(t);
        }
        
    } catch (ParseException e) {
        throw new IllegalArgumentException("Định dạng ngày không hợp lệ: " + e.getMessage(), e);
    } catch (NumberFormatException e) {
        throw new IllegalArgumentException("Định dạng ID ga không hợp lệ: " + e.getMessage(), e);
    } finally {
        // Đóng các resource
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    return list;
}
public List<location> searchLocations(String keyword) {
    List<location> list = new ArrayList<>();
    String sql = "SELECT * FROM location WHERE LocationName LIKE ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, "%" + keyword + "%");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            list.add(new location(rs.getInt("LocationID"), 
                                rs.getString("LocationName"), 
                                rs.getString("Description")));
        }
    } catch (SQLException e) {
        System.out.println(e);
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

    public static void main(String[] args) {
        // Test data
        String ngayDi = "2024-12-01";
        String ngayVe = "2024-12-15"; // for round-trip case, set this to null for one-way
        String gaDi = "1"; // Mock StartLocationID
        String gaDen = "2"; // Mock ArrivalLocationID
        String keyword = "New York"; // Keyword to search in locations

        // Mock getTrains output
        List<train> mockTrains = List.of(
            new train(1, "2024-12-01 08:00:00", "Express A", 100, 
                      new location(1, "Station A", "Main Station A"), 
                      new location(2, "Station B", "Main Station B")),
            new train(2, "2024-12-01 09:30:00", "Express B", 120, 
                      new location(1, "Station A", "Main Station A"), 
                      new location(2, "Station B", "Main Station B"))
        );

        System.out.println("Trains:");
        for (train tr : mockTrains) {
            System.out.println(tr);
        }

        // Mock searchLocations output
        List<location> mockLocations = List.of(
            new location(3, "New York Central", "The main hub in New York"),
            new location(4, "New York Downtown", "Located in the heart of the city")
        );

        System.out.println("\nLocations matching keyword:");
        for (location loc : mockLocations) {
            System.out.println(loc);
        }
    }
}

