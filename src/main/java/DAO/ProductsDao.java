package DAO;

/**
 *
 * @author Kian
 */
import DTO.Cart;
import DTO.products;
import DTO.review;
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

    /**
     *
     * Retrieves a list of all products from the 'products' table in the MySQL
     * database.
     *
     * @return a list of products objects representing all products in the
     * 'products' table.
     */
    @Override
    public List<products> ListAllProducts() {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<products> books = new ArrayList();

        String products = "";

        try
        {
            con = getConnection();

            String query = "SELECT * FROM `products` ORDER BY `products`.`ProductId` DESC";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next())
            {
                products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Images"), rs.getString("Brand"));

                books.add(p);
            }
        } catch (SQLException e)
        {
            System.out.println("Exception occured in the ViewBooks() method: " + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.out.println("Exception occured in the finally section of the ViewBooks() method: " + e.getMessage());
            }
        }
        return books;

    }

    /**
     *
     * Retrieves a product with the specified name from the database.
     *
     * @param Name the name of the product to retrieve.
     * @return the product with the specified name, or null if no product was
     * found.
     */
    @Override
    public products searchbyname(String Name) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try
        {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE Name like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + Name + "%");

            rs = ps.executeQuery();
            if (rs.next())
            {

                String productId = rs.getString("ProductId");
                String ProductName = rs.getString("Name");
                double MRP = rs.getDouble("MRP");
                double CP = rs.getDouble("CP");
                String Description = rs.getString("Description");
                String Category = rs.getString("Category");
                String Tags = rs.getString("Tags");
                String Images = rs.getString("Images");
                String Brand = rs.getString("Brand");

                p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Images"), rs.getString("Brand"));
            }
        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
            System.err.println("\t" + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 
    }

    /**
     *
     * Searches for a product in the database based on the given product ID.
     *
     * @param ProductId the product ID to search for
     *
     * @return a products object containing the details of the product found, or
     * null if no product is found with the given ID
     */
    @Override
    public products searchbyId(String ProductId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try
        {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE ProductId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, ProductId + "%");

            rs = ps.executeQuery();
            if (rs.next())
            {

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
        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
            System.err.println("\t" + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 
    }

    /**
     *
     * Calculates the total price of items in the given cart list based on their
     * individual prices and quantities.
     *
     * @param cartList the list of Cart objects representing the items in the
     * cart
     *
     * @return the total price of all items in the cart
     */
    @Override
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        double sum = 0;

        try
        {

            con = this.getConnection();
            if (cartList.size() > 0)
            {
                for (Cart item : cartList)
                {
                    String query = "SELECT CP from products where id=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, item.getProductId());
                    rs = ps.executeQuery();
                    while (rs.next())
                    {
                        sum += rs.getDouble("CP") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e)
        {

            System.out.println("\tA problem occurred during the getTotalCartPrice: " + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return sum;
    }


    /**
     *
     * Retrieves a list of products from the database based on the provided cart
     * list.
     *
     * @param cartList an ArrayList of Cart objects containing product IDs and
     * their respective quantities
     *
     * @return a List of Cart objects containing the products retrieved from the
     * database, along with their names, categories, and costs based on the
     * provided cart list
     */
    @Override
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Cart> products = new ArrayList<>();
        try
        {
            con = this.getConnection();
            if (cartList.size() > 0)
            {
                for (Cart item : cartList)
                {
                    String query = "SELECT * FROM products where ProductId=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, item.getProductId());
                    rs = ps.executeQuery();
                    while (rs.next())
                    {
                        Cart row = new Cart();
                        row.setProductId(rs.getString("ProductId"));
                        row.setName(rs.getString("Name"));
                        row.setCategory(rs.getString("Category"));
                        row.setCP(rs.getDouble("CP") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);

                    }

                }
            }

        } catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println("\tA problem occurred during the getCartProducts: " + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return products;
    }

    
    @Override
    public products CreateProdut() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    
    
     
    @Override
    public boolean insertReview(review r) {
         Connection con = null;
        PreparedStatement ps = null;
        boolean added = false;
        try
        {
            con = this.getConnection();
            
            String query = "INSERT INTO review (reviewId, ProductId, UserId, rating, review, reviewDate) VALUES (?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(query);

            ps.setInt(1, r.getReviewId());
            ps.setString(2, r.getProductId());
            ps.setInt(3, r.getUserId());
            ps.setInt(4, r.getRating());
            ps.setString(5, r.getReview());
             ps.setDate(6, r.getReviewDate());

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();
            added = true;
            // Find out what the id generated for this entry was

        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the addUser method:");
            System.err.println("\t" + e.getMessage());

        } finally
        {
            try
            {

                if (ps != null)
                {
                    ps.close();

                }

                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
            }
        }
        return added;
    }
    @Override
    public List<review> getReviewsByProductId(String productId)  {
   Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<review> reviews = new ArrayList();

        String review = "";

        try
        {
            con = getConnection();

            String query = "SELECT * FROM review WHERE productId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1,productId);
            rs = ps.executeQuery();

            while (rs.next())
            {
                review r = new review(rs.getInt("reviewId"), rs.getString("ProductId"), rs.getInt("UserId"), rs.getInt("rating"), rs.getString("review"), rs.getDate("reviewDate"));

                reviews.add(r);
            }
        } catch (SQLException e)
        {
            System.out.println("Exception occured in the ViewBooks() method: " + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.out.println("Exception occured in the finally section of the ViewBooks() method: " + e.getMessage());
            }
        }
        return reviews;
    }

    @Override
    public boolean AddProduct(products p) {
        Connection con = null;
        PreparedStatement ps = null;

        if (findUserByProductId(p.getProductId()) == null)
        {

            try
            {
                con = this.getConnection();
               

                String query = "INSERT INTO products (ProductId, Name, MRP, CP, Description, Category, Tags, Images, Brand) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                ps.setString(1, p.getProductId());
                ps.setString(2, p.getName());
                ps.setDouble(3, p.getMRP());
                ps.setDouble(4, p.getCP());
                ps.setString(5, p.getDescription());
                ps.setString(6, p.getCategory());
                ps.setString(7, p.getTags());
                ps.setString(8, p.getImages());
                ps.setString(9, p.getBrand());

                ps.execute();
            } catch (SQLException e)
            {
                System.err.println("\tA problem occurred during the addUser method:");
                System.err.println("\t" + e.getMessage());
            } finally
            {
                try
                {
                    if (ps != null)
                    {
                        ps.close();
                    }
                    if (con != null)
                    {
                        freeConnection(con);
                    }
                } catch (SQLException e)
                {
                    System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
                }
            }
            return true;
        } else
        {
            return false;
        }
    }
    
    @Override
    public products findUserByProductId(String pId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try
        {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE ProductId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, pId);

            rs = ps.executeQuery();
            if (rs.next())
            {

                String ProductId = rs.getString("ProductId");
                String Name = rs.getString("Name");
                double MRP = rs.getDouble("MRP");
                double CP = rs.getDouble("CP");
                String Description = rs.getString("Description");
                String Category = rs.getString("Category");
                String Tags = rs.getString("Tags");
                String Images = rs.getString("	Images");
                String Brand = rs.getString("Brand");

                p = new products(ProductId, Name, MRP, CP, Description, Category, Tags, Images, Brand);
            }
        } catch (SQLException e)
        {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
            System.err.println("\t" + e.getMessage());
        } finally
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (ps != null)
                {
                    ps.close();
                }
                if (con != null)
                {
                    freeConnection(con);
                }
            } catch (SQLException e)
            {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 

    }
}
