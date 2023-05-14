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
    /**

Adds an order to the system.
@param u The order object to be added.
@return True if the order was successfully added, false otherwise.
*/
    public boolean addOrder(orders u);
    /**

Retrieves the last index of the orders.
@return The last index of the orders.
*/
    public int getLastIndex() ;
    /**

Finds orders by user ID.
@param UserId The ID of the user.
@return A list of orders associated with the specified user ID.
*/
    public List<orders> findOrdersByUserId(int UserId);
    /**

Finds orders by order ID.
@param ordersId The ID of the order.
@return A list of orders matching the specified order ID.
*/
    public List<orders> findOrdersByOrderId(int ordersId);
    /**

Changes the status of an order.
@param Id The ID of the order.
@param Changed The new status of the order.
@return True if the status was successfully changed, false otherwise.
*/
    public boolean ChangeStatus(int Id,String Changed);
    /**

Retrieves all orders in the system.
@return A list containing all orders.
*/
     public List<orders> AllOrders();

}
