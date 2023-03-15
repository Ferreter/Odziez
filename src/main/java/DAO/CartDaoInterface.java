/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Cart;
import java.util.List;

/**
 *
 * @author Khali
 */
public interface CartDaoInterface {
  
    
     public boolean addCart(Cart u);
     
     public List<Cart> ListAllCart(int userid);
    
}

