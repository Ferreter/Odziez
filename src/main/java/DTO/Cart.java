
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
public class cart {

    private int UserId;
    private String ProductId;
    private int Quantity;
    private double TotalPrice;

    public cart() {
    }

    public cart(int UserId, String ProductId, int Quantity, double TotalPrice) {
        this.UserId = UserId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.TotalPrice = TotalPrice;
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

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
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
        final cart other = (cart) obj;
        if (this.UserId != other.UserId) {
            return false;
        }
        return Objects.equals(this.ProductId, other.ProductId);
    }

}
