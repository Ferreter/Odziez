/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Message;

/**
 *
 * @author Dell
 */
public interface MessageDaoInterface {
    /**

Adds a Message to the system.
@param u The Message object to be added.
@return {@code true} if the Message was successfully added, {@code false} otherwise.
*/
     public boolean addMessage(Message u);
    
}
