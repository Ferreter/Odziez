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
     
   private int UserId;
   private int AddressId;
    double total;
    

    public orders() {
    }

    public orders(int UserId, int AddressId,  double total) {
       
        this.UserId = UserId;
        this.AddressId = AddressId;
        this.total = total;
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
    

    
    
    
}