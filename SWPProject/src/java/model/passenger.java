/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class passenger {
    private int passengerID;
    private String name;
    private String email;
    private int age;
    private String Address;
    private int phoneNumber;

    public passenger(int passengerID, String name, String email, int age, String Address, int phoneNumber) {
        this.passengerID = passengerID;
        this.name = name;
        this.email = email;
        this.age = age;
        this.Address = Address;
        this.phoneNumber = phoneNumber;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "passenger{" + "passengerID=" + passengerID + ", name=" + name + ", email=" + email + ", age=" + age + ", Address=" + Address + ", phoneNumber=" + phoneNumber + '}';
    }
    
}
