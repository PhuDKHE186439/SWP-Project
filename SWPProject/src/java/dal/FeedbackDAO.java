package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.feedback;

public class FeedbackDAO extends DBContext {
    
    // Method to get all feedback records (if needed)
    public List<feedback> getAllFeedback() {
        List<feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.feedback";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                feedbackList.add(new feedback(
                        rs.getInt("FeedbackID"),
                        rs.getString("Message"),
                        rs.getInt("PassengerID"),
                        rs.getString("SubmissionDate")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    // Method to create a new feedback record
    public void createFeedback(feedback newFeedback) {
        String sql = "INSERT INTO trainproject.feedback (Message, PassengerID, SubmissionDate) VALUES (?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newFeedback.getMessage());
            st.setInt(2, newFeedback.getPassengerID());
            st.setString(3, newFeedback.getSubmissionDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to update an existing feedback record
    public void updateFeedback(feedback updatedFeedback) {
        String sql = "UPDATE trainproject.feedback SET Message = ?, PassengerID = ?, SubmissionDate = ? WHERE FeedbackID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, updatedFeedback.getMessage());
            st.setInt(2, updatedFeedback.getPassengerID());
            st.setString(3, updatedFeedback.getSubmissionDate());
            st.setInt(4, updatedFeedback.getFeedbackID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to delete a feedback record
    public void deleteFeedback(int feedbackID) {
        String sql = "DELETE FROM trainproject.feedback WHERE FeedbackID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, feedbackID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    // Method to get feedback based on search criteria and sorting
    public List<feedback> getFeedbackBySearchAndSort(String search, String sortOrder, int currentPage, int recordsPerPage) {
        List<feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.feedback WHERE Message LIKE ?";

        // Add sorting condition
        if ("latest".equalsIgnoreCase(sortOrder)) {
            sql += " ORDER BY SubmissionDate DESC";
        } else if ("oldest".equalsIgnoreCase(sortOrder)) {
            sql += " ORDER BY SubmissionDate ASC";
        }

        sql += " LIMIT ?, ?";
        
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + search + "%"); // Use wildcard search
            st.setInt(2, (currentPage - 1) * recordsPerPage);
            st.setInt(3, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                feedbackList.add(new feedback(
                    rs.getInt("FeedbackID"),
                    rs.getString("Message"),
                    rs.getInt("PassengerID"),
                    rs.getString("SubmissionDate")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    // Method to count total feedback records for pagination
    public int getTotalFeedbackCount(String search) {
        int totalRecords = 0;
        String sql = "SELECT COUNT(*) FROM trainproject.feedback WHERE Message LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + search + "%"); // Use wildcard search
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalRecords;
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<feedback> list = dao.getAllFeedback();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i + ": " + list.get(i));
        }
    }
}
