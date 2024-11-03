/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import java.util.ArrayList;
import model.Discount;

/**
 *
 * @author P C
 */

import model.Discount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO extends DBContext {
    
    public List<Discount> getAllDiscounts() {
        List<Discount> discountList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.discount_code ORDER BY DiscountID DESC";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                discountList.add(extractDiscountFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getAllDiscounts: " + e.getMessage());
        }
        return discountList;
    }

    public boolean addDiscount(Discount discount) {
        String sql = "INSERT INTO trainproject.discount_code (Code, DiscountPercent, StartDate, EndDate, Status, MaxUsage, CurrentUsage) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, discount.getCode());
            st.setDouble(2, discount.getDiscountPercent());
            st.setDate(3, new java.sql.Date(discount.getStartDate().getTime()));
            st.setDate(4, new java.sql.Date(discount.getEndDate().getTime()));
            st.setInt(5, discount.getStatus());
            st.setInt(6, discount.getMaxUsage());
            st.setInt(7, discount.getCurrentUsage());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in addDiscount: " + e.getMessage());
            return false;
        }
    }

    public boolean toggleDiscountStatus(int discountId) {
        String sql = "UPDATE trainproject.discount_code SET Status = CASE WHEN Status = 1 THEN 0 ELSE 1 END WHERE DiscountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, discountId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in toggleDiscountStatus: " + e.getMessage());
            return false;
        }
    }

    public Discount getDiscountByCode(String code) {
        String sql = "SELECT * FROM trainproject.discount_code WHERE Code = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return extractDiscountFromResultSet(rs);
            }
        } catch (SQLException e) {
            System.out.println("Error in getDiscountByCode: " + e.getMessage());
        }
        return null;
    }

    public boolean updateDiscountUsage(int discountId) {
        String sql = "UPDATE trainproject.discount_code SET CurrentUsage = CurrentUsage + 1 WHERE DiscountID = ? AND CurrentUsage < MaxUsage";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, discountId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in updateDiscountUsage: " + e.getMessage());
            return false;
        }
    }

    public boolean isDiscountValid(String code) {
        String sql = "SELECT * FROM trainproject.discount_code WHERE Code = ? AND Status = 1 " +
                    "AND CURRENT_DATE BETWEEN StartDate AND EndDate " +
                    "AND CurrentUsage < MaxUsage";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Error in isDiscountValid: " + e.getMessage());
            return false;
        }
    }

    private Discount extractDiscountFromResultSet(ResultSet rs) throws SQLException {
        Discount discount = new Discount();
        discount.setDiscountID(rs.getInt("DiscountID"));
        discount.setCode(rs.getString("Code"));
        discount.setDiscountPercent(rs.getDouble("DiscountPercent"));
        discount.setStartDate(rs.getDate("StartDate"));
        discount.setEndDate(rs.getDate("EndDate"));
        discount.setStatus(rs.getInt("Status"));
        discount.setMaxUsage(rs.getInt("MaxUsage"));
        discount.setCurrentUsage(rs.getInt("CurrentUsage"));
        return discount;
    }
}
