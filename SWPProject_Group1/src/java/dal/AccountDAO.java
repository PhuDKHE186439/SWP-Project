package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.account;
import EnCrypt.BCrypt;
import model.SendGoogle;

/**
 *
 * @author My Asus
 */
public class AccountDAO extends DBContext {
    
    public List<account> getAccountPaging(int currentPage, int recordsPerPage) {
        List<account> list = new ArrayList<>();


        // Build dynamic SQL query based on search terms
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trainproject.account");
       
        // Add pagination
        sqlBuilder.append(" LIMIT ?, ?");

        try (PreparedStatement st = connection.prepareStatement(sqlBuilder.toString())) {
            int paramIndex = 1;
            // Set pagination parameters
            st.setInt(paramIndex++, (currentPage - 1) * recordsPerPage);
            st.setInt(paramIndex, recordsPerPage);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new account(
                        rs.getInt("AccountID"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getInt("RoleID"),
                        rs.getInt("PassengerID"),
                        rs.getString("Status") // Fetch status from the database
                ));
            }
        } catch (Exception e) {
            System.out.println("Error in getFeedbackBySearchAndSort: " + e.getMessage());
        }
        return list;
    }
    
    public List<account> getAllAccount() {
        List<account> list = new ArrayList<>();
        String sql = "SELECT * FROM trainproject.account"; // Ensure your SQL query includes the status field
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new account(
                        rs.getInt("AccountID"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getInt("RoleID"),
                        rs.getInt("PassengerID"),
                        rs.getString("Status") // Fetch status from the database
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public account getAccountByID(int accountID) {
        String sql = "SELECT * FROM trainproject.account WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new account(
                        rs.getInt("AccountID"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getInt("RoleID"),
                        rs.getInt("PassengerID"),
                        rs.getString("Status") // Include status
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public account getAccountByUsername(String username) {
        String sql = "SELECT * FROM trainproject.account WHERE Username = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new account(
                        rs.getInt("AccountID"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getInt("RoleID"),
                        rs.getInt("PassengerID"),
                        rs.getString("Status") // Include status
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void registerAccount(String phoneNumber, String username, String password, String email, int roleID, int PassengerID) {
        String sql = "INSERT INTO Account (PhoneNumber, Username, Password, Email, RoleID, PassengerID, Status) VALUES (?, ?, ?, ?, ?, ?, 'Active')";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, phoneNumber);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setInt(5, roleID);
            st.setInt(6, PassengerID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void registerAccountAD(String phoneNumber, String username, String password, String email, int roleID) {
        String sql = "INSERT INTO Account (PhoneNumber, Username, Password, Email, RoleID, Status) VALUES ( ?, ?, ?, ?, ?, 'Active')";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, phoneNumber);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setInt(5, roleID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAccountStatus(int accountID, String status) {
        String sql = "UPDATE trainproject.account SET Status = ? WHERE AccountID = ?"; // Use the correct table
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setInt(2, accountID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAccountInformEmailPhone(int PassengerID, String email, String phone) {
        String sql = "UPDATE Account SET Email=?, PhoneNumber=? WHERE PassengerID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, email);
            st.setString(2, phone);
            st.setInt(3, PassengerID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAccountPassword(int accountID, String password) {
        String sql = "UPDATE account SET Password = ? WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, password);
            st.setInt(2, accountID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public account getLastAccount() {
        String sql = "SELECT * FROM account ORDER BY AccountID DESC LIMIT 1;";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new account(
                        rs.getInt("AccountID"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getInt("RoleID"),
                        rs.getInt("PassengerID"),
                        rs.getString("Status") // Include status
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateAccount(account acc) {
        String sql = "UPDATE trainproject.account SET PhoneNumber = ?, Username = ?, Email = ?, RoleID = ? WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, acc.getPhoneNumber());
            st.setString(2, acc.getUsername());
            st.setString(3, acc.getEmail());
            st.setInt(4, acc.getRoleID()); // Updated to include RoleID
            st.setInt(5, acc.getAccountID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteAccount(int accountID) {
        String sql = "DELETE FROM trainproject.account WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public boolean accountExists(String email, String phoneNumber) {
    String sql = "SELECT COUNT(*) FROM accounts WHERE email = ? OR phoneNumber = ?";
    try (PreparedStatement ae = connection.prepareStatement(sql)){
        
        ae.setString(1, email);
        ae.setString(2, phoneNumber);
        
        ResultSet rs = ae.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            System.out.println("Duplicate check count: " + count); // Debug output
            return count > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    public SendGoogle GetEmail() {
        String sql = "Select * From  sendgmailaccount";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new SendGoogle(
                        rs.getString("Gmail"),
                        rs.getString("Password")
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        List<account> acclist = dao.getAllAccount();
        String s = BCrypt.hashpw("abc", BCrypt.gensalt());
    }
}
