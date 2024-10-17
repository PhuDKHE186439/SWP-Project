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
        String processedSearch = processSearchString(search);
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trainproject.news WHERE 1=1");

        if (status != null && !status.isEmpty()) {
            sqlBuilder.append(" AND status = ?");
        }

        if (!processedSearch.isEmpty()) {
            sqlBuilder.append(" AND (LOWER(title) LIKE ? OR LOWER(content) LIKE ? OR LOWER(location) LIKE ?)");
        }

        sqlBuilder.append(" ORDER BY created_at ").append("oldest".equalsIgnoreCase(sortOrder) ? "ASC" : "DESC");
        sqlBuilder.append(" LIMIT ? OFFSET ?");

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 1;

            if (status != null && !status.isEmpty()) {
                st.setInt(paramIndex++, Integer.parseInt(status));
            }

            if (!processedSearch.isEmpty()) {
                String searchPattern = "%" + processedSearch.replace("+", "%") + "%";
                for (int i = 0; i < 3; i++) {
                    st.setString(paramIndex++, searchPattern.toLowerCase());
                }
            }

            st.setInt(paramIndex++, recordsPerPage);
            st.setInt(paramIndex, (currentPage - 1) * recordsPerPage);

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
        String processedSearch = processSearchString(search);

        StringBuilder sqlBuilder = new StringBuilder("SELECT COUNT(*) FROM trainproject.news WHERE 1=1");

        if (status != null && !status.isEmpty()) {
            sqlBuilder.append(" AND status = ?");
        }

        if (!processedSearch.isEmpty()) {
            sqlBuilder.append(" AND (LOWER(title) LIKE ? OR LOWER(content) LIKE ? OR LOWER(location) LIKE ?)");
        }

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 1;

            if (status != null && !status.isEmpty()) {
                st.setInt(paramIndex++, Integer.parseInt(status));
            }

            if (!processedSearch.isEmpty()) {
                String searchPattern = "%" + processedSearch.replace("+", "%") + "%";
                for (int i = 0; i < 3; i++) {
                    st.setString(paramIndex++, searchPattern.toLowerCase());
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

    private String processSearchString(String search) {
        if (search == null) return "";
        // Trim leading and trailing spaces, replace one or more spaces with a single +
        return search.trim().replaceAll("\\s+", "+");
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
        String sql = "SELECT * FROM trainproject.news WHERE id = ?";
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
        String sql = "UPDATE trainproject.news SET title = ?, content = ?, image = ?, location = ?, status = ?, updated_at = ? WHERE id = ?";
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
        String sql = "DELETE FROM trainproject.news WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error in delete: " + e.getMessage());
            return false;
        }
    }

    public List<News> getLatestNews(int limit) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.news ORDER BY created_at DESC LIMIT ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                newsList.add(extractNewsFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getLatestNews: " + e.getMessage());
        }
        return newsList;
    }

    public List<News> getRandomNewsWithStatus1(int limit) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.news WHERE status = 1 ORDER BY RAND() LIMIT ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                newsList.add(extractNewsFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error in getRandomNewsWithStatus1: " + e.getMessage());
        }
        return newsList;
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

    public News getLatestNews() {
        String sql = "SELECT * FROM trainproject.news ORDER BY id DESC LIMIT 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return extractNewsFromResultSet(rs);
            }
        } catch (SQLException e) {
            System.out.println("Error in getLatestNews: " + e.getMessage());
        }
        return null; // Return null if no news found
    }
}