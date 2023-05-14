/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import DTO.products;
import DTO.stock;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface StockDaoInterface {

    /**
     *
     * Lists all stock entries for a given product ID.
     *
     * @param p The product for which to retrieve stock entries.
     * @return A list of stock entries associated with the specified product.
     */
    public List<stock> ListAllStockForProductId(products p);

    /**
     *
     * Retrieves the stock information for a specific product.
     *
     * @param productId The ID of the product.
     * @return The stock information associated with the specified product ID,
     * or null if not found.
     */
    public stock getProductStock(String productId);
}
