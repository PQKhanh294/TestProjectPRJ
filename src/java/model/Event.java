package model;

import java.sql.Date;
import java.sql.Time;

public class Event {
    private int eventID;
    private String eventName;
    private String eventImage;
    private Date eventDate;
    private Time eventTime;
    private String eventLocation;
    private String eventDescription;
    private String eventUrl;

    public Event() {
    }

    public Event(int eventID, String eventName, String eventImage, Date eventDate, Time eventTime, String eventLocation, String eventDescription, String eventUrl) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.eventImage = eventImage;
        this.eventDate = eventDate;
        this.eventTime = eventTime;
        this.eventLocation = eventLocation;
        this.eventDescription = eventDescription;
        this.eventUrl = eventUrl;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventImage() {
        return eventImage;
    }

    public void setEventImage(String eventImage) {
        this.eventImage = eventImage;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public Time getEventTime() {
        return eventTime;
    }

    public void setEventTime(Time eventTime) {
        this.eventTime = eventTime;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getEventUrl() {
        return eventUrl;
    }

    public void setEventUrl(String eventUrl) {
        this.eventUrl = eventUrl;
    }

    @Override
    public String toString() {
        return "Event{" + "eventID=" + eventID + ", eventName=" + eventName + ", eventImage=" + eventImage + ", eventDate=" + eventDate + ", eventTime=" + eventTime + ", eventLocation=" + eventLocation + ", eventDescription=" + eventDescription + ", eventUrl=" + eventUrl + '}';
    }

}