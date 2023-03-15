/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Cart;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
           
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getProductId());
            ps.setInt(3, u.getQuantity());
            ps.setDouble(4, u.getPrice());
            ps.setDouble(5, u.getTotal());
            
            return true;
            
            

        } catch (SQLException e) {
           
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
               
            }
        }
        return add;
    }

    
}
