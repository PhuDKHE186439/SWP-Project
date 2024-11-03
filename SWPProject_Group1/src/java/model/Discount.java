package model;

import java.util.Date;

public class Discount {
    private int discountID;
    private String code;
    private double discountPercent;
    private Date startDate;
    private Date endDate;
    private int status;
    private int maxUsage;
    private int currentUsage;

    public Discount() {
    }

    public Discount(int discountID, String code, double discountPercent, Date startDate, Date endDate, int status, int maxUsage, int currentUsage) {
        this.discountID = discountID;
        this.code = code;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.maxUsage = maxUsage;
        this.currentUsage = currentUsage;
    }

    // Getters and Setters
    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getMaxUsage() {
        return maxUsage;
    }

    public void setMaxUsage(int maxUsage) {
        this.maxUsage = maxUsage;
    }

    public int getCurrentUsage() {
        return currentUsage;
    }

    public void setCurrentUsage(int currentUsage) {
        this.currentUsage = currentUsage;
    }

    // Thêm phương thức kiểm tra tính hợp lệ của mã giảm giá
    public boolean isValid() {
        Date currentDate = new Date();
        return status == 1 
               && currentDate.compareTo(startDate) >= 0 
               && currentDate.compareTo(endDate) <= 0
               && currentUsage < maxUsage;
    }

    // Thêm phương thức tính toán số tiền giảm giá
    public double calculateDiscount(double originalPrice) {
        return (originalPrice * discountPercent) / 100.0;
    }
    
}