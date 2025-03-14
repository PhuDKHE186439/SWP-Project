package dal;

import model.Discount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO extends DBContext {
    
    // Existing methods
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

    // New method for paginated and filtered results
    public List<Discount> getDiscounts(String searchCode, String status, int page, int itemsPerPage) {
        List<Discount> discountList = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT * FROM trainproject.discount_code WHERE 1=1"
        );
        List<Object> params = new ArrayList<>();
        
        // Add search conditions
        if (searchCode != null && !searchCode.trim().isEmpty()) {
            sql.append(" AND Code = ?");
            params.add(searchCode.trim());
        }
        
        if (status != null && !status.trim().isEmpty()) {
            sql.append(" AND Status = ?");
            params.add(Integer.parseInt(status));
        }
        
        // Add pagination
        sql.append(" ORDER BY DiscountID DESC LIMIT ? OFFSET ?");
        params.add(itemsPerPage);
        params.add((page - 1) * itemsPerPage);
        
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                setParameter(st, i + 1, params.get(i));
            }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                discountList.add(extractDiscountFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getDiscounts: " + e.getMessage());
        }
        return discountList;
    }

    // New method to get total count for pagination
    public int getTotalDiscounts(String searchCode, String status) {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(*) FROM trainproject.discount_code WHERE 1=1"
        );
        List<Object> params = new ArrayList<>();
        
        if (searchCode != null && !searchCode.trim().isEmpty()) {
            sql.append(" AND Code = ?");
            params.add(searchCode.trim());
        }
        
        if (status != null && !status.trim().isEmpty()) {
            sql.append(" AND Status = ?");
            params.add(Integer.parseInt(status));
        }
        
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                setParameter(st, i + 1, params.get(i));
            }
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error in getTotalDiscounts: " + e.getMessage());
        }
        return 0;
    }

    // New method for updating discount
    public boolean updateDiscount(Discount discount) {
        String sql = "UPDATE trainproject.discount_code SET Code = ?, DiscountPercent = ?, " +
                    "StartDate = ?, EndDate = ?, MaxUsage = ? WHERE DiscountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, discount.getCode());
            st.setDouble(2, discount.getDiscountPercent());
            st.setDate(3, new java.sql.Date(discount.getStartDate().getTime()));
            st.setDate(4, new java.sql.Date(discount.getEndDate().getTime()));
            st.setInt(5, discount.getMaxUsage());
            st.setInt(6, discount.getDiscountID());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in updateDiscount: " + e.getMessage());
            return false;
        }
    }

    // New method for deleting discount
    public boolean deleteDiscount(int discountId) {
        String sql = "DELETE FROM trainproject.discount_code WHERE DiscountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, discountId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in deleteDiscount: " + e.getMessage());
            return false;
        }
    }

    // Existing methods remain unchanged
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

    // Helper method for setting parameters
    private void setParameter(PreparedStatement st, int index, Object value) throws SQLException {
        if (value instanceof String) {
            st.setString(index, (String) value);
        } else if (value instanceof Integer) {
            st.setInt(index, (Integer) value);
        } else if (value instanceof Double) {
            st.setDouble(index, (Double) value);
        } else if (value instanceof Date) {
            st.setDate(index, (Date) value);
        }
    }
}