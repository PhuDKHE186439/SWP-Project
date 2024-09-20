/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.account;

/**
 *
 * @author My Asus
 */
public class AccountDAO extends DBContext {

    public List<account> getAllAccount() {
        List<account> list = new ArrayList();
        String sql = "SELECT * FROM trainproject.account";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new account(rs.getInt("AccountID"), rs.getString("PhoneNumber"), rs.getString("Username"), rs.getString("Password"), rs.getString("Email"), rs.getInt("RoleID"), rs.getInt("PassengerID")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public account getAccountByID(int accouontID) {
        String sql = "SELECT * FROM account WHERE AccountID =?";
        try(PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accouontID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new account(rs.getInt("AccountID"), rs.getString("PhoneNumber"), rs.getString("Username"), rs.getString("Password"), rs.getString("Email"), rs.getInt("RoleID"), rs.getInt("PassengerID"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void registerAccount(String phoneNumber, String username, String password, String email, int roleID, int passengerID) {
        String sql = "INSERT INTO Account (PhoneNumber, Username, Password, Email, RoleID,PassengerID) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, phoneNumber);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setInt(5, roleID);
            st.setInt(6, passengerID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        List<account> acclist = dao.getAllAccount();
        System.out.println(dao.getAccountByID(1).getPassengerID());
    }
}
