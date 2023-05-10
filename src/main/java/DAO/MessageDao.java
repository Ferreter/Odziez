/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Cart;
import DTO.Message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class MessageDao extends Dao implements MessageDaoInterface {
    
    
    public MessageDao(String dbName) {
        super(dbName);
    }
    
    @Override
     public boolean addMessage(Message u)  {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean add = false;
       
        try {
            con = getConnection();
            
            // not needed to name fields since we are filling it all
            String command = "INSERT INTO messages(id, username, message, status) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(command);
           
            ps.setInt(1, 0);
            ps.setString(2, u.getUsername());
             ps.setString(3, u.getMessage());
             ps.setString(4, u.getStatus());
            
            ps.execute();
            } catch (SQLException e)
            {
                System.err.println("\tA problem occurred during the addCart method:");
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
                    System.err.println("A problem occurred when closing down the addMessage method:\n" + e.getMessage());
                }
            }
            return true;
       
        }
    
    
}
