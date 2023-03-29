/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.address;

/**
 *
 * @author Dell
 */
public interface AddressDaoInterface {
     
    public  int searchbyUserId(int UserId);
     public boolean addNewAddress(address u);
     public address AddressByUserId(int UserId);
}
