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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class AddressDao extends Dao implements AddressDaoInterface {

    public AddressDao(String dbName) {
        super(dbName);
    }

    /**
     *
     * A method to search for an address record in the database using a given
     * user ID.
     *
     * @param UserId the ID of the user to search for
     *
     * @return an integer representing the ID of the address record found, or 0
     * if no record is found or an error occurs
     */
    public int searchbyUserId(int UserId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        address p = null;
        int addressId = 0;
        try {
            con = this.getConnection();

            String query = "SELECT AddressId FROM address WHERE UserId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + UserId + "%");

            rs = ps.executeQuery();
            if (rs.next()) {
                addressId = rs.getInt("AddressId");

            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyUserId() method:");
            System.err.println("\t" + e.getMessage());
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
                System.err.println("A problem occurred when closing down the searchbyUserId() method:\n" + e.getMessage());
            }
        }
        return addressId;     // u may be null 
    }

    /**
     *
     * A method to retrieve everything in the address database using a given
     * user ID.
     *
     * @param UserId the ID of the user to search for
     *
     * @return an integer representing the ID of the address record found, or 0
     * if no record is found or an error occurs
     */
   public List<address> AddressByUserId(int UserId) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    List<address> addressList = new ArrayList<>();

    try {
        con = this.getConnection();

        String query = "SELECT * FROM address WHERE UserId = ?";
        ps = con.prepareStatement(query);
        ps.setInt(1, UserId);

        rs = ps.executeQuery();
        while (rs.next()) {
            address a = new address(
                    rs.getInt("AddressId"),
                    rs.getInt("UserId"),
                    rs.getString("Address1"),
                    rs.getString("Address2"),
                    rs.getString("Address3"),
                    rs.getString("City"),
                    rs.getString("County"),
                    rs.getString("Country"),
                    rs.getString("Pincode")
            );
            addressList.add(a);
        }
    } catch (SQLException e) {
        System.err.println("\tA problem occurred during the AddressByUserId() method:");
        System.err.println("\t" + e.getMessage());
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
            System.err.println("A problem occurred when closing down the AddressByUserId() method:\n" + e.getMessage());
        }
    }
    return addressList;
}
    public int findAddressId(int UserId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        address p = null;
        int id = 0;

        try {
            con = this.getConnection();

            String query = "SELECT AddressId FROM address WHERE UserId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + UserId + "%");

            rs = ps.executeQuery();
            if (rs.next()) {
                
                p = new address(rs.getInt("AddressId"), rs.getInt("UserId"), rs.getString("Address1"), rs.getString("Address2"), rs.getString("Address3"), rs.getString("City"), rs.getString("County"), rs.getString("Country"), rs.getString("Pincode"));
                
                id = p.getAddressId();
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyUserId() method:");
            System.err.println("\t" + e.getMessage());
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
                System.err.println("A problem occurred when closing down the searchbyUserId() method:\n" + e.getMessage());
            }
        }
        return id;     // u may be null 
    }

    /**
     * Add a new address to the database for the logged in user and returns true
     * for success and false for error
     *
     * @param u The Address to be added to the database.
     *
     * @return True if the Address was successfully added to the database, false
     * otherwise.
     */
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

    /**
     * This method retrieves the last index from the 'Address' table in the
     * database.
     *
     * @return the last index (an integer value) from the 'Address' table in the
     * database. If no index exists in the table, this method returns 0.
     */
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
    
     public boolean editAddress(address u, String Address1, String Address2, String Address3, String City, String County, String Country, String Pincode) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean edit = false;
        try {
            con = this.getConnection();

            String query = "UPDATE address SET Address1 = ? , Address2 = ? , Address3 = ? , City = ? , County = ? , Country = ? , Pincode = ? WHERE AddressId = ?";

            ps = con.prepareStatement(query);

            ps.setString(1, Address1);
            ps.setString(2, Address2);
            ps.setString(3, Address3);
            ps.setString(4, City);
            ps.setString(5, County);
            ps.setString(6, Country);
             ps.setString(7, Pincode);
              ps.setInt(8, u.getAddressId());

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();
            edit = true;
            

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the editAddress method:");
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
                System.err.println("A problem occurred when closing down the editAddress method:\n" + e.getMessage());
            }
        }
        return edit;
    }

}
