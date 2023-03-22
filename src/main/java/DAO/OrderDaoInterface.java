/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.orders;

/**
 *
 * @author Khali
 */
public interface OrderDaoInterface {
    
    public boolean addOrder(orders u);
    public int getLastIndex() ;

}
