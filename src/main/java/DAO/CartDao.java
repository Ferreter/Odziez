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

    /**
     * Inserts a new record into the cart table with the provided Cart object.
     *
     * @param u the Cart object to be added to the cart table
     * @return true if the record was successfully added, false otherwise
     */
    @Override
    public boolean addCart(Cart u) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
        Cart b = null;
        try {
            con = getConnection();

            // not needed to name fields since we are filling it all
            String command = "INSERT INTO cart(UserId, ProductId, Size, Quantity,Price,Total) VALUES (?, ?, ?, ?, ?,?)";
            ps = con.prepareStatement(command);

            ps.setInt(1, u.getUserId());
            ps.setString(2, u.getProductId());
            ps.setString(3, u.getSize());
            ps.setInt(4, u.getQuantity());
            ps.setDouble(5, u.getPrice());
            ps.setDouble(6, u.getTotal());
            ps.execute();
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addCart method:");
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
                System.err.println("A problem occurred when closing down the addCart method:\n" + e.getMessage());
            }
        }
        return true;

    }

    /**
     *
     * Returns a list of all the cart items for a given user.
     *
     * @param userid the ID of the user whose cart items to retrieve.
     * @return a List of Cart objects representing the cart items.
     */
    @Override
    public List<Cart> ListAllCart(int userid) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Cart> cartItems = new ArrayList();

        String products = "";

        try {
            con = getConnection();

            String query = "SELECT * FROM `cart` WHERE UserId  = ? ";
            ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            rs = ps.executeQuery();

            while (rs.next()) {

                Cart c = new Cart(rs.getInt("UserId"), rs.getString("ProductId"), rs.getString("Size"), rs.getInt("Quantity"), rs.getDouble("Price"), rs.getDouble("Total"));

                cartItems.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the ListAllCart() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the ListAllCart() method: " + e.getMessage());
            }
        }
        return cartItems;

    }

    /**
     *
     * Increases the quantity of a product in the user's cart by 1.
     *
     * @param productId the ID of the product to increase quantity of
     * @throws SQLException if there is an error executing the SQL query
     */
    public void AddQuantity(String productId) {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement("UPDATE cart SET Quantity = Quantity+1 WHERE ProductId = ?")) {
            stmt.setString(1, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
/**

*Decreases the quantity of the specified product in the user's cart by 1.
*@param productId the ID of the product to decrease the quantity of in the cart
*/
    public void DelQuantity(String productId) {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement("UPDATE cart SET Quantity = Quantity-1 WHERE ProductId = ?")) {
            stmt.setString(1, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
/**

*Deletes a cart item with the specified product ID from the cart.
*@param productId the ID of the product to be deleted
*/
    public void deleteCartItem(String productId) {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart WHERE ProductId = ?")) {
            stmt.setString(1, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
/**

*Deletes a cart item with the specified product ID from the cart.
*@param productId the ID of the product to be deleted
*/
    public void EmptyCartItem(int userId) {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart WHERE userId = ?")) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
