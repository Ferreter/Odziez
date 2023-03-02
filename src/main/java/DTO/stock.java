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
public class stock {
     private String ProductId;
    private int XS;
    private int S;
    private int M;
    private int L;
    private int XL;

    public stock() {
    }

    public stock(String ProductId, int XS, int S, int M, int L, int XL) {
        this.ProductId = ProductId;
        this.XS = XS;
        this.S = S;
        this.M = M;
        this.L = L;
        this.XL = XL;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public int getXS() {
        return XS;
    }

    public void setXS(int XS) {
        this.XS = XS;
    }

    public int getS() {
        return S;
    }

    public void setS(int S) {
        this.S = S;
    }

    public int getM() {
        return M;
    }

    public void setM(int M) {
        this.M = M;
    }

    public int getL() {
        return L;
    }

    public void setL(int L) {
        this.L = L;
    }

    public int getXL() {
        return XL;
    }

    public void setXL(int XL) {
        this.XL = XL;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 73 * hash + Objects.hashCode(this.ProductId);
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
        final stock other = (stock) obj;
        return true;
    }
    
    
}
