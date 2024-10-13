package dal;

import model.News;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO extends DBContext {

    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.news ORDER BY created_at DESC";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                newsList.add(extractNewsFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getAllNews: " + e.getMessage());
        }
        return newsList;
    }

    public List<News> getNewsBySearchAndSort(String search, String sortOrder, String status, int currentPage, int recordsPerPage) {
    List<News> newsList = new ArrayList<>();
    String[] searchTerms = prepareSearchTerms(search);

    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM news WHERE 1=1");

    // Add status filter if it's provided
    if (status != null && !status.isEmpty()) {
        sqlBuilder.append(" AND status = ?");
    }

    if (searchTerms.length > 0) {
        sqlBuilder.append(" AND (");
        for (int i = 0; i < searchTerms.length; i++) {
            if (i > 0) sqlBuilder.append(" OR ");
            sqlBuilder.append("(title LIKE ? OR content LIKE ? OR location LIKE ?)");
        }
        sqlBuilder.append(")");
    }

    sqlBuilder.append(" ORDER BY created_at ").append("oldest".equalsIgnoreCase(sortOrder) ? "ASC" : "DESC");
    sqlBuilder.append(" LIMIT ?, ?");

    try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
        int paramIndex = 1;

        // Set the status parameter if applicable
        if (status != null && !status.isEmpty()) {
            st.setInt(paramIndex++, Integer.parseInt(status));
        }

        for (String term : searchTerms) {
            String searchPattern = "%" + term + "%";
            for (int i = 0; i < 3; i++) {
                st.setString(paramIndex++, searchPattern);
            }
        }

        st.setInt(paramIndex++, (currentPage - 1) * recordsPerPage);
        st.setInt(paramIndex, recordsPerPage);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            newsList.add(extractNewsFromResultSet(rs));
        }
    } catch (SQLException e) {
        System.out.println("Error in getNewsBySearchAndSort: " + e.getMessage());
    }
    return newsList;
}


   public int getTotalNewsCount(String search, String status) {
    int totalRecords = 0;
    String[] searchTerms = prepareSearchTerms(search);

    StringBuilder sqlBuilder = new StringBuilder("SELECT COUNT(*) FROM trainproject.news WHERE 1=1");

    // Add status filter if it's provided
    if (status != null && !status.isEmpty()) {
        sqlBuilder.append(" AND status = ?");
    }

    // Add search terms filter
    if (searchTerms.length > 0) {
        sqlBuilder.append(" AND (");
        for (int i = 0; i < searchTerms.length; i++) {
            if (i > 0) sqlBuilder.append(" OR ");
            sqlBuilder.append("(title LIKE ? OR content LIKE ? OR location LIKE ?)");
        }
        sqlBuilder.append(")");
    }

    try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
        int paramIndex = 1;

        // Set the status parameter if applicable
        if (status != null && !status.isEmpty()) {
            st.setInt(paramIndex++, Integer.parseInt(status));
        }

        // Set search term parameters
        for (String term : searchTerms) {
            String searchPattern = "%" + term + "%";
            for (int i = 0; i < 3; i++) {
                st.setString(paramIndex++, searchPattern);
            }
        }

        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            totalRecords = rs.getInt(1);
        }
    } catch (SQLException e) {
        System.out.println("Error in getTotalNewsCount: " + e.getMessage());
    }
    return totalRecords;
}


    public boolean create(News news) {
        String sql = "INSERT INTO trainproject.news (title, content, image, location, status, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, news.getTitle());
            st.setString(2, news.getContent());
            st.setString(3, news.getImage());
            st.setString(4, news.getLocation());
            st.setInt(5, news.getStatus());
            st.setTimestamp(6, news.getCreated_at());
            st.setTimestamp(7, news.getUpdated_at());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in create: " + e.getMessage());
            return false;
        }
    }

    public News read(int id) {
        String sql = "SELECT * FROM news WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return extractNewsFromResultSet(rs);
            }
        } catch (SQLException e) {
            System.out.println("Error in read: " + e.getMessage());
        }
        return null;
    }

    public boolean update(News news) {
        String sql = "UPDATE news SET title = ?, content = ?, image = ?, location = ?, status = ?, updated_at = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, news.getTitle());
            st.setString(2, news.getContent());
            st.setString(3, news.getImage());
            st.setString(4, news.getLocation());
            st.setInt(5, news.getStatus());
            st.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            st.setInt(7, news.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in update: " + e.getMessage());
            return false;
        }
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM news WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in delete: " + e.getMessage());
            return false;
        }
    }

    private String[] prepareSearchTerms(String search) {
        if (search == null || search.trim().isEmpty()) {
            return new String[0];
        }
        return search.trim().split("\\s+");
    }

    private News extractNewsFromResultSet(ResultSet rs) throws SQLException {
        return new News(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getString("content"),
            rs.getString("image"),
            rs.getString("location"),
            rs.getInt("status"),
            rs.getTimestamp("created_at"),
            rs.getTimestamp("updated_at")
        );
    }
}