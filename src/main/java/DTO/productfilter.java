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
public class productfilter {
     private String ProductId;
    private String Colour;
    private double Style;
    private double Printed;
    private String Length;
    private String Occasion;
    private String Fit;
    private String NeckLine;
    private String Material;

    public productfilter() {
    }

    public productfilter(String ProductId, String Colour, double Style, double Printed, String Length, String Occasion, String Fit, String NeckLine, String Material) {
        this.ProductId = ProductId;
        this.Colour = Colour;
        this.Style = Style;
        this.Printed = Printed;
        this.Length = Length;
        this.Occasion = Occasion;
        this.Fit = Fit;
        this.NeckLine = NeckLine;
        this.Material = Material;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public String getColour() {
        return Colour;
    }

    public void setColour(String Colour) {
        this.Colour = Colour;
    }

    public double getStyle() {
        return Style;
    }

    public void setStyle(double Style) {
        this.Style = Style;
    }

    public double getPrinted() {
        return Printed;
    }

    public void setPrinted(double Printed) {
        this.Printed = Printed;
    }

    public String getLength() {
        return Length;
    }

    public void setLength(String Length) {
        this.Length = Length;
    }

    public String getOccasion() {
        return Occasion;
    }

    public void setOccasion(String Occasion) {
        this.Occasion = Occasion;
    }

    public String getFit() {
        return Fit;
    }

    public void setFit(String Fit) {
        this.Fit = Fit;
    }

    public String getNeckLine() {
        return NeckLine;
    }

    public void setNeckLine(String NeckLine) {
        this.NeckLine = NeckLine;
    }

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String Material) {
        this.Material = Material;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Objects.hashCode(this.ProductId);
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
        final productfilter other = (productfilter) obj;
        return true;
    }
    
    
}
