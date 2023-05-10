/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.products;
import DTO.stock;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kian2
 */
public class StockDao extends Dao implements StockDaoInterface {

    public StockDao(String databaseName) {
        super(databaseName);
    }

    /**
     *
     * Retrieves a list of all the stock entries for a particular product from
     * the database.
     *
     * @param p the product for which to retrieve the stock entries
     *
     * @return a list of all the stock entries for the specified product
     */
    @Override
    public List<stock> ListAllStockForProductId(products p) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<stock> stock = new ArrayList();

        try {
            con = getConnection();

            String query = "SELECT * FROM `stock` Where ProductId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, p.getProductId());
            rs = ps.executeQuery();

            while (rs.next()) {
                stock s = new stock(rs.getString("ProductId"), rs.getInt("Xs"), rs.getInt("S"), rs.getInt("M"), rs.getInt("L"), rs.getInt("XL"));

                stock.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the ListAllStock() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the ListAllProducts() method: " + e.getMessage());
            }
        }
        return stock;

    }

    /**
     *
     * Retrieves the stock information for a given product ID from the database.
     *
     * @param productId The ID of the product to retrieve stock information for.
     * @return The stock information for the given product ID, or null if the
     * product ID is invalid or no stock information is available.
     */
    @Override
    public stock getProductStock(String productId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        stock productStock = null;

        try {
            con = getConnection();

            String query = "SELECT * FROM stock WHERE ProductId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, productId);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Retrieve the stock information for the product
                int XS = rs.getInt("XS");
                int S = rs.getInt("S");
                int M = rs.getInt("M");
                int L = rs.getInt("L");
                int XL = rs.getInt("XL");

                // Create a new stock object
                productStock = new stock(productId, XS, S, M, L, XL);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during database access
        }

        return productStock;
    }

    /**
     * Retrieves the stock for a specific product and size from the database.
     *
     * @param productId the ID of the product to retrieve stock for
     * @param size the size to retrieve stock for (XS, S, M, L, XL)
     * @return a stock object representing the stock for the product and size,
     * or null if not found
     * @throws SQLException if an error occurs while accessing the database
     */
    public stock getProductStock(String productId, String Size) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        stock productStock = null;

        try {
            con = getConnection();

            String query = "SELECT * FROM stock WHERE ProductId = ? AND Size = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, productId);
            ps.setString(2, Size);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Retrieve the stock information for the product
                int XS = rs.getInt("XS");
                int S = rs.getInt("S");
                int M = rs.getInt("M");
                int L = rs.getInt("L");
                int XL = rs.getInt("XL");

                // Create a new stock object
                productStock = new stock(productId, XS, S, M, L, XL);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during database access
        }

        return productStock;
    }

    /**
     * Updates the stock information for a product in the database.
     *
     * @param existingStock the stock information to be updated
     * @return true if the stock information was updated successfully, false
     * otherwise
     */
    public boolean updateProductStock(stock existingStock) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = getConnection();

            String query = "UPDATE stock SET XS=?, S=?, M=?, L=?, XL=? WHERE ProductId=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, existingStock.getXS());
            ps.setInt(2, existingStock.getS());
            ps.setInt(3, existingStock.getM());
            ps.setInt(4, existingStock.getL());
            ps.setInt(5, existingStock.getXL());
            ps.setString(6, existingStock.getProductId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during database access
        }

        return false;
    }

}
