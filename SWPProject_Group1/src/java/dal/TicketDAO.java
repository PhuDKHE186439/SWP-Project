/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.ticket;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.cartinfo;
import model.compartment;
import model.location;
import model.seat;
import model.ticketClass;
import model.train;

/**
 *
 * @author My Asus
 */
public class TicketDAO extends DBContext {

    public List<ticket> getAllTickets() {
        List<ticket> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID;""";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
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
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ticket> getAllTicketsStatus(int index, int recout_per_page,
            String key, int status) {
        List<ticket> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID Where t.Status = ?""";

        try (PreparedStatement st = connection.prepareStatement(sql);) {
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
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int countByCondition(String key, int status) {
        String sql = " SELECT count(*) FROM trainproject.ticket "
                + " WHERE Status = ?";
        if (key != null && !key.isEmpty()) {
            sql += " and TicketPrice like ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int id = 1;
            st.setInt(id++, status);
            if (key != null && !key.isEmpty()) {
                st.setString(id++, "'%" + key + "%'");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return -1;
    }

    public void UpdateTicket(String ticket_id, String value_str) {
        String sql = "UPDATE trainproject.ticket SET status = ? WHERE TicketID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Set the new status
            st.setInt(1, Integer.parseInt(value_str.trim()));  // New status from value_str
            // Set the ticket ID for the WHERE clause
            st.setInt(2, Integer.parseInt(ticket_id.trim()));  // TicketID

            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid status or ticket ID format.", e);
        }
    }

    public List<ticket> getTicketByPassengerID(int PassengerID) {
        List<ticket> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID  Where PassengerID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, PassengerID);
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
                                        rs.getInt("CompartmentNumber"),
                                        new train(rs.getInt("TrainID"), rs.getString("TrainScheduleTime"), rs.getString("TrainName"), rs.getInt("NumberOfSeat"), new location(rs.getInt("StartLocationID"), rs.getString("StartLocationName"), rs.getString("StartLocationDescription")), new location(rs.getInt("ArrivalLocationID"), rs.getString("ArrivalLocationName"), rs.getString("ArrivalLocationDescription")))), rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive"), rs.getInt("Status"),rs.getString("TicketCode")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ticket getNewestTicketCreated(int PassengerID) {
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID  Where PassengerID=? ORDER BY TicketID DESC LIMIT 1""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, PassengerID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ticket(rs.getInt("TicketID"),
                        rs.getInt("PassengerID"),
                        new ticketClass(rs.getInt("TicketClassID"),
                                rs.getString("CategoryName")),
                        rs.getString("PurchaseDate"),
                        rs.getDouble("TicketPrice"),
                        new seat(rs.getInt("SeatID"),
                                new compartment(rs.getInt("CompartmentID"),
                                        rs.getInt("CompartmentNumber"),
                                        new train(rs.getInt("TrainID"), rs.getString("TrainScheduleTime"), rs.getString("TrainName"), rs.getInt("NumberOfSeat"), new location(rs.getInt("StartLocationID"), rs.getString("StartLocationName"), rs.getString("StartLocationDescription")), new location(rs.getInt("ArrivalLocationID"), rs.getString("ArrivalLocationName"), rs.getString("ArrivalLocationDescription")))), rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive"), rs.getInt("Status"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ticket> getAllTicket(int status) throws SQLException {
        List<ticket> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID  Where t.Status = ?""";

        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, status);
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
                                    rs.getInt("CompartmentNumber"),
                                    new train(rs.getInt("TrainID"), rs.getString("TrainScheduleTime"), rs.getString("TrainName"), rs.getInt("NumberOfSeat"), new location(rs.getInt("StartLocationID"), rs.getString("StartLocationName"), rs.getString("StartLocationDescription")), new location(rs.getInt("ArrivalLocationID"), rs.getString("ArrivalLocationName"), rs.getString("ArrivalLocationDescription")))), rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive"), rs.getInt("Status")));
        }
        return list;
    }

    public int CreateTicket(int accountID, String price_raw, int seatID_raw, String trainScheduleTime, int ticketClass) {
    // Tạo TicketCode trước khi insert
    String ticketCode = generateTicketCode(accountID, seatID_raw, ticketClass);
    
    String sql = " INSERT INTO trainproject.ticket (PassengerID, TicketClassID, "
            + "PurchaseDate, TicketPrice, SeatID, TimeArrive, status, TicketCode) "
            + "VALUES (?, ?, NOW(), ?, ?, ?, 1, ?)";
    int generatedTicketID = -1;

    try (PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        st.setInt(1, accountID);
        st.setInt(2, ticketClass);
        st.setDouble(3, Double.parseDouble(price_raw));
        st.setInt(4, seatID_raw);
        st.setDate(5, Date.valueOf(trainScheduleTime));
        st.setString(6, ticketCode);  // Thêm TicketCode vào câu query
        st.executeUpdate();

        // Get generated keys
        try (ResultSet rs = st.getGeneratedKeys()) {
            if (rs.next()) {
                generatedTicketID = rs.getInt(1);
            }
        }
    } catch (Exception e) {
        System.out.println(e);
    }

    return generatedTicketID;
}

// Thêm phương thức mới để tạo TicketCode
private String generateTicketCode(int accountID, int seatID, int ticketClass) {
    // Get current timestamp
    java.util.Calendar cal = java.util.Calendar.getInstance();
    
    // Format different components:
    // TK: prefix (2 chars)
    // YYMMDDHHmmss: timestamp (12 chars)
    // ACC: last 2 digits of accountID (2 chars)
    // S: last 2 digits of seatID (2 chars)
    // C: ticketClass (1 char)
    // R: random char to ensure uniqueness (1 char)
    
    // Format date and time components
    String year = String.format("%02d", cal.get(java.util.Calendar.YEAR) % 100);
    String month = String.format("%02d", cal.get(java.util.Calendar.MONTH) + 1);
    String day = String.format("%02d", cal.get(java.util.Calendar.DAY_OF_MONTH));
    String hour = String.format("%02d", cal.get(java.util.Calendar.HOUR_OF_DAY));
    String minute = String.format("%02d", cal.get(java.util.Calendar.MINUTE));
    String second = String.format("%02d", cal.get(java.util.Calendar.SECOND));
    
    // Format account, seat and class components
    String accStr = String.format("%02d", accountID % 100);
    String seatStr = String.format("%02d", seatID % 100);
    String classStr = String.format("%d", ticketClass % 10);
    
    // Generate a random character (A-Z)
    char randomChar = (char) ('A' + Math.random() * 26);
    
    // Combine all components to create the 20-character code
    // Format: TK + YYMMDDHHmmss + ACC + S + C + R
    String ticketCode = String.format("TK%s%s%s%s%s%s%s%s%s%c",
            year, month, day,     // Date (6 chars)
            hour, minute, second, // Time (6 chars)
            accStr,              // Account (2 chars)
            seatStr,             // Seat (2 chars)
            classStr,            // Class (1 char)
            randomChar);         // Random char (1 char)
    
    return ticketCode;
}
public ticket getTicketByCodeAndPhone(String ticketCode, String phone) {
    String sql = """
                 select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                  z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                  from ticket t 
                  left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                  left join seat s on s.SeatID=t.SeatID 
                  left join compartment cm on s.compartmentID = cm.CompartmentID 
                  left join train tr on tr.TrainID=cm.TrainID 
                  left join location l on l.LocationID = tr.StartLocationID 
                  left join location z on z.LocationID = tr.ArrivalLocationID
                  left join passenger p on p.PassengerID = t.PassengerID
                  Where t.TicketCode=? AND p.PhoneNumber=?""";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, ticketCode);
        st.setString(2, phone);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new ticket(rs.getInt("TicketID"),
                    rs.getInt("PassengerID"),
                    new ticketClass(rs.getInt("TicketClassID"),
                            rs.getString("CategoryName")),
                    rs.getString("PurchaseDate"),
                    rs.getDouble("TicketPrice"),
                    new seat(rs.getInt("SeatID"),
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
                            rs.getString("SeatNumber"), 
                            rs.getString("SeatType"), 
                            rs.getInt("AvailabilityStatus")), 
                    rs.getString("TimeArrive"), 
                    rs.getInt("Status"));
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return null;
}
    public void CreatePayment(int tkid, String bank, int PassengerID,
            String price_raw) {
        String sql = " INSERT INTO trainproject.payment (TicketID,PassengerID, PaymentMethod, "
                + "PaymentDate, Amount)"
                + "VALUES (?,?, ?, NOW(), ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tkid);
            st.setInt(2, PassengerID);
            st.setString(3, bank);
            st.setDouble(4, Double.parseDouble(price_raw));

            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public ticket getTicketbyTicketID(int ticketID) {
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from ticket t left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID  Where TicketID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, ticketID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ticket(rs.getInt("TicketID"),
                        rs.getInt("PassengerID"),
                        new ticketClass(rs.getInt("TicketClassID"),
                                rs.getString("CategoryName")),
                        rs.getString("PurchaseDate"),
                        rs.getDouble("TicketPrice"),
                        new seat(rs.getInt("SeatID"),
                                new compartment(rs.getInt("CompartmentID"),
                                        rs.getInt("CompartmentNumber"),
                                        new train(rs.getInt("TrainID"), rs.getString("TrainScheduleTime"), rs.getString("TrainName"), rs.getInt("NumberOfSeat"), new location(rs.getInt("StartLocationID"), rs.getString("StartLocationName"), rs.getString("StartLocationDescription")), new location(rs.getInt("ArrivalLocationID"), rs.getString("ArrivalLocationName"), rs.getString("ArrivalLocationDescription")))), rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive"), rs.getInt("Status"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        // Example ticket code and phone to test
        String ticketCode = "TK241109014";
        String phone = "0967851333";
        
        // Instantiate the TicketDAO with the already established connection
        TicketDAO ticketDAO = new TicketDAO();
        
        // Fetch the ticket
        System.out.println(ticketDAO.generateTicketCode(1, 1, 2));
    }
}

