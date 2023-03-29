/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.orders;
import java.util.List;


/**
 *
 * @author Khali
 */
public interface OrderDaoInterface {
    
    public boolean addOrder(orders u);
    public int getLastIndex() ;
    public List<orders> findOrdersByUserId(int UserId);
    public boolean ChangeStatus(int Id,String Changed);
     public List<orders> AllOrders();

}
