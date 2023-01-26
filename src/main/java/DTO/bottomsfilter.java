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
public class bottomsfilter {
    private String BottomsId;
    private int S;
    private int M;
    private int L;
    private int XL;

    public bottomsfilter() {
    }

    public bottomsfilter(String BottomsId, int S, int M, int L, int XL) {
        this.BottomsId = BottomsId;
        this.S = S;
        this.M = M;
        this.L = L;
        this.XL = XL;
    }

    public String getBottomsId() {
        return BottomsId;
    }

    public void setBottomsId(String BottomsId) {
        this.BottomsId = BottomsId;
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
        int hash = 3;
        hash = 67 * hash + Objects.hashCode(this.BottomsId);
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
        final bottomsfilter other = (bottomsfilter) obj;
        return Objects.equals(this.BottomsId, other.BottomsId);
    }
    
    
}
