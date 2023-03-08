/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface ProductsDaoInterface {

    /**
     *
     * @return
     */
    public List<products> ListAllProducts();
    
    public products searchbyname(String Name);
    
    public products searchbyId(String Name);
    
    public products CreateProdut();
    
    public double getTotalCartPrice(ArrayList<Cart> cartList);
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList);
}
