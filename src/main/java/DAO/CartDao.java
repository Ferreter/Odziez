/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Cart;
import DTO.products;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CartDao extends Dao implements CartDaoInterface {
    
    // When using the CartDao you must supply the name of the database to access
    public CartDao(String dbName) {
        super(dbName);
    }
    
  
    @Override
    public boolean addCart(Cart u)  {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
        Cart b = null;
        try {
            con = getConnection();
            
            // not needed to name fields since we are filling it all
            String command = "INSERT INTO cart(username, ProductId, Quantity,Price,Total) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(command);
           
            ps.setInt(1, u.getUserId());
            ps.setString(2, u.getProductId());
            ps.setInt(3, u.getQuantity());
            ps.setDouble(4, u.getPrice());
            ps.setDouble(5, u.getTotal());
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
    

@Override
    public List<Cart> ListAllCart(int userid) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Cart> cartItems = new ArrayList();

        String products = "";

        try
        {
            con = getConnection();

            String query = "SELECT * FROM `cart` WHERE UserId  = ? ";
            ps = con.prepareStatement(query);
             ps.setInt(1, userid);
            rs = ps.executeQuery();

            while (rs.next())
            {
               
                Cart c = new Cart(rs.getInt("UserId"), rs.getString("ProductId"), rs.getInt("Quantity"), rs.getDouble("Price"), rs.getDouble("Total"));

                cartItems.add(c);
            }
        } catch (SQLException e)
        {
            System.out.println("Exception occured in the ViewBooks() method: " + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
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
                System.out.println("Exception occured in the finally section of the ViewBooks() method: " + e.getMessage());
            }
        }
        return cartItems;

    }

}

