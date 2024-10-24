/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author My Asus
 */
public class compartment {
    private int compartmentID;
    private int compartmentNumber;
    private int trainID;
    private train train;
    public List<seat> Seats;

    public train getTrain() {
        return train;
    }

    public void setTrain(train Train) {
        this.train = Train;
    }

    public List<seat> getSeats() {
        return Seats;
    }

    public void setSeats(List<seat> Seats) {
        this.Seats = Seats;
    }

    public compartment() {
    }
    
    
    

    public compartment(int compartmentID, int compartmentNumber, int trainID) {
        this.compartmentID = compartmentID;
        this.compartmentNumber = compartmentNumber;
        this.trainID = trainID;
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

    public int getTrainID() {
        return trainID;
    }

    public void setTrainID(int trainID) {
        this.trainID = trainID;
    }

    @Override
    public String toString() {
        return "compartment{" + "compartmentID=" + compartmentID + ", compartmentNumber=" + compartmentNumber + ", trainID=" + trainID + '}';
    }
    
}
