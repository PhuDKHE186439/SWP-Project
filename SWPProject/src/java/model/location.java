/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author My Asus
 */
public class location {
    private int locationID;
    private String locationName;
    private String Description;

    public location(int locationID, String locationName, String Description) {
        this.locationID = locationID;
        this.locationName = locationName;
        this.Description = Description;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "location{" + "locationID=" + locationID + ", locationName=" + locationName + ", Description=" + Description + '}';
    }
    
}
