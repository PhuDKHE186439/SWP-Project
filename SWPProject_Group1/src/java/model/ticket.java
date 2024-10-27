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
    private ticketClass ticketClass;
    private String purchaseDate;
    private double ticketPrice;
    private int compartmentID;
    private seat seat;
    private String timeArrive;
    private int Status;

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public ticket(int ticketID, int passengerID, ticketClass ticketClassID, String purchaseDate, double ticketPrice, seat seat, String timeArrive, int status) {
        this.ticketID = ticketID;
        this.passengerID = passengerID;
        this.ticketClass = ticketClassID;
        this.purchaseDate = purchaseDate;
        this.ticketPrice = ticketPrice;
        this.seat = seat;
        this.timeArrive = timeArrive;
        this.Status = status;
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

    public ticketClass getTicketClass() {
        return ticketClass;
    }

    public void setTicketClass(ticketClass ticketClassID) {
        this.ticketClass = ticketClassID;
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

    public seat getSeat() {
        return seat;
    }

    public void setSeat(seat seatID) {
        this.seat = seatID;
    }


    public String getTimeArrive() {
        return timeArrive;
    }

    public void setTimeArrive(String timeArrive) {
        this.timeArrive = timeArrive;
    }

    @Override
    public String toString() {
        return "ticket{" + "ticketID=" + ticketID + ", passengerID=" + passengerID + ", ticketClassID=" + ticketClass + ", purchaseDate=" + purchaseDate + ", ticketPrice=" + ticketPrice + ", compartmentID=" + compartmentID + ", seatID=" + seat  + ", timeArrive=" + timeArrive + '}';
    }
    
}
