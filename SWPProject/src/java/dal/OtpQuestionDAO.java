/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.otpQuestion;
import java.sql.ResultSet;

/**
 *
 * @author My Asus
 */
public class OtpQuestionDAO extends DBContext {

    public void addOTPQuestion(int accountID, String question, String answer) {
        String sql = "INSERT INTO otpquestion (AccountID, OtpQuestion, OtpAnswer) VALUES (?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            st.setString(2, question);
            st.setString(3, answer);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<otpQuestion> getOTPByID(int accountID) {
        List<otpQuestion> list = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.otpquestion Where AccountID=?"; // Ensure your SQL query includes the status field
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new otpQuestion(
                        rs.getInt("AccountID"),
                        rs.getString("OtpQuestion"),
                        rs.getString("OtpAnswer")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}