/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import DTO.archived;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface ArchivedDaoInterface {

    /**
     *
     * Lists all archived products.
     *
     * @return A list of all archived products.
     */
    public List<archived> ListAllProducts();

    /**
     *
     * Returns an archived product to the active product list.
     *
     * @param p The product to be returned to the active products.
     * @return True if the product was successfully returned to the active list,
     * false otherwise.
     */
    public boolean ReturnToProducts(String p);

}
