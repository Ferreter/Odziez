package DAO;

import DTO.*;
import java.util.List;


/**
 *
 * @author Kian
 */
public interface UserDaoInterface {

    /**
     * Find a specific <code>User</code> in the database matching a supplied
     * username and password.
     *
     * @param uname The username of the <code>User</code> being searched for
     * @param pword The password of the <code>User</code> being searched for
     *
     * @return The <code>User</code> object matching the supplied information.
     * If no match is found for the supplied information, then the object will
     * be null.
     */
    public user findUserByUsernamePassword(String uname, String pword);

    /**
     * Find the first <code>User</code> matching a specified username. If more
     * than one <code>User</code> matching the username is found, only the first
     * match will be returned.
     *
     * @param uname The username of the User being searched for.
     *
     * @return A <code>User</code> matching the specified username, otherwise
     * null.
     */
    public user findUserByUsername(String uname);

    /**
     * Check if the <code>User</code> matching a specified username has admin
     * status.
     *
     * @param uname The username of the <code>User</code> being searched for.
     *
     * @return True if the <code>User</code> matching the specified username is
     * marked as an admin, otherwise false.
     */
    public boolean checkIfUserIsAdmin(String uname);

    /**
     * Add a new <code>User</code> to the database.
     *
     * @param u The <code>User</code> to be added to the database.
     *
     * @return True if the <code>User</code> was successfully added to the
     * database, false otherwise.
     */
    public boolean addUser(user u);
    public boolean updatePass(user u);
    public List<user> ListAllUsers();
    
    
    public boolean removeUser(String UserId);
    

}
