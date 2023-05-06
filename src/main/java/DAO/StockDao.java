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
public class StockDao extends Dao implements StockDaoInterface{

    public StockDao(String databaseName) {
        super(databaseName);
    }
    
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
            ps.setString(1,  p.getProductId() );
            rs = ps.executeQuery();

            while (rs.next()) {
                stock s = new stock(rs.getString("ProductId"), rs.getInt("Name"), rs.getInt("MRP"), rs.getInt("CP"), rs.getInt("Description"), rs.getInt("Category"));

                stock.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the ListAllProducts() method: " + e.getMessage());
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
    
}
