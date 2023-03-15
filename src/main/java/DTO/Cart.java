
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Objects;

/**
 *
 * @author kian2
 */
public class Cart extends products{

    
     private int userId;
    private String ProductId;
    private int Quantity;
    private double Price;
    private double Total;
    

    public Cart() {

   
    
}
    public Cart(int userId, String ProductId, int Quantity, double Price, double Total){
        this.userId = userId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Total = Total;
        
    
    }
   

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

   
    
}