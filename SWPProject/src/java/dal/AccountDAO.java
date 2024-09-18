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
    public List<account> getAllAccount(){
        List<account> list = new ArrayList<>();
        String sql = "select * from account";
        try(PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new account(rs.getInt("AccountID"),rs.getString("PhoneNumber"),rs.getString("Username"),rs.getString("Password"),rs.getString("Email"),rs.getInt("RoleID"),rs.getInt("PassengerID")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
        public void registerAccount(int accountID, String phoneNumber, String username, String password, String email, int roleID, int passengerID) {
        String sql = "INSERT INTO Account (AccountID, PhoneNumber, Username, Password, Email, RoleID,PassengerID) VALUES (?,?,?,?,?,?,?)";
        try(PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, accountID);
            st.setString(2, phoneNumber);
            st.setString(3, username);
            st.setString(4, password);
            st.setString(5, email);
            st.setInt(6, roleID);
            st.setInt(7, passengerID);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAllAccount());
    }
}
