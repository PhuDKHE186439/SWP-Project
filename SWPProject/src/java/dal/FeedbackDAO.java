

    package dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.feedback;

public class FeedbackDAO extends DBContext{

    
    // Method to get all feedback records
    public  List<feedback> getAllFeedback() {
        List<feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.feedback"; // Ensure the table and fields exist

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
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List list = dao.getAllFeedback();
        for(int i = 0; i < list.size(); i++){
            System.out.println(i + ": " + list.get(i));
        }
    }
    // You can add other CRUD (Create, Read, Update, Delete) methods as necessary
}


    
