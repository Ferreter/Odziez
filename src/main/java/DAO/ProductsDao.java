package DAO;

/**
 *
 * @author Kian
 */
import DTO.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductsDao extends Dao implements ProductsDaoInterface {

    // When using the UserDao you must supply the name of the database to access
    public ProductsDao(String dbName) {
        super(dbName);
    }

    @Override
    public List<products> ListAllProducts() {
     
      
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            List<products> books = new ArrayList();
            
            String products = "";

            try {
                con = getConnection();

                String query = "Select * from products";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
                    products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"),rs.getString("Category"),rs.getString("Tags"),rs.getString("Images"),rs.getString("Brand"));

                    books.add(p);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the ViewBooks() method: " + e.getMessage());
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
                    System.out.println("Exception occured in the finally section of the ViewBooks() method: " + e.getMessage());
                }
            }
        return books;

            
        
    }
}
