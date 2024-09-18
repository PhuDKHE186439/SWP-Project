/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class account {
    private int accountID;
    private String phoneNumber;
    private String username;
    private String password;
    private String email;
    private int roleID;
    private int passengerID;

    public account(int accountID, String phoneNumber, String username, String password, String email, int roleID, int passengerID) {
        this.accountID = accountID;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.password = password;
        this.email = email;
        this.roleID = roleID;
        this.passengerID = passengerID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    @Override
    public String toString() {
        return "account{" + "accountID=" + accountID + ", phoneNumber=" + phoneNumber + ", username=" + username + ", password=" + password + ", email=" + email + ", roleID=" + roleID + ", passengerID=" + passengerID + '}';
    }
    
}
