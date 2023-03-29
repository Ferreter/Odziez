/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.OrderDetails;

import java.util.List;

/**
 *
 * @author Khali
 */
public interface OrderDetailsDaoInterface {
     public boolean addOrderDetails(OrderDetails u);
     public List<OrderDetails> findOrderDetailsById(int UserId);
}
