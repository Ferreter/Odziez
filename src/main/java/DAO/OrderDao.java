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
import java.util.ArrayList;
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
            String command = "INSERT INTO orders( UserId, AddressId, total) VALUES (?, ?, ?)";
            ps = con.prepareStatement(command);

            ps.setInt(1, u.getUserId());
            ps.setInt(2, u.getAddressId());
            ps.setDouble(3, u.getTotal());

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
    public List<orders> findOrdersByUserId(int userId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<orders> o = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM orders WHERE UserId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while (rs.next()) {

                int orderId = rs.getInt("orderId");
                int UserId = rs.getInt("UserId");
                int AddressId = rs.getInt("AddressId");
                double total = rs.getDouble("total");
                String Status = rs.getString("Status");

                orders order = new orders(orderId, UserId, AddressId, total,Status);
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
    
    @Override
    public List<orders> findOrdersByOrderId(int ordersId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<orders> o = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM orders WHERE OrderId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, ordersId);

            rs = ps.executeQuery();

            while (rs.next()) {

                int orderId = rs.getInt("orderId");
                int UserId = rs.getInt("UserId");
                int AddressId = rs.getInt("AddressId");
                double total = rs.getDouble("total");
                String Status = rs.getString("Status");

                orders order = new orders(orderId, UserId, AddressId, total,Status);
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
    
    @Override
    public List<orders> AllOrders() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<orders> o = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM orders ";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {

                int orderId = rs.getInt("orderId");
                int UserId = rs.getInt("UserId");
                int AddressId = rs.getInt("AddressId");
                double total = rs.getDouble("total");
                String Status = rs.getString("Status");

                orders order = new orders(orderId, UserId, AddressId, total,Status);
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

    @Override
    public boolean ChangeStatus(int OrderId,String Changed) {
        Connection con = null;
        PreparedStatement ps = null;
        
            try {
                con = this.getConnection();

                String query = "UPDATE orders SET Status = ? WHERE orderId = ? ";
                ps = con.prepareStatement(query);
                ps.setString(1,Changed);
                ps.setInt(2, OrderId);

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the EditProduct method:");
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
                    System.err.println("A problem occurred when closing down the EditProduct method:\n" + e.getMessage());
                }
            }
            return true;
        } 
    }


