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
    
    @Override
    public boolean addNewAddress(address u) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
        address b = null;
        try {
            con = getConnection();

            // not needed to name fields since we are filling it all
            String command = "INSERT INTO address( AddressId, UserId, Address1, Address2, Address3, City, County, Country, Pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? )";
            ps = con.prepareStatement(command);

           
           ps.setInt(1, u.getAddressId());
            ps.setInt(2, u.getUserId());
            ps.setString(3, u.getAddress1());
            ps.setString(4, u.getAddress2());
            ps.setString(5, u.getAddress3());
            ps.setString(6, u.getCity());
            ps.setString(7, u.getCounty());
            ps.setString(8, u.getCountry());
            ps.setString(9, u.getPincode());
            
            
            


           


            ps.execute();
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addNewAddress method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the addNewAddress method:\n" + e.getMessage());
            }
        }
        return true;

    }
    
    public int getLastIndex() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int lastIndex = 0;
        try {
            con = getConnection();

            // not needed to name fields since we are filling it all
            String command = "SELECT MAX(AddressId) AS lastIndex FROM address";
            ps = con.prepareStatement(command);
            rs = ps.executeQuery();

            if (rs.next()) {
                lastIndex = rs.getInt("lastIndex");
            }

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the getLastIndex() method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the getLastIndex() method:\n" + e.getMessage());
            }
        }
        return lastIndex;

    }
}
