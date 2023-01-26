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
public class tops {
    
    private String TopsId;
    private String Name;
    private String Images;
    private double MRP;
    private String Brand;
    private double CPrice;
    private String Description;
    private String Category;
    private String Tags;

    public tops() {
    }

    public tops(String TopsId, String Name, String Images, double MRP, String Brand, double CPrice, String Description, String Category, String Tags) {
        this.TopsId = TopsId;
        this.Name = Name;
        this.Images = Images;
        this.MRP = MRP;
        this.Brand = Brand;
        this.CPrice = CPrice;
        this.Description = Description;
        this.Category = Category;
        this.Tags = Tags;
    }
    
    

    public String getTopsId() {
        return TopsId;
    }

    public String getName() {
        return Name;
    }

    public String getImages() {
        return Images;
    }

    public double getMRP() {
        return MRP;
    }

    public String getBrand() {
        return Brand;
    }

    public double getCPrice() {
        return CPrice;
    }

    public String getDescription() {
        return Description;
    }

    public String getCategory() {
        return Category;
    }

    public String getTags() {
        return Tags;
    }

    public void setTopsId(String TopsId) {
        this.TopsId = TopsId;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public void setMRP(double MRP) {
        this.MRP = MRP;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public void setCPrice(double CPrice) {
        this.CPrice = CPrice;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public void setTags(String Tags) {
        this.Tags = Tags;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 43 * hash + Objects.hashCode(this.TopsId);
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
        final tops other = (tops) obj;
        return Objects.equals(this.TopsId, other.TopsId);
    }
    
    
    
}
