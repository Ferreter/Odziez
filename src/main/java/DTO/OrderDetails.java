/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author Dell
 */
public class OrderDetails {
    
    
   
    private int orderId;

    private String productName;
    private String Size;
    private double productPrice;
    private int quantity;
    
    

    public OrderDetails() {
        
    }
    
    public OrderDetails( int orderId, String productName, String Size, double productPrice, int quantity) {
        
        this.orderId = orderId;
        this.productName = productName;
        this.Size = Size;
        this.productPrice = productPrice;
        this.quantity = quantity;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

  

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
