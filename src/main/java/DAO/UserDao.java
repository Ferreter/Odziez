package DAO;

/**
 *
 * @author Kian
 */
import DTO.user;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao extends Dao implements UserDaoInterface {

    // When using the UserDao you must supply the name of the database to access
    public UserDao(String dbName) {
        super(dbName);
    }

    /**
     * Find a specific <code>User</code> in the database matching a supplied
     * username and password.
     *
     * @param uname The username of the <code>User</code> being searched for
     * @param pword The password of the <code>User</code> being searched for
     *
     * @return The <code>User</code> object matching the supplied information.
     *         If no match is found for the supplied information, then the
     *         object will be null.
     */
    @Override
    public user findUserByUsernamePassword(String uname, String pword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE username = ? AND password = ?";
           
             String Pass= pword;
         String hashPass = null;
                ps = con.prepareStatement(query);
                MessageDigest sha = MessageDigest.getInstance("SHA-256");

      // Add password bytes to digest
      sha.update(Pass.getBytes());

      // Get the hash's bytes
      byte[] bytes = sha.digest();
      // This bytes[] has bytes in decimal format. Convert it to hexadecimal format
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < bytes.length; i++) {
        sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
      }
      // Get complete hashed password in hex format
      hashPass = sb.toString();
            ps.setString(1, uname);
            //pass hashed password as user password and compare with hashed password in database
            ps.setString(2, hashPass);

            rs = ps.executeQuery();
            if (rs.next()) {
               
                String username = rs.getString("username");
                String password = rs.getString("lastName");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("password");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                Date DOB = rs.getDate("DOB");
            
                u = new user(username, password, FirstName, LastName,Email,phone,DOB);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByUsernamePassword method:");
            System.err.println("\t" + e.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
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
                System.err.println("A problem occurred when closing down the findUserByUsernamePassword method:\n" + e.getMessage());
            }
           
        }
          return u;    // u may be null 
    }

    /**
     * Find the first <code>User</code> matching a specified username. If more
     * than one <code>User</code> matching the username is found, only the first
     * match will be returned.
     *
     * @param uname The username of the User being searched for.
     *
     * @return A <code>User</code> matching the specified username, otherwise
     *         null.
     */
    @Override
    public user findUserByUsername(String uname) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE USERNAME = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);

            rs = ps.executeQuery();
            if (rs.next()) {
   
                String username = rs.getString("firstName");
                String password = rs.getString("lastName");
                String FirstName = rs.getString("username");
                String LastName = rs.getString("password");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                Date DOB = rs.getDate("DOB");
                
                u = new user(username, password, FirstName, LastName,Email,phone,DOB);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
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
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

    /**
     * Check if the <code>User</code> matching a specified username has admin
     * status.
     *
     * @param uname The username of the <code>User</code> being searched for.
     *
     * @return True if the <code>User</code> matching the specified username is
     *         marked as an admin, otherwise false.
     */
    @Override
    public boolean checkIfUserIsAdmin(String uname) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean isAdmin = false;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE USERNAME = ? AND isAdmin = TRUE";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);

            rs = ps.executeQuery();
            if (rs.next()) {
                isAdmin = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the checkIfUserIsAdmin method:");
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
                System.err.println("A problem occurred when closing down the checkIfUserIsAdmin method:\n" + e.getMessage());
            }
        }
        return isAdmin;     // true if the user is an admin, false otherwise 
    }

    /**
     * Add a new <code>User</code> to the database.
     *
     * @param u The <code>User</code> to be added to the database.
     *
     * @return True if the <code>User</code> was successfully added to the
     *         database, false otherwise.
     */
    
    @Override
    public boolean addUser(user u) {
        Connection con = null;
        PreparedStatement ps = null;
         
        
        if (findUserByUsername(u.getUsername()) == null) {
            
            try {
                con = this.getConnection();
                // Create MessageDigest instance for SHA-256
      
   

                String query = "INSERT INTO user(UserId, username, password, FirstName, Lastname,  Email, Phone,  DOB) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                String Pass= u.getPassword();
         String hashPass = null;
                ps = con.prepareStatement(query);
                MessageDigest sha = MessageDigest.getInstance("SHA-256");

      // Add password bytes to digest
      sha.update(Pass.getBytes());

      // Get the hash's bytes
      byte[] bytes = sha.digest();
      // This bytes[] has bytes in decimal format. Convert it to hexadecimal format
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < bytes.length; i++) {
        sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
      }
      // Get complete hashed password in hex format
      hashPass = sb.toString();
     
      
                ps.setInt(1, 0);
                ps.setString(2, u.getUsername());
                //set hashed password as user password
                ps.setString(3, hashPass);
                ps.setString(4, u.getFirstName());
                ps.setString(5, u.getLastName());
                ps.setString(6, u.getEmail());
                ps.setString(7, u.getPhone());
                ps.setDate(8, u.getDOB());

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addUser method:");
                System.err.println("\t" + e.getMessage());
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        freeConnection(con);
                    }
                } catch (SQLException e) {
                    System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
                }
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * Edits the users details 
     * @param u Object U of the user to be edited
     * @param username The username of user to be edited
     * @return 
     */
    public boolean editUser(user u,String username) {
        Connection con = null;
        PreparedStatement ps = null;
         boolean edit = false;
        try {
            con = this.getConnection();
               // update users set firstname = "kia213123n" , phone = "55555555" , lastname = "harding" where lastname = "Meshach"
            String query = "UPDATE user SET firstname = ? , lastname = ? , Email = ? , Phone = ? WHERE username = ?";

            ps = con.prepareStatement(query);

            ps.setString(1, u.getFirstName());
            ps.setString(2, u.getLastName());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPhone());
            ps.setString(5, username);


            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();
             edit = true;
            // Find out what the id generated for this entry was


        } 
        catch (SQLException e) 
        {
            System.err.println("\tA problem occurred during the addUser method:");
            System.err.println("\t"+e.getMessage());

        } 
        finally 
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
            } 
            catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
            }
        }
        return edit;
    }
    
    @Override
    public boolean removeUser(user u) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();

            String query = "DELETE FROM user WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, u.getUsername());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                removed = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the removeUser method:");
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
                System.err.println("A problem occurred when closing down the removeUser method:\n" + e.getMessage());
            }
        }
        return removed;
    }

  
}
