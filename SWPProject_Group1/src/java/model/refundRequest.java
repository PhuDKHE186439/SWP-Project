/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class refundRequest {
    private int refundID;
    private int ticketID;
    private int passengerID;
    private int status;
    private String message;

    public refundRequest(int refundID, int ticketID, int passengerID, int status, String message) {
        this.refundID = refundID;
        this.ticketID = ticketID;
        this.passengerID = passengerID;
        this.status = status;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    
    public int getRefundID() {
        return refundID;
    }

    public void setRefundID(int refundID) {
        this.refundID = refundID;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "refundRequest{" + "refundID=" + refundID + ", ticketID=" + ticketID + ", passengerID=" + passengerID + ", status=" + status + '}';
    }
    
}
