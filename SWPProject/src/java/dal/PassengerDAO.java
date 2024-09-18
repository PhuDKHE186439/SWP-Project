/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;

/**
 *
 * @author My Asus
 */
public class PassengerDAO extends DBContext {

    public void insertPassengerInformation(int passengerID, String name, String email,int age, String address, String phoneNumber) {
        String sql = "INSERT INTO Account (AccountID, PhoneNumber, Username, Password, Email, RoleID,PassengerID) VALUES (?,?,?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, passengerID);
            st.setString(2, name);
            st.setString(3, email);
            st.setInt(4, age);
            st.setString(5, address);
            st.setString(6, phoneNumber);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
