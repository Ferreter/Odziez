/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Khali
 */
public class OrderDao extends Dao implements OrderDaoInterface {
    
    public OrderDao(String dbName) {
        super(dbName);
    }
    
    
    public boolean addOrder(orders u)  {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
        orders b = null;
        try {
            con = getConnection();
            
            // not needed to name fields since we are filling it all
            String command = "INSERT INTO orders( firstname, lastname, email, address1, address2, country, state, zipcode, cardNumber, expiry, cvv, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(command);
           
           
            ps.setString(1, u.getFirstname());
            ps.setString(2, u.getLastname());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getAddress1());
            ps.setString(5, u.getAddress2());
            ps.setString(6, u.getCountry());
            ps.setString(7, u.getState());
            ps.setString(8, u.getZipcode());
            ps.setString(9, u.getCardNumber());
            ps.setString(10, u.getExpiry());
            ps.setString(11, u.getCvv());
            ps.setDouble(12, u.getTotal());
            
            
            
            ps.execute();
            } catch (SQLException e)
            {
                System.err.println("\tA problem occurred during the addOrder method:");
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
                    System.err.println("A problem occurred when closing down the addOrder method:\n" + e.getMessage());
                }
            }
            return true;
       
        }
    
    
     public int getLastIndex()  {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int lastIndex = 0;
        try {
            con = getConnection();
            
            // not needed to name fields since we are filling it all
            String command = "SELECT MAX(orderId) AS lastIndex FROM orders";
            ps = con.prepareStatement(command);
            rs = ps.executeQuery();
            
            if(rs.next()){
                lastIndex = rs.getInt("lastIndex");
            }
         
            } catch (SQLException e)
            {
                System.err.println("\tA problem occurred during the getLastIndex() method:");
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
                    System.err.println("A problem occurred when closing down the getLastIndex() method:\n" + e.getMessage());
                }
            }
            return lastIndex;
       
        }
    
}
