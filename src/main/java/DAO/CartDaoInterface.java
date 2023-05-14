/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Cart;
import java.util.List;

/**
 *
 * @author Khali
 */
public interface CartDaoInterface {

    /**
     *
     * Adds a cart entry to the system.
     *
     * @param u The cart object to be added.
     * @return True if the cart entry was successfully added, false otherwise.
     */
    public boolean addCart(Cart u);

    /**
     *
     * Lists all cart entries associated with a specific user ID.
     *
     * @param userid The ID of the user.
     * @return A list of cart entries associated with the specified user ID.
     */
    public List<Cart> ListAllCart(int userid);

}
