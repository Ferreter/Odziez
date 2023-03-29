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
   private int OrderId;
   private int UserId;
   private int AddressId;
    double total;
    private String Status;

    public orders() {
    }

    public orders(int OrderId, int UserId, int AddressId, double total) {
        this.OrderId = OrderId;
        this.UserId = UserId;
        this.AddressId = AddressId;
        this.total = total;
        
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    

   
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getAddressId() {
        return AddressId;
    }

    public void setAddressId(int AddressId) {
        this.AddressId = AddressId;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }
    

    
    
    
}