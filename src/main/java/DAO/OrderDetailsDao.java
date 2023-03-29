/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.OrderDetails;
import DTO.orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Khali
 */
public class OrderDetailsDao extends Dao implements OrderDetailsDaoInterface {

    public OrderDetailsDao(String dbName) {
        super(dbName);
    }

    public boolean addOrderDetails(OrderDetails u) {
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
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addOrderDetails method:");
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
                System.err.println("A problem occurred when closing down the addOrderDetails method:\n" + e.getMessage());
            }
        }
        return true;

    }

    @Override
    public List<OrderDetails> findOrderDetailsById(int UserId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<OrderDetails> o = new ArrayList();
        try {
            con = this.getConnection();
            OrderDao Odao = new OrderDao("clothes_shop");
            OrderDaoInterface Orderdao = new OrderDao("clothes_shop");
            List<orders> orders = Orderdao.findOrdersByUserId(UserId);
            for (orders order : orders) {
                String query = "SELECT * FROM orderdetails WHERE OrderId = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, order.getOrderId());

                rs = ps.executeQuery();

                while (rs.next()) {

                    int orderId = rs.getInt("orderId");
                String productName = rs.getString("productName");
                double productPrice = rs.getDouble("productPrice");
                int quantity = rs.getInt("quantity");

                OrderDetails OrderDetail  = new OrderDetails(orderId,productName,productPrice,quantity);
                o.add(OrderDetail);
                }
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
