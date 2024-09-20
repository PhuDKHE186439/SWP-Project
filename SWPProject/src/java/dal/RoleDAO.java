package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.role;

public class RoleDAO extends DBContext {

    // Method to add a new role
    public void addRole(String roleName) {
        String sql = "INSERT INTO role (RoleName) VALUES (?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, roleName);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to delete a role by ID
    public void deleteRole(int roleID) {
        String sql = "DELETE FROM role WHERE RoleID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, roleID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to update a role by ID
    public void updateRole(int roleID, String newRoleName) {
        String sql = "UPDATE role SET RoleName = ? WHERE RoleID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newRoleName);
            st.setInt(2, roleID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to get all roles
    public List<role> getAllRoles() {
        List<role> roles = new ArrayList<>();
        String sql = "SELECT * FROM role";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                roles.add(new role(rs.getInt("RoleID"), rs.getString("RoleName")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return roles;
    }
    public static void main(String[] args) {
        RoleDAO dao = new RoleDAO();
        List<role> rolelist = dao.getAllRoles();
        System.out.println(dao.getAllRoles());
    }
}
