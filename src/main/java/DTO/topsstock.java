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
public class topsstock {
    
    private String TopsId;
    private int S;
    private int M;
    private int L;
    private int XL;

    public topsstock() {
    }

    public topsstock(String TopsId, int S, int M, int L, int XL) {
        this.TopsId = TopsId;
        this.S = S;
        this.M = M;
        this.L = L;
        this.XL = XL;
    }

    public String getTopsId() {
        return TopsId;
    }

    public void setTopsId(String TopsId) {
        this.TopsId = TopsId;
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
        hash = 13 * hash + Objects.hashCode(this.TopsId);
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
        final topsstock other = (topsstock) obj;
        return Objects.equals(this.TopsId, other.TopsId);
    }
    
    
    
}
