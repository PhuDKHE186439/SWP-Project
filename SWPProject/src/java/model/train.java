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
    private String numberOfSeat;
    private int startLocationID;
    private int arrivalLocationID;

    public train(int trainID, String trainScheduleTime, String trainName, String numberOfSeat, int startLocationID, int arrivalLocationID) {
        this.trainID = trainID;
        this.trainScheduleTime = trainScheduleTime;
        this.trainName = trainName;
        this.numberOfSeat = numberOfSeat;
        this.startLocationID = startLocationID;
        this.arrivalLocationID = arrivalLocationID;
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

    public String getNumberOfSeat() {
        return numberOfSeat;
    }

    public void setNumberOfSeat(String numberOfSeat) {
        this.numberOfSeat = numberOfSeat;
    }

    public int getStartLocationID() {
        return startLocationID;
    }

    public void setStartLocationID(int startLocationID) {
        this.startLocationID = startLocationID;
    }

    public int getArrivalLocationID() {
        return arrivalLocationID;
    }

    public void setArrivalLocationID(int ArrivalLocationID) {
        this.arrivalLocationID = ArrivalLocationID;
    }

    @Override
    public String toString() {
        return "train{" + "trainID=" + trainID + ", trainScheduleTime=" + trainScheduleTime + ", trainName=" + trainName + ", numberOfSeat=" + numberOfSeat + ", startLocationID=" + startLocationID + ", arrivalLocationID=" + arrivalLocationID + '}';
    }
    
}
