/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import dal.LocationDAO;
import java.sql.Time;
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
    
    
     private String status;
    private Time startTime;
    private Time estimatedEndTime;
    private int numberOfCarriages;
    
    private int startLocationID;
    private int arrivalLocationID;

    public train(int trainID, String trainScheduleTime, String trainName, int numberOfSeat, location startLocation, location arrivalLocation) {
        this.trainID = trainID;
        this.trainScheduleTime = trainScheduleTime;
        this.trainName = trainName;
        this.numberOfSeat = numberOfSeat;
        this.startLocation = startLocation;
        this.arrivalLocation = arrivalLocation;
    }
    
    public train(int trainID, String trainScheduleTime, String trainName, int numberOfSeat, int startLocationID, int arrivalLocationID) {
        this.trainID = trainID;
        this.trainScheduleTime = trainScheduleTime;
        this.trainName = trainName;
        this.numberOfSeat = numberOfSeat;
        this.startLocationID = startLocationID;
        this.arrivalLocationID = arrivalLocationID;
    }
    
    public train(int trainID, String trainScheduleTime, String trainName, int numberOfSeat, int startLocationID, int arrivalLocationID, String status,
            Time startTime, Time estimatedEndTime, int numberOfCarriages) {
        this.trainID = trainID;
        this.trainScheduleTime = trainScheduleTime;
        this.trainName = trainName;
        this.numberOfSeat = numberOfSeat;
        this.startLocationID = startLocationID;
        this.arrivalLocationID = arrivalLocationID;
        this.status = status;
        this.startTime = startTime;
        this.estimatedEndTime = estimatedEndTime;
        this.numberOfCarriages = numberOfCarriages;
    }
    
     public train(int trainID, String trainScheduleTime, String trainName, int numberOfSeat, int startLocationID, int arrivalLocationID, LocationDAO locationDAO, String status,
            Time startTime, Time estimatedEndTime, int numberOfCarriages) {
        this(trainID, trainScheduleTime, trainName, numberOfSeat, startLocationID, arrivalLocationID);
        this.status = status;
        this.startTime = startTime;
        this.estimatedEndTime = estimatedEndTime;
        this.numberOfCarriages = numberOfCarriages;
        this.startLocation = locationDAO.getLocationByID(startLocationID);
        this.arrivalLocation = locationDAO.getLocationByID(arrivalLocationID);
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEstimatedEndTime() {
        return estimatedEndTime;
    }

    public void setEstimatedEndTime(Time estimatedEndTime) {
        this.estimatedEndTime = estimatedEndTime;
    }

    public int getNumberOfCarriages() {
        return numberOfCarriages;
    }

    public void setNumberOfCarriages(int numberOfCarriages) {
        this.numberOfCarriages = numberOfCarriages;
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

    public void setArrivalLocationID(int arrivalLocationID) {
        this.arrivalLocationID = arrivalLocationID;
    }



    @Override
    public String toString() {
        return "train{" + "trainID=" + trainID + ", trainScheduleTime=" + trainScheduleTime + ", trainName=" + trainName + ", numberOfSeat=" + numberOfSeat + ", startLocationID=" + startLocation + ", arrivalLocationID=" + arrivalLocation + '}';
    }
    
}
