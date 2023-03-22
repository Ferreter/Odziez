/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface ProductsDaoInterface {

    /**
     *
     * Retrieves a list of all products from the 'products' table in the MySQL
     * database.
     *
     * @return a list of products objects representing all products in the
     * 'products' table.
     */
    public List<products> ListAllProducts();

    /**
     *
     * Retrieves a product with the specified name from the database.
     *
     * @param Name the name of the product to retrieve.
     * @return the product with the specified name, or null if no product was
     * found.
     */
    public List<products> searchbyname(String Name);

    /**
     *
     * Searches for a product in the database based on the given product ID.
     *
     * @param ProductId the product ID to search for
     *
     * @return a products object containing the details of the product found, or
     * null if no product is found with the given ID
     */
    public products searchbyId(String Name);

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
    public double getTotalCartPrice(ArrayList<Cart> cartList);

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
    public List<Cart> getCartProducts(ArrayList<Cart> cartList);
    
    public boolean insertReview(review r);
    
    public List<review> getReviewsByProductId(String productId);
    
    public boolean AddProduct(products p);
    
    public products findUserByProductId(String pId);
    
    public boolean DeleteProduct(products product);

    public List<products> searchbybrand(String product);
    
    public boolean EditProduct(products p);
}
