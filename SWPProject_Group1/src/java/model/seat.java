/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class seat{
    private int seatID;
    private compartment compartment;
    private String seatNumber;
    private String seatType;
    private int availabilityStatus;
    private int compartmentID;

    public seat(int seatID, compartment compartment, String seatNumber, String seatType, int availabilityStatus) {
        this.seatID = seatID;
        this.compartment = compartment;
        this.seatNumber = seatNumber;
        this.seatType = seatType;
        this.availabilityStatus = availabilityStatus;
    }
    public seat(int seatID, int compartmentID, String seatNumber, String seatType, int availabilityStatus) {
        this.seatID = seatID;
        this.compartmentID = compartmentID;
        this.seatNumber = seatNumber;
        this.seatType = seatType;
        this.availabilityStatus = availabilityStatus;
    }
    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public compartment getCompartment() {
        return compartment;
    }

    public void setCompartment(compartment compartment) {
        this.compartment = compartment;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public int getAvailabilityStatus() {
        return availabilityStatus;
    }

    public void setAvailabilityStatus(int availabilityStatus) {
        this.availabilityStatus = availabilityStatus;
    }

    public int getCompartmentID() {
        return compartmentID;
    }

    public void setCompartmentID(int compartmentID) {
        this.compartmentID = compartmentID;
    }

    @Override
    public String toString() {
        return "seat{" + "seatID=" + seatID + ", compartmentID=" + compartment + ", seatNumber=" + seatNumber + ", seatType=" + seatType + ", availabilityStatus=" + availabilityStatus + '}';
    }
    
    
}
