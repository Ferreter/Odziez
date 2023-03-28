/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.orders;
import DTO.products;
import DTO.user;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Khali
 */
public class OrderDao extends Dao implements OrderDaoInterface {

    public OrderDao(String dbName) {
        super(dbName);
    }

    public boolean addOrder(orders u) {
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
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addOrder method:");
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
                System.err.println("A problem occurred when closing down the addOrder method:\n" + e.getMessage());
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
            String command = "SELECT MAX(orderId) AS lastIndex FROM orders";
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

    @Override
    public List<orders> findOrdersById(String Email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<orders> o = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM orders WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, Email);

            rs = ps.executeQuery();

            while (rs.next()) {

                //int orderId = rs.getInt("orderId");
//                String firstname = rs.getString("firstname");
//                String lastname = rs.getString("lastname");
//                String email = rs.getString("email");
//                String address1 = rs.getString("address1");
//                String address2 = rs.getString("address2");
//                String country = rs.getString("country");
//                String state = rs.getString("state");
//                String zipcode = rs.getString("zipcode");
//                String cardNumber = rs.getString("cardNumber");
//                String expiry = rs.getString("expiry");
//                String cvv = rs.getString("cvv");
//                double total = rs.getDouble("total");
                //Date date = rs.getDate("created_at");
                orders order  = new orders(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), rs.getString("address1"), rs.getString("address2"), rs.getString("country"), rs.getString("state"), rs.getString("zipcode"), rs.getString("cardNumber"), rs.getString("expiry"), rs.getString("cvv"), rs.getDouble("total"));
                o.add(order);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findOrdersById method:");
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
                System.err.println("A problem occurred when closing down the findOrdersById() method:\n" + e.getMessage());
            }
        }
        return o;     // o may be null 
    }

}
