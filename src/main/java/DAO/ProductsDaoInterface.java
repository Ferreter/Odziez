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

    /**
     *
     * Inserts a review into the system.
     *
     * @param r The review object to be inserted.
     * @return True if the review was successfully inserted, false otherwise.
     */
    public boolean insertReview(review r);

    /**
     *
     * Retrieves reviews by product ID.
     *
     * @param productId The ID of the product.
     * @return A list of reviews associated with the specified product ID.
     */
    public List<review> getReviewsByProductId(String productId);

    /**
     *
     * Adds a product to the system along with its stock information.
     *
     * @param p The product object to be added.
     * @param s The stock object associated with the product.
     * @return True if the product and stock were successfully added, false
     * otherwise.
     */
    public boolean AddProduct(products p, stock s);

    /**
     *
     * Finds a product by its ID.
     *
     * @param pId The ID of the product.
     * @return The product matching the specified ID, or null if not found.
     */
    public products findUserByProductId(String pId);

    /**
     *
     * Deletes a product from the system.
     *
     * @param product The product object to be deleted.
     * @return True if the product was successfully deleted, false otherwise.
     */
    public boolean DeleteProduct(products product);

    /**
     *
     * Searches for products by brand.
     *
     * @param product The brand name to search for.
     * @return A list of products matching the specified brand.
     */
    public List<products> searchbybrand(String product);

    /**
     *
     * Searches for products by category.
     *
     * @param product The category to search for.
     * @return A list of products matching the specified category.
     */
    public List<products> searchbycategory(String product);

    /**
     *
     * Edits the details of a product.
     *
     * @param p The modified product object.
     * @return True if the product was successfully edited, false otherwise.
     */
    public boolean EditProduct(products p);

    /**
     *
     * Searches for products based on multiple filters.
     *
     * @param Style The desired style of the product.
     * @param NeckLine The desired neckline of the product.
     * @param Material The desired material of the product.
     * @param Fit The desired fit of the product.
     * @param Length The desired length of the product.
     * @param Occasion The desired occasion for the product.
     * @param Printed The desired printed pattern of the product.
     * @param Color The desired color of the product.
     * @return A list of products matching the specified filters.
     */
    public List<products> searchByFilters(String Style, String NeckLine, String Material, String Fit, String Length, String Occasion, String Printed, String Color);

}
