/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.address;
import java.util.List;

/**
 *
 * @author Dell
 */
public interface AddressDaoInterface {

    /**
     *
     * A method to search for an address record in the database using a given
     * user ID.
     *
     * @param UserId the ID of the user to search for
     *
     * @return an integer representing the ID of the address record found, or 0
     * if no record is found or an error occurs
     */
    public int searchbyUserId(int UserId);

    /**
     * Add a new address to the database for the logged in user and returns true
     * for success and false for error
     *
     * @param u The Address to be added to the database.
     *
     * @return True if the Address was successfully added to the database, false
     * otherwise.
     */
    public boolean addNewAddress(address u);

    /**
     *
     * A method to retrieve everything in the address database using a given
     * user ID.
     *
     * @param UserId the ID of the user to search for
     *
     * @return an integer representing the ID of the address record found, or 0
     * if no record is found or an error occurs
     */
    public List<address> AddressByUserId(int UserId);
}
