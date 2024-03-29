package DAO;

/**
 *
 * @author Kian
 */
import DTO.Cart;
import DTO.products;
import DTO.review;
import DTO.stock;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
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
        List<products> products = new ArrayList();

        try {
            con = getConnection();

            String query = "SELECT * FROM `products` ORDER BY `products`.`ProductId` DESC";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

                products.add(p);
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
        return products;

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
    public List<products> searchbyname(String Name) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<products> products = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE Name like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + Name + "%");

            rs = ps.executeQuery();
            while (rs.next()) {

                products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

                products.add(p);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyname() method:");
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
                System.err.println("A problem occurred when closing down the searchbyname() method:\n" + e.getMessage());
            }
        }
        return products;     // u may be null 
    }

    /**
     * Returns a list of products that match the specified brand. The brand
     * comparison is case-insensitive.
     *
     * @param Brand the brand to search for
     * @return a list of products that match the specified brand
     * @throws SQLException if an error occurs while accessing the database
     */
    @Override
    public List<products> searchbybrand(String Brand) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<products> products = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE Brand like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + Brand + "%");

            rs = ps.executeQuery();
            while (rs.next()) {

                products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

                products.add(p);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyname() method:");
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
                System.err.println("A problem occurred when closing down the searchbyname() method:\n" + e.getMessage());
            }
        }
        return products;     // u may be null 
    }

    /**
     *
     * Searches for products in the database by a given category.
     *
     * @param category a String representing the brand to search for
     *
     * @return a List of products that match the given category, or an empty list
     * if no matches are found
     */
    @Override
    public List<products> searchbycategory(String category) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<products> products = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE Category like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + category + "%");

            rs = ps.executeQuery();
            while (rs.next()) {

                products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

                products.add(p);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbycategory() method:");
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
                System.err.println("A problem occurred when closing down the searchbycategory() method:\n" + e.getMessage());
            }
        }
        return products;     // u may be null 
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
        try {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE ProductId like ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + ProductId + "%");

            rs = ps.executeQuery();
            if (rs.next()) {

                p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyId() method:");
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
                System.err.println("A problem occurred when closing down the searchbyId() method:\n" + e.getMessage());
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

        try {

            con = this.getConnection();
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "SELECT CP from products where id=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, item.getProductId());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("CP") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {

            System.out.println("\tA problem occurred during the getTotalCartPrice: " + e.getMessage());
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
                System.err.println("A problem occurred when closing down the getTotalCartPrice() method:\n" + e.getMessage());
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
                        row.setCP(rs.getDouble("CP") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);

                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("\tA problem occurred during the getCartProducts: " + e.getMessage());
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
                System.err.println("A problem occurred when closing down the getCartProducts() method:\n" + e.getMessage());
            }
        }
        return products;
    }

    /**
     *
     * Inserts a new review into the database.
     *
     * @param r the review to be inserted
     * @return true if the review was successfully inserted, false otherwise
     */
    @Override
    public boolean insertReview(review r) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean added = false;
        try {
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

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the insertReview() method:");
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
                System.err.println("A problem occurred when closing down the insertReview() method:\n" + e.getMessage());
            }
        }
        return added;
    }

    /**
     * Retrieves a list of reviews for a given product ID from the database.
     *
     * @param productId The product ID to retrieve reviews for.
     * @return A list of review objects for the given product ID.
     */
    @Override
    public List<review> getReviewsByProductId(String productId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<review> reviews = new ArrayList();

        String review = "";

        try {
            con = getConnection();

            String query = "SELECT * FROM review WHERE productId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();

            while (rs.next()) {
                review r = new review(rs.getInt("reviewId"), rs.getString("ProductId"), rs.getInt("UserId"), rs.getInt("rating"), rs.getString("review"), rs.getDate("reviewDate"));

                reviews.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getReviewsByProductId() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the getReviewsByProductId() method: " + e.getMessage());
            }
        }
        return reviews;
    }

    /**
     * Adds a product and its corresponding stock information to the database.
     *
     * @param p The product to be added to the database.
     * @param s The stock information corresponding to the product.
     * @return true if the product is successfully added to the database, false
     * if the product already exists in the database.
     * @throws SQLException if an error occurs while accessing the database.
     */
    @Override
    public boolean AddProduct(products p, stock s) {
        Connection con = null;
        PreparedStatement ps = null;

        if (findUserByProductId(p.getProductId()) == null) {

            try {
                con = this.getConnection();

                String query = "INSERT INTO products (ProductId, Name, MRP, CP, Description, Category, Tags,  Brand) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, p.getProductId());
                ps.setString(2, p.getName());
                ps.setDouble(3, p.getMRP());
                ps.setDouble(4, p.getCP());
                ps.setString(5, p.getDescription());
                ps.setString(6, p.getCategory());
                ps.setString(7, p.getTags());
                ps.setString(8, p.getBrand());
                ps.execute();

                String query2 = "INSERT INTO stock (ProductId, XS,S,M,L,XL) VALUES (?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query2);
                ps.setString(1, p.getProductId());
                ps.setInt(2, s.getXS());
                ps.setInt(3, s.getS());
                ps.setInt(4, s.getM());
                ps.setInt(5, s.getL());
                ps.setInt(6, s.getXL());
                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the AddProduct() method:");
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
                    System.err.println("A problem occurred when closing down the AddProduct() method:\n" + e.getMessage());
                }
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * Finds a product by its unique product ID.
     *
     * @param pId the product ID to search for
     * @return the product with the given ID, or null if no such product exists
     */
    @Override
    public products findUserByProductId(String pId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        products p = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM products WHERE ProductId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, pId);

            rs = ps.executeQuery();
            if (rs.next()) {

                String ProductId = rs.getString("ProductId");
                String Name = rs.getString("Name");
                double MRP = rs.getDouble("MRP");
                double CP = rs.getDouble("CP");
                String Description = rs.getString("Description");
                String Category = rs.getString("Category");
                String Tags = rs.getString("Tags");
                String Brand = rs.getString("Brand");

                p = new products(ProductId, Name, MRP, CP, Description, Category, Tags, Brand);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByProductId method:");
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
                System.err.println("A problem occurred when closing down the findUserByProductId method:\n" + e.getMessage());
            }
        }
        return p;     // u may be null 

    }

    /**
     * Deletes a product from the products table and the stock table.
     *
     * @param p the product to be deleted
     * @return true if the product was successfully deleted from both tables,
     * false otherwise
     */
    @Override
    public boolean DeleteProduct(products p) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();

            String query2 = "DELETE FROM stock WHERE ProductId = ?";
            ps = con.prepareStatement(query2);
            ps.setString(1, p.getProductId());
            int rowsAffected2 = ps.executeUpdate();

            String query = "DELETE FROM products WHERE ProductId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, p.getProductId());
            archiveProduct(p.getProductId());
            int rowsAffected1 = ps.executeUpdate();
            if (rowsAffected1 != 0 && rowsAffected2 != 0) {
                removed = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the DeleteProduct method:");
            System.err.println("\t" + e.getMessage());
            removed = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the DeleteProduct method:\n" + e.getMessage());
            }
        }
        return removed;

    }

    /**
     * Archives a product by calling a stored procedure in the database.
     *
     * @param productId the ID of the product to be archived
     */
    public void archiveProduct(String productId) {
        String query = "CALL archive_product(?)";
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

    /**
     * Updates an existing product in the database.
     *
     * @param p the products object to be updated
     * @return true if the update was successful, false otherwise
     */
    @Override
    public boolean EditProduct(products p) {
        Connection con = null;
        PreparedStatement ps = null;

        if (findUserByProductId(p.getProductId()) != null) {

            try {
                con = this.getConnection();

                String query = "UPDATE products SET ProductId = ?, Name = ?, MRP = ?, CP = ?, Description = ?, Category = ?,Tags = ?,  Brand = ? WHERE ProductId like ? ";
                ps = con.prepareStatement(query);
                ps.setString(1, p.getProductId());
                ps.setString(2, p.getName());
                ps.setDouble(3, p.getMRP());
                ps.setDouble(4, p.getCP());
                ps.setString(5, p.getDescription());
                ps.setString(6, p.getCategory());
                ps.setString(7, p.getTags());
                ps.setString(8, p.getBrand());
                ps.setString(9, "%" + p.getProductId() + "%");

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
        } else {
            return false;
        }
    }

    /**
     *
     * Searches for products in the database based on various filters.
     *
     * @param Style The style of the product.
     * @param NeckLine The neckline of the product.
     * @param Material The material of the product.
     * @param Fit The fit of the product.
     * @param Length The length of the product.
     * @param Occasion The occasion for which the product is suitable.
     * @param Printed Whether the product is printed or not.
     * @param Color The color of the product.
     * @return A list of products that match the specified filters.
     */
    @Override
    public List<products> searchByFilters(String Style, String NeckLine, String Material, String Fit, String Length, String Occasion, String Printed, String Color) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<products> products = new ArrayList();
        try {
            con = this.getConnection();
            if (Style.equalsIgnoreCase("all") && NeckLine.equalsIgnoreCase("all") && Material.equalsIgnoreCase("all") && Fit.equalsIgnoreCase("all") && Length.equalsIgnoreCase("all") && Occasion.equalsIgnoreCase("all") && Printed.equalsIgnoreCase("all") && Color.equalsIgnoreCase("all")) {
                products = ListAllProducts();

            } else {
                String query = "SELECT * FROM products WHERE Tags like ? OR Tags like ? OR Tags like ? OR Tags like ? OR Tags like ? OR Tags like ? OR Tags like ? OR Tags like ? ";
                ps = con.prepareStatement(query);
                ps.setString(1, "%" + Color + "%");
                ps.setString(2, "%" + Style + "%");
                ps.setString(3, "%" + Printed + "%");
                ps.setString(4, "%" + Length + "%");
                ps.setString(5, "%" + Occasion + "%");
                ps.setString(6, "%" + Fit + "%");
                ps.setString(7, "%" + NeckLine + "%");
                ps.setString(8, "%" + Material + "%");
                rs = ps.executeQuery();
                while (rs.next()) {

                    products p = new products(rs.getString("ProductId"), rs.getString("Name"), rs.getDouble("MRP"), rs.getDouble("CP"), rs.getString("Description"), rs.getString("Category"), rs.getString("Tags"), rs.getString("Brand"));

                    products.add(p);
                }
            }

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the searchbyname() method:");
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
                System.err.println("A problem occurred when closing down the searchbyname() method:\n" + e.getMessage());
            }
        }
        return products;
    }

}
