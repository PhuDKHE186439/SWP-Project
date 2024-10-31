/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class feedback {
    private int feedbackID;
    private String message;
    private int passengerID;
    private String passengerName;
    private String passengerPhone;
    private String submissionDate;
    private String feedbackType;
    private boolean status;

    public feedback(int feedbackID, String message, int passengerID, String submissionDate, String FeedbackType, boolean Status) {
        this.feedbackID = feedbackID;
        this.message = message;
        this.passengerID = passengerID;
        this.submissionDate = submissionDate;
        this.feedbackType = FeedbackType;
        this.status = Status;
    }

    public String getFeedbackType() {
        return feedbackType;
    }

    public void setFeedbackType(String FeedbackType) {
        this.feedbackType = FeedbackType;
    }

     

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public String getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(String submissionDate) {
        this.submissionDate = submissionDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "feedback{" 
                + "feedbackID=" + feedbackID 
                + ", message=" + message 
                + ", passengerID=" + passengerID 
                + ", submissionDate=" + submissionDate 
                + ", FeedbackType=" + feedbackType 
                + ", status=" + (status ? "Finish" : "In Order") + '}';
    }


    
}
