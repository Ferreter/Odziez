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
    /**

Adds an order detail to the system.
@param u The order detail object to be added.
@return True if the order detail was successfully added, false otherwise.
*/
     public boolean addOrderDetails(OrderDetails u);
     /**

Finds order details by user ID.
@param UserId The ID of the user.
@return A list of order details associated with the specified user ID.
*/
     public List<OrderDetails> findOrderDetailsById(int UserId);
}
