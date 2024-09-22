/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.passenger;

/**
 *
 * @author My Asus
 */
public class PassengerDAO extends DBContext {

    public void insertPassengerInformation(String name, String email, int age, String address, String phoneNumber) {
        String sql = "INSERT INTO Passenger ( Name, Email, Age, Address, PhoneNumber) VALUES (?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, name);
            st.setString(2, email);
            st.setInt(3, age);
            st.setString(4, address);
            st.setString(5, phoneNumber);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public passenger getPassengerByID(int passengerID) {
        String sql = "SELECT * FROM Passenger WHERE PassengerID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, passengerID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new passenger(rs.getInt("PassengerID"), rs.getString("Name"), rs.getString("Email"), rs.getInt("Age"), rs.getString("Address"), rs.getString("PhoneNumber"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePassengerInform(int PassengerID, String name, int age, String address, String phoneNumber) {
        String sql = "UPDATE passenger SET Name=?, Age=?,Address=?,PhoneNumber=? WHERE PassengerID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, name);
            st.setInt(2, age);
            st.setString(3, address);
            st.setString(4, phoneNumber);
            st.setInt(5, PassengerID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void updatePassengerInformEmail(int PassengerID, String email) {
        String sql = "UPDATE passenger SET Email=? WHERE PassengerID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, email);
            st.setInt(2, PassengerID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public passenger getLastPassenger() {
        String sql = "SELECT * FROM Passenger ORDER BY PassengerID DESC LIMIT 1;";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new passenger(rs.getInt("PassengerID"), rs.getString("Name"), rs.getString("Email"), rs.getInt("Age"), rs.getString("Address"), rs.getString("PhoneNumber"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        PassengerDAO dao = new PassengerDAO();
        System.out.println("");
        dao.updatePassengerInformEmail(5, "Dude99@gmail.com");
    }
}
