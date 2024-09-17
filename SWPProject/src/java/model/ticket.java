/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class ticket {
    private int ticketID;
    private int passengerID;
    private int ticketClassID;
    private String purchaseDate;
    private double ticketPrice;
    private int compartmentID;
    private int seatID;
    private int compartmentNumber;
    private String timeArrive;

    public ticket(int ticketID, int passengerID, int ticketClassID, String purchaseDate, double ticketPrice, int compartmentID, int seatID, int compartmentNumber, String timeArrive) {
        this.ticketID = ticketID;
        this.passengerID = passengerID;
        this.ticketClassID = ticketClassID;
        this.purchaseDate = purchaseDate;
        this.ticketPrice = ticketPrice;
        this.compartmentID = compartmentID;
        this.seatID = seatID;
        this.compartmentNumber = compartmentNumber;
        this.timeArrive = timeArrive;
    }

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public int getTicketClassID() {
        return ticketClassID;
    }

    public void setTicketClassID(int ticketClassID) {
        this.ticketClassID = ticketClassID;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getCompartmentID() {
        return compartmentID;
    }

    public void setCompartmentID(int compartmentID) {
        this.compartmentID = compartmentID;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public int getCompartmentNumber() {
        return compartmentNumber;
    }

    public void setCompartmentNumber(int compartmentNumber) {
        this.compartmentNumber = compartmentNumber;
    }

    public String getTimeArrive() {
        return timeArrive;
    }

    public void setTimeArrive(String timeArrive) {
        this.timeArrive = timeArrive;
    }
    
}
