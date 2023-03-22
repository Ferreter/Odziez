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
public class orders {
     
    private String firstname ;
    private String lastname;
    private String email;
    private String address1;
    private String address2;
    private String country;
    private String state;
    private String zipcode;
    private String cardNumber;
    private String expiry;
    private String cvv;
    double total;
    

    public orders() {
    }

    public orders( String firstname, String lastname,String email, String address1, String address2, String country, String state, String zipcode, String cardNumber, String expiry, String cvv, double total) {
       
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.address1 = address1;
        this.address2 = address2;
        this.country = country;
        this.state = state;
        this.zipcode = zipcode;
        this.cardNumber = cardNumber;
        this.expiry = expiry;
        this.cvv = cvv;
        this.total = total;
    }

   

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiry() {
        return expiry;
    }

    public void setExpiry(String expiry) {
        this.expiry = expiry;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
    
    
}