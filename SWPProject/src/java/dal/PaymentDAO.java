/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author My Asus
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.compartment;
import model.location;
import model.passenger;
import model.seat;
import model.ticket;
import model.ticketClass;
import model.train;
import model.payment;

public class PaymentDAO extends DBContext {

    public List<payment> getPaymentByPassengerID(int PassengerID) {
        List<payment> list = new ArrayList<>();
        String sql = """
                     select *, l.LocationName As StartLocationName, l.Description as StartLocationDescription,
                      z.LocationName As ArrivalLocationName, z.Description as ArrivalLocationDescription
                      
                     from payment p 
                     left join ticket t on p.TicketID=t.TicketID 
                     left join passenger pa on pa.PassengerID=p.PassengerID
                     left Join ticketclass d On t.TicketClassID=d.TicketClassID 
                     left join seat s on s.SeatID=t.SeatID 
                     left join compartment cm on s.compartmentID = cm.CompartmentID 
                     left join train tr on tr.TrainID=cm.TrainID 
                     left join location l on l.LocationID = tr.StartLocationID 
                     left join location z on z.LocationID = tr.ArrivalLocationID where p.PassengerID=?;""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, PassengerID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new payment(PassengerID,
                        new ticket(rs.getInt("TicketID"),
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
                                        rs.getString("SeatNumber"), rs.getString("SeatType"), rs.getInt("AvailabilityStatus")), rs.getString("TimeArrive")),
                        new passenger(PassengerID, rs.getString("Name"), rs.getString("Email"), rs.getInt("Age"), rs.getString("Address"), rs.getString("PhoneNumber")),
                        rs.getString("PaymentMethod"),
                        rs.getString("PaymentDate"),
                        rs.getDouble("Amount")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        PaymentDAO dao = new PaymentDAO();
        System.out.println(dao.getPaymentByPassengerID(1));
    }
}
