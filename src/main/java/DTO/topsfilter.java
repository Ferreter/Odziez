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
public class topsfilter {
    
    private String TopsId;
    private String Printed;
    private String Fit;
    private String NeckLine;
    private String Colour;
    private String Occasion;
    private String Material;

    public topsfilter() {
    }

    public topsfilter(String TopsId, String Printed, String Fit, String NeckLine, String Colour, String Occasion, String Material) {
        this.TopsId = TopsId;
        this.Printed = Printed;
        this.Fit = Fit;
        this.NeckLine = NeckLine;
        this.Colour = Colour;
        this.Occasion = Occasion;
        this.Material = Material;
    }

    public String getTopsId() {
        return TopsId;
    }

    public void setTopsId(String TopsId) {
        this.TopsId = TopsId;
    }

    public String getPrinted() {
        return Printed;
    }

    public void setPrinted(String Printed) {
        this.Printed = Printed;
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

    public String getColour() {
        return Colour;
    }

    public void setColour(String Colour) {
        this.Colour = Colour;
    }

    public String getOccasion() {
        return Occasion;
    }

    public void setOccasion(String Occasion) {
        this.Occasion = Occasion;
    }

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String Material) {
        this.Material = Material;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 67 * hash + Objects.hashCode(this.TopsId);
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
        final topsfilter other = (topsfilter) obj;
        return Objects.equals(this.TopsId, other.TopsId);
    }
    
    
    
}
