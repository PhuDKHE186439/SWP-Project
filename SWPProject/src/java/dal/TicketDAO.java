/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ticket;

/**
 *
 * @author ThinkPro
 */
public class TicketDAO extends DBContext {

    public int CreateTicket(int accountID, String price_raw,
            String seatID_raw, String trainScheduleTime, int cp, int cpn) {
        String sql = " INSERT INTO trainproject.ticket (PassengerID, TicketClassID, "
                + "PurchaseDate, TicketPrice, SeatID, TimeArrive, status, "
                + "CompartmentID, CompartmentNumber) "
                + "VALUES (?, 1, NOW(), ?, ?, ?, 0, ?, ?)";
        int generatedTicketID = -1;

        // Use Statement.RETURN_GENERATED_KEYS to retrieve generated keys
        try (PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, accountID);
            st.setDouble(2, Double.parseDouble(price_raw));
            st.setInt(3, Integer.parseInt(seatID_raw));
            st.setDate(4, java.sql.Date.valueOf(trainScheduleTime));
            st.setInt(5, cp);
            st.setInt(6, cpn);
            st.executeUpdate();

            // Get generated keys
            try (ResultSet rs = st.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedTicketID = rs.getInt(1); // Get the first column in the ResultSet
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return generatedTicketID;
    }

    public void CreatePayment(int tkid, String bank,
            String price_raw, String fullName, String email, String phone) {
        String sql = " INSERT INTO trainproject.payment (TicketID, PaymentMethod, "
                + "PaymentDate, Amount, "
                + "Fullname, Phone, Email) "
                + "VALUES (?, ?, NOW(), ?, ?, ?,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tkid);
            st.setString(2, bank);
            st.setDouble(3, Double.parseDouble(price_raw));
            st.setString(4, fullName);
            st.setString(5, phone);
            st.setString(6, email);

            st.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<ticket> getAllTicket(int index, int recout_per_page,
            String key, int status) throws SQLException {
        List<ticket> list = new ArrayList<>();

        TrainDAO td = new TrainDAO();
        String sql = " SELECT * FROM trainproject.ticket where status = ?";
        if (key != null && !key.isEmpty()) {
            sql += " AND TicketPrice LIKE ?";
        }
        sql += " LIMIT ? OFFSET ?;";
        System.out.println(sql);
        PreparedStatement st = connection.prepareStatement(sql);
        int id = 1;
        st.setInt(id++, status);
        if (key != null && !key.isEmpty()) {
            st.setString(id++, "'%" + key + "%'");
        }
        st.setInt(id++, (index - 1) * recout_per_page);
        st.setInt(id++, recout_per_page);
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
            t.setCompartment(td.getCompartmentById(rs.getInt(9)));
            t.setSeat(td.getSeatById(rs.getInt(6)));
            list.add(t);
        }
        return list;
    }

    public int countByCondition(String key, int status) {
        String sql = " SELECT count(*) FROM trainproject.ticket "
                + " WHERE status = ?";
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

    public List<ticket> getAllTicket(int status) throws SQLException {
        List<ticket> list = new ArrayList<>();

        TrainDAO td = new TrainDAO();
        String sql = " SELECT * FROM trainproject.ticket where status = ?";

        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, status);
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
            t.setCompartment(td.getCompartmentById(rs.getInt(9)));
            t.setSeat(td.getSeatById(rs.getInt(6)));
            list.add(t);
        }
        return list;
    }

    public List<ticket> getTickets(int userId) throws SQLException {
        List<ticket> list = new ArrayList<>();

        TrainDAO td = new TrainDAO();
        String sql = " SELECT * FROM trainproject.ticket where PassengerID = ?";

        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, userId);
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
            t.setCompartment(td.getCompartmentById(rs.getInt(9)));
            t.setSeat(td.getSeatById(rs.getInt(6)));
            list.add(t);
        }
        return list;
    }

}
