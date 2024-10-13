/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class payment {
    private int paymentID;
    private ticket ticket;
    private passenger passenger;
    private String paymentMethod;
    private String paymentDate;
    private double amount;

    public payment(int paymentID, ticket ticket, passenger passenger, String paymentMethod, String paymentDate, double amount) {
        this.paymentID = paymentID;
        this.ticket = ticket;
        this.passenger = passenger;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
        this.amount = amount;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public ticket getTicket() {
        return ticket;
    }

    public void setTicket(ticket ticket) {
        this.ticket = ticket;
    }

    public passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(passenger passenger) {
        this.passenger = passenger;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "payment{" + "paymentID=" + paymentID + ", ticketID=" + ticket + ", passengerID=" + passenger + ", paymentMethod=" + paymentMethod + ", paymentDate=" + paymentDate + ", amount=" + amount + '}';
    }
    
}
