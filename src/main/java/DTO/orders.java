/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author kian2
 */
public class orders {
     private int UserId  ;
    private String ProductId ;
    private String TrackingId;
    private int Paid;
     private double Price;
    private Date OrderDate;

    public orders() {
    }

    public orders(int UserId, String ProductId, String TrackingId, int Paid, double Price, Date OrderDate) {
        this.UserId = UserId;
        this.ProductId = ProductId;
        this.TrackingId = TrackingId;
        this.Paid = Paid;
        this.Price = Price;
        this.OrderDate = OrderDate;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public String getTrackingId() {
        return TrackingId;
    }

    public void setTrackingId(String TrackingId) {
        this.TrackingId = TrackingId;
    }

    public int getPaid() {
        return Paid;
    }

    public void setPaid(int Paid) {
        this.Paid = Paid;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.UserId;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final orders other = (orders) obj;
        if (this.UserId != other.UserId) {
            return false;
        }
        return Objects.equals(this.ProductId, other.ProductId);
    }
    
    
}
