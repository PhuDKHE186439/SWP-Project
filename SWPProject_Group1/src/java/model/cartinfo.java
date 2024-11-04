/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class cartinfo {
    private seat seat;
    private int accountID;
    private account acc;

    public cartinfo(seat seat, int accountID, account acc) {
        this.seat = seat;
        this.accountID = accountID;
        this.acc = acc;
    }

    public account getAcc() {
        return acc;
    }

    public void setAcc(account acc) {
        this.acc = acc;
    }

    public seat getSeat() {
        return seat;
    }

    public void setSeat(seat seat) {
        this.seat = seat;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "cartinfo{" + "seat=" + seat + ", accountID=" + accountID + ", acc=" + acc + '}';
    }


    
}
