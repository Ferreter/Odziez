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
     * Add a new <code>User</code> to the database.Uses SHA-256 encryption to
     * securely hash the new password before storing it. Returns true if the
     * update is successful, false otherwise.
     *
     * @param u The <code>User</code> to be added to the database.
     *
     * @return True if the <code>User</code> was successfully added to the
     * database, false otherwise.
     */
    public boolean addUser(user u);

    public boolean updatePass(user u, String password);


    /**
     *
     * Updates the password for a given user in the database. Uses SHA-256
     * encryption to securely hash the new password before storing it. Returns
     * true if the update is successful, false otherwise.
     *
     * @param u the user object containing the updated password and username
     * @return true if the update is successful, false otherwise
     * @throws SQLException if there is an error with the SQL query
     * @throws NoSuchAlgorithmException if SHA-256 encryption is not available
     */
    

    /**
     *
     * Retrieves a list of all users from the database
     *
     * @return List of user objects representing all users in the database
     */
    public List<user> ListAllUsers();

    /**
     *
     * Removes a user from the database by their username.
     *
     * @param Username the username of the user to be removed
     *
     * @return true if the user was successfully removed, false otherwise
     */
    public boolean removeUser(String UserId);
public user findUserDetails(String uname, String question, String answer);
    public user findUserById(int id);

}
