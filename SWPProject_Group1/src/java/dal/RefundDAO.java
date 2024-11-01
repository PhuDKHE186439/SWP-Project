/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.refundRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author My Asus
 */
public class RefundDAO extends DBContext {

    public List<refundRequest> getAllRefundRequest() {
        List<refundRequest> list = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.refundrequest";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new refundRequest(rs.getInt("refundID"), rs.getInt("passengerID"), rs.getInt("ticketid"), rs.getInt("status"), rs.getString("message")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void AddRefundRequest(int passengerid, int ticketid, int status, String message) {
        String sql = "INSERT INTO refundrequest (passengerID, ticketid, status, message) VALUES (?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, passengerid);
            st.setInt(2, ticketid);
            st.setInt(3, status);
            st.setString(4, message);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void UpdateRefundStatus(int refundid,int status) {
        String sql = "UPDATE refundrequest Set status = ? WHERE refundid=?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, status);
            st.setInt(2, refundid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void UpdateRefundTicketStatus(int ticketid,int status) {
        String sql = "UPDATE refundrequest Set status = ? WHERE ticketid=?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, status);
            st.setInt(2, ticketid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
