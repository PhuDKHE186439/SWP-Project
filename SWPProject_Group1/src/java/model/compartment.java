/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class compartment {
    private int compartmentID;
    private int compartmentNumber;
    private train train;

    public compartment(int compartmentID, int compartmentNumber, train trainID) {
        this.compartmentID = compartmentID;
        this.compartmentNumber = compartmentNumber;
        this.train = trainID;
    }

    public int getCompartmentID() {
        return compartmentID;
    }

    public void setCompartmentID(int compartmentID) {
        this.compartmentID = compartmentID;
    }

    public int getCompartmentNumber() {
        return compartmentNumber;
    }

    public void setCompartmentNumber(int compartmentNumber) {
        this.compartmentNumber = compartmentNumber;
    }

    public train getTrain() {
        return train;
    }

    public void setTrain(train trainID) {
        this.train = trainID;
    }

    @Override
    public String toString() {
        return "compartment{" + "compartmentID=" + compartmentID + ", compartmentNumber=" + compartmentNumber + ", trainID=" + train + '}';
    }
    
}
