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
public class bottoms {
    
    private String BottomsId;
    private String Name;
    private String Images;
    private double MRP;
    private String brand;
    private double CPrice;
    private String Description;
    private String Category;
    private String Tags;

    public bottoms() {
    }

    public bottoms(String BottomsId, String Name, String Images, double MRP, String brand, double CPrice, String Description, String Category, String Tags) {
        this.BottomsId = BottomsId;
        this.Name = Name;
        this.Images = Images;
        this.MRP = MRP;
        this.brand = brand;
        this.CPrice = CPrice;
        this.Description = Description;
        this.Category = Category;
        this.Tags = Tags;
    }

    public String getBottomsId() {
        return BottomsId;
    }

    public void setBottomsId(String BottomsId) {
        this.BottomsId = BottomsId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public double getMRP() {
        return MRP;
    }

    public void setMRP(double MRP) {
        this.MRP = MRP;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getCPrice() {
        return CPrice;
    }

    public void setCPrice(double CPrice) {
        this.CPrice = CPrice;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getTags() {
        return Tags;
    }

    public void setTags(String Tags) {
        this.Tags = Tags;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.BottomsId);
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
        final bottoms other = (bottoms) obj;
        return Objects.equals(this.BottomsId, other.BottomsId);
    }
    
    
}
