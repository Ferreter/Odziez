/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.archived;
import DTO.products;
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
public class ArchivedDao extends Dao implements ArchivedDaoInterface{
    
      public ArchivedDao(String dbName) {
        super(dbName);
    }
    
    
    @Override
    public List<archived> ListAllProducts() {
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<archived> archivedP = new ArrayList();

        try {
            con = getConnection();

            String query = "SELECT * FROM `archived` ORDER BY `archived`.`ProductId` DESC";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                archived a = new archived(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"),  rs.getString("Brand"));

                archivedP.add(a);
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
        return archivedP;
    }
    
    @Override
    public boolean ReturnToProducts(String p) {
        PreparedStatement ps = null;
        boolean removed = true;

            archiveProduct(p);
       
        return removed;
    }
    
   public void archiveProduct(String productId) {
    String query = "CALL unarchive_product(?)";
    Connection con = null;
    try {
        con = this.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, productId);
        ps.executeUpdate();

    } catch (SQLException e) {
        System.err.println("\tA problem occurred during the archiveProduct method:");
        System.err.println("\t" + e.getMessage());
        
    }
}
}
