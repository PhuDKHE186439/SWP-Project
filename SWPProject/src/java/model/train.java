/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class train {
    private int trainID;
    private String trainScheduleTime;
    private String trainName;
    private int numberOfSeat;
    private location startLocation;
    private location arrivalLocation;

    public train(int trainID, String trainScheduleTime, String trainName, int numberOfSeat, location startLocationID, location arrivalLocationID) {
        this.trainID = trainID;
        this.trainScheduleTime = trainScheduleTime;
        this.trainName = trainName;
        this.numberOfSeat = numberOfSeat;
        this.startLocation = startLocation;
        this.arrivalLocation = arrivalLocation;
    }

    public int getTrainID() {
        return trainID;
    }

    public void setTrainID(int trainID) {
        this.trainID = trainID;
    }

    public String getTrainScheduleTime() {
        return trainScheduleTime;
    }

    public void setTrainScheduleTime(String trainScheduleTime) {
        this.trainScheduleTime = trainScheduleTime;
    }

    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public int getNumberOfSeat() {
        return numberOfSeat;
    }

    public void setNumberOfSeat(int numberOfSeat) {
        this.numberOfSeat = numberOfSeat;
    }

    public location getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(location startLocation) {
        this.startLocation = startLocation;
    }

    public location getArrivalLocation() {
        return arrivalLocation;
    }

    public void setArrivalLocation(location arrivalLocation) {
        this.arrivalLocation = arrivalLocation;
    }



    @Override
    public String toString() {
        return "train{" + "trainID=" + trainID + ", trainScheduleTime=" + trainScheduleTime + ", trainName=" + trainName + ", numberOfSeat=" + numberOfSeat + ", startLocationID=" + startLocation + ", arrivalLocationID=" + arrivalLocation + '}';
    }
    
}
