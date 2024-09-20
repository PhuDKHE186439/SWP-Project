/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class otpQuestion {
    private int accountID;
    private String otpQuestion;;
    private String otpAnswer;

    public otpQuestion(int accountID, String otpQuestion, String otpAnswer) {
        this.accountID = accountID;
        this.otpQuestion = otpQuestion;
        this.otpAnswer = otpAnswer;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getOtpQuestion() {
        return otpQuestion;
    }

    public void setOtpQuestion(String otpQuestion) {
        this.otpQuestion = otpQuestion;
    }

    public String getOtpAnswer() {
        return otpAnswer;
    }

    public void setOtpAnswer(String otpAnswer) {
        this.otpAnswer = otpAnswer;
    }

    @Override
    public String toString() {
        return "otpQuestion{" + "accountID=" + accountID + ", otpQuestion=" + otpQuestion + ", otpAnswer=" + otpAnswer + '}';
    }
    
}
