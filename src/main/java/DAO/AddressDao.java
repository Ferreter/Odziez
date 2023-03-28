/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.address;
import DTO.products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class AddressDao extends Dao implements AddressDaoInterface {
    
    public AddressDao(String dbName) {
        super(dbName);
    }
    
    public  int searchbyUserId(int UserId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        address p = null;
        int addressId =0;
        try
        {
            con = this.getConnection();

            String query = "SELECT AddressId FROM address WHERE UserId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + UserId + "%");

            rs = ps.executeQuery();
            if (rs.next())
            {
                addressId = rs.getInt("AddressId");
               
            }
        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the searchbyUserId() method:");
            System.err.println("\t" + e.getMessage());
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
                System.err.println("A problem occurred when closing down the searchbyUserId() method:\n" + e.getMessage());
            }
        }
        return addressId;     // u may be null 
    }
}
