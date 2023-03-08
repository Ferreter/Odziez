package DAO;

/**
 *
 * @author Kian
 */
import DTO.Cart;
import DTO.products;
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

                String query = "SELECT * FROM `products` ORDER BY `products`.`ProductId` DESC";
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

    @Override
    public products searchbyname(String Name) {
    Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM products WHERE Name like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, Name+"%");

            rs = ps.executeQuery();
            if (rs.next()) {
   
                String productId = rs.getString("ProductId");
                String ProductName = rs.getString("Name");
                double MRP = rs.getDouble("MRP");
                double CP = rs.getDouble("CP");
                String Description = rs.getString("Description");
                String Category = rs.getString("Category");
                String Tags = rs.getString("Tags");
                String Images = rs.getString("Images");
                String Brand = rs.getString("Brand");
                
                p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"),rs.getString("Category"),rs.getString("Tags"),rs.getString("Images"),rs.getString("Brand"));
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
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
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 
}
    @Override
    public products searchbyId(String ProductId) {
    Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM products WHERE ProductId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, ProductId+"%");

            rs = ps.executeQuery();
            if (rs.next()) {
   
                String productId = rs.getString("ProductId");
                String ProductName = rs.getString("Name");
                double MRP = rs.getDouble("MRP");
                double CP = rs.getDouble("CP");
                String Description = rs.getString("Description");
                String Category = rs.getString("Category");
                String Tags = rs.getString("Tags");
                String Images = rs.getString("Images");
                String Brand = rs.getString("Brand");
                
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
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
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 
}
    @Override
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
         Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
       
        double sum = 0;
        
        try {
            
            con = this.getConnection();
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                  String  query = "SELECT CP from products where id=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, item.getProductId());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("CP")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
           
            System.out.println("\tA problem occurred during the getTotalCartPrice: " + e.getMessage());
        }
        finally {
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
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return sum;
    }

   
    @Override
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
       
        List<Cart> products = new ArrayList<>();
        try {
            con = this.getConnection();
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "SELECT * FROM products where ProductId=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, item.getProductId());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setProductId(rs.getString("ProductId"));
                        row.setName(rs.getString("Name"));
                        row.setCategory(rs.getString("Category"));
                        row.setCP(rs.getDouble("CP")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                        
                        
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("\tA problem occurred during the getCartProducts: " + e.getMessage());
        }
        finally {
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
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return products;
    }

    @Override
    public products CreateProdut() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
