/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.OrderDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Khali
 */
public class OrderDetailsDao extends Dao implements OrderDetailsDaoInterface {
    
    public OrderDetailsDao(String dbName) {
        super(dbName);
    }
    
    
    public boolean addOrderDetails(OrderDetails u)  {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
        OrderDetails b = null;
        try {
            con = getConnection();
            
            // not needed to name fields since we are filling it all
            String command = "INSERT INTO orderdetails(orderId, productName, productPrice, quantity) VALUES (?,  ?, ?, ?)";
            ps = con.prepareStatement(command);
           
            ps.setInt(1, u.getOrderId());
            ps.setString(2, u.getProductName());
            ps.setDouble(3, u.getProductPrice());
            ps.setInt(4, u.getQuantity());
            
            
            
            ps.execute();
            } catch (SQLException e)
            {
                System.err.println("\tA problem occurred during the addUser method:");
                System.err.println("\t" + e.getMessage());
            } finally
            {
                try
                {
                    if (ps != null)
                    {
                        ps.close();
                    }
                    if (con != null)
                    {
                        freeConnection(con);
                    }
                } catch (SQLException e)
                {
                    System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
                }
            }
            return true;
       
        }
    
}
