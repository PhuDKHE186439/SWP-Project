package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.feedback;
//Chay 2 Dong lenh benh duoi de add them cot FeedbackType
//ALTER TABLE `trainproject`.`feedback` 
//ADD COLUMN `FeedbackType` VARCHAR(45) NULL AFTER `SubmissionDate`;
public class FeedbackDAO extends DBContext {

    // Method to get all feedback records
    public List<feedback> getAllFeedback() {
        List<feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.feedback ORDER BY SubmissionDate DESC";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                feedbackList.add(extractFeedbackFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getAllFeedback: " + e.getMessage());
        }
        return feedbackList;
    }

    // Method to get feedback based on search criteria and sorting
    public List<feedback> getFeedbackBySearchAndSort(String search, String sortOrder, int currentPage, int recordsPerPage) {
        List<feedback> feedbackList = new ArrayList<>();

        // Clean and prepare search terms
        String[] searchTerms = prepareSearchTerms(search);

        // Build dynamic SQL query based on search terms
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trainproject.feedback WHERE 1=1");
        if (searchTerms.length > 0) {
            sqlBuilder.append(" AND (");
            for (int i = 0; i < searchTerms.length; i++) {
                if (i > 0) {
                    sqlBuilder.append(" OR ");
                }
                sqlBuilder.append("(Message LIKE ? OR ")
                        .append("CAST(FeedbackID AS CHAR) LIKE ? OR ")
                        .append("CAST(PassengerID AS CHAR) LIKE ? OR ")
                        .append("SubmissionDate LIKE ?)");
            }
            sqlBuilder.append(")");
        }

        // Add sorting condition
        sqlBuilder.append(" ORDER BY SubmissionDate ");
        sqlBuilder.append("oldest".equalsIgnoreCase(sortOrder) ? "ASC" : "DESC");

        // Add pagination
        sqlBuilder.append(" LIMIT ?, ?");

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 1;

            // Set search parameters
            for (String term : searchTerms) {
                String searchPattern = "%" + term + "%";
                for (int i = 0; i < 4; i++) { // 4 parameters for each term
                    st.setString(paramIndex++, searchPattern);
                }
            }

            // Set pagination parameters
            st.setInt(paramIndex++, (currentPage - 1) * recordsPerPage);
            st.setInt(paramIndex, recordsPerPage);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                feedbackList.add(extractFeedbackFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getFeedbackBySearchAndSort: " + e.getMessage());
        }
        return feedbackList;
    }

    // Method to count total feedback records for pagination
    public int getTotalFeedbackCount(String search) {
        int totalRecords = 0;

        // Clean and prepare search terms
        String[] searchTerms = prepareSearchTerms(search);

        // Build dynamic SQL query based on search terms
        StringBuilder sqlBuilder = new StringBuilder("SELECT COUNT(*) FROM trainproject.feedback WHERE 1=1");
        if (searchTerms.length > 0) {
            sqlBuilder.append(" AND (");
            for (int i = 0; i < searchTerms.length; i++) {
                if (i > 0) {
                    sqlBuilder.append(" OR ");
                }
                sqlBuilder.append("(Message LIKE ? OR ")
                        .append("CAST(FeedbackID AS CHAR) LIKE ? OR ")
                        .append("CAST(PassengerID AS CHAR) LIKE ? OR ")
                        .append("SubmissionDate LIKE ?)");
            }
            sqlBuilder.append(")");
        }

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 1;

            // Set search parameters
            for (String term : searchTerms) {
                String searchPattern = "%" + term + "%";
                for (int i = 0; i < 4; i++) { // 4 parameters for each term
                    st.setString(paramIndex++, searchPattern);
                }
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error in getTotalFeedbackCount: " + e.getMessage());
        }
        return totalRecords;
    }

    // Method to create a new feedback record
    public boolean createFeedback(feedback newFeedback) {
        String sql = "INSERT INTO trainproject.feedback (Message, PassengerID, SubmissionDate) VALUES (?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newFeedback.getMessage());
            st.setInt(2, newFeedback.getPassengerID());
            st.setString(3, newFeedback.getSubmissionDate());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in createFeedback: " + e.getMessage());
            return false;
        }
    }

    public boolean createFeedback(String message, int passengerID, String date, String feedbacktype) {
        String sql = "INSERT INTO trainproject.feedback (Message, PassengerID, SubmissionDate, FeedbackType) VALUES (?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, message);
            st.setInt(2, passengerID);
            st.setString(3, date);
            st.setString(4, feedbacktype);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in createFeedback: " + e.getMessage());
            return false;
        }
    }

    // Method to update an existing feedback record
    public boolean updateFeedback(feedback updatedFeedback) {
        String sql = "UPDATE trainproject.feedback SET Message = ?, PassengerID = ?, SubmissionDate = ? WHERE FeedbackID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, updatedFeedback.getMessage());
            st.setInt(2, updatedFeedback.getPassengerID());
            st.setString(3, updatedFeedback.getSubmissionDate());
            st.setInt(4, updatedFeedback.getFeedbackID());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in updateFeedback: " + e.getMessage());
            return false;
        }
    }

    // Method to delete a feedback record
    public boolean deleteFeedback(int feedbackID) {
        String sql = "DELETE FROM trainproject.feedback WHERE FeedbackID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, feedbackID);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in deleteFeedback: " + e.getMessage());
            return false;
        }
    }

    // Helper method to prepare search terms
    private String[] prepareSearchTerms(String search) {
        if (search == null || search.trim().isEmpty()) {
            return new String[0];
        }

        // Split by spaces and filter out empty terms
        return search.trim().split("\\s+");
    }

    // Helper method to extract feedback from ResultSet
    private feedback extractFeedbackFromResultSet(ResultSet rs) throws SQLException {
        return new feedback(
                
                rs.getInt("FeedbackID"),
                rs.getString("Message"),
                rs.getInt("PassengerID"),
                rs.getString("SubmissionDate"),
                rs.getString("FeedbackType")
        );
    }

    public List<feedback> getFeedbackBySearchAndSortBugs(String search, String sortOrder, int currentPage, int recordsPerPage, String feedbacktype) {
        List<feedback> feedbackList = new ArrayList<>();

        // Clean and prepare search terms
        String[] searchTerms = prepareSearchTerms(search);

        // Build dynamic SQL query based on search terms
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trainproject.feedback WHERE FeedbackType=?");
        if (searchTerms.length > 0) {
            sqlBuilder.append(" AND (");
            for (int i = 0; i < searchTerms.length; i++) {
                if (i > 0) {
                    sqlBuilder.append(" OR ");
                }
                sqlBuilder.append("(Message LIKE ? OR ")
                        .append("CAST(FeedbackID AS CHAR) LIKE ? OR ")
                        .append("CAST(PassengerID AS CHAR) LIKE ? OR ")
                        .append("SubmissionDate LIKE ?)");
            }
            sqlBuilder.append(")");
        }

        // Add sorting condition
        sqlBuilder.append(" ORDER BY SubmissionDate ");
        sqlBuilder.append("oldest".equalsIgnoreCase(sortOrder) ? "ASC" : "DESC");

        // Add pagination
        sqlBuilder.append(" LIMIT ?, ?");

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 2;

            // Set search parameters
            for (String term : searchTerms) {
                String searchPattern = "%" + term + "%";
                for (int i = 1; i < 4; i++) { // 4 parameters for each term
                    st.setString(paramIndex++, searchPattern);
                }
            }

            // Set pagination parameters
            st.setInt(paramIndex++, (currentPage - 1) * recordsPerPage);
            st.setInt(paramIndex, recordsPerPage);
            st.setString(1, feedbacktype);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                feedbackList.add(extractFeedbackFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getFeedbackBySearchAndSort: " + e.getMessage());
        }
        return feedbackList;
    }
    // Main method for testing purposes
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();

        // Test search functionality
//        System.out.println("Testing search functionality:");
        List<feedback> searchResults = dao.getFeedbackBySearchAndSort("", "latest", 1, 5);
//        for (feedback f : searchResults) {
System.out.println(searchResults);
//            System.out.println(f);
//        }
//        
//        // Test counting with search
//        System.out.println("\nTesting count functionality:");
//        int count = dao.getTotalFeedbackCount("test search");
//        System.out.println("Total records found: " + count);
//        dao.createFeedback("Hello", 3, LocalDate.now().toString());
//        System.out.println(dao.getAllFeedback());
    


    }
}
