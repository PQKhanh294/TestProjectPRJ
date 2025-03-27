/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author TU
 */
public class Order {
   private int ID, UserID ; 
   private double TotalAmount;
   private String status;
   private LocalDate OrderDate;

    public Order() {
    }

    public Order(int ID, int UserID, double TotalAmount, String status, LocalDate OrderDate) {
        this.ID = ID;
        this.UserID = UserID;
        this.TotalAmount = TotalAmount;
        this.status = status;
        this.OrderDate = OrderDate;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public double getTotalAmount() {
        return TotalAmount;
    }

    public void setTotalAmount(double TotalAmount) {
        this.TotalAmount = TotalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(LocalDate OrderDate) {
        this.OrderDate = OrderDate;
    }

    @Override
    public String toString() {
        return "Order{" + "ID=" + ID + ", UserID=" + UserID + ", TotalAmount=" + TotalAmount + ", status=" + status + ", OrderDate=" + OrderDate + '}';
    }
   
   
}
