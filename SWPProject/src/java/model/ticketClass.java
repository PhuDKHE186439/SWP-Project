/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class ticketClass {
    private int ticketClassID;
    private String categoryName;

    public ticketClass(int ticketClassID, String categoryName) {
        this.ticketClassID = ticketClassID;
        this.categoryName = categoryName;
    }

    public int getTicketClassID() {
        return ticketClassID;
    }

    public void setTicketClassID(int ticketClassID) {
        this.ticketClassID = ticketClassID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
}
