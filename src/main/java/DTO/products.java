/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author kian2
 */
public class products {
    private String ProductId;
    private String Name;
    private double MRP;
    private double CP;
    private String Description;
    private String Category;
    private String Tags;
    private String Images;
    private String Brand;

    public products() {
    }

    public products(String ProductId, String Name, double MRP, double CP, String Description, String Category, String Tags, String Images, String Brand) {
        this.ProductId = ProductId;
        this.Name = Name;
        this.MRP = MRP;
        this.CP = CP;
        this.Description = Description;
        this.Category = Category;
        this.Tags = Tags;
        this.Images = Images;
        this.Brand = Brand;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getMRP() {
        return MRP;
    }

    public void setMRP(double MRP) {
        this.MRP = MRP;
    }

    public double getCP() {
        return CP;
    }

    public void setCP(double CP) {
        this.CP = CP;
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

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    @Override
    public int hashCode() {
        int hash = 3;
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
        final products other = (products) obj;
        if (!Objects.equals(this.ProductId, other.ProductId)) {
            return false;
        }
        return Objects.equals(this.Name, other.Name);
    }
    
    
    
}
