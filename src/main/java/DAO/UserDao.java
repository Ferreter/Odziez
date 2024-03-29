package DAO;

/**
 *
 * @author Kian
 */
import DTO.products;
import DTO.user;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
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
     * If no match is found for the supplied information, then the object will
     * be null.
     */
    @Override
    public user findUserByUsernamePassword(String uname, String pword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement ps2 = null;
        ResultSet rs2 = null;
        user u = null;
        try {
            con = this.getConnection();

            // Retrieve the user's data from the user table
            String query = "SELECT * FROM user WHERE username=?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Get the hashed password and salt for the user
                int UserId = rs.getInt("UserId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("LastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");
                String storedSalt = null;

                // Retrieve the user's salt from the salt table
                String saltQuery = "SELECT * FROM salt WHERE username=?";
                ps2 = con.prepareStatement(saltQuery);
                ps2.setString(1, uname);
                rs2 = ps2.executeQuery();

                if (rs2.next()) {
                    storedSalt = rs2.getString("salt");
                }

                // Hash the entered password with the stored salt
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(Base64.getDecoder().decode(storedSalt));
                byte[] hashedEnteredPasswordBytes = md.digest(pword.getBytes());
                String hashedEnteredPassword = Base64.getEncoder().encodeToString(hashedEnteredPasswordBytes);

                // Compare the hashed entered password with the stored hashed password
                if (hashedEnteredPassword.equals(password)) {
                    // Create a User object and return it
                    u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);
                    return u;
                }
            }

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByUsername method:");
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
                if (rs2 != null) {
                    rs2.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the findUserByUsername method:\n" + e.getMessage());
            }
        }
        return null;
    }

    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    /**
     *
     * Checks if the given username and password match an existing user in the
     * database.
     *
     * @param uname the username to check
     *
     * @param pword the password to check
     *
     * @return true if the username and password match an existing user, false
     * otherwise
     */
    @Override
    public boolean confirmUserByUsernamePassword(String uname, String pword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        boolean confirm = false;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE username = ? AND password = ?";

            //Password to harsh Variable
            String Pass = pword;
            // salt String to add to SHA abbreviation of teammate names
            String salt = "ferkhki";
            // Variable to store Generated secure hashed and saltes password
            String hashPass = null;
            ps = con.prepareStatement(query);

            MessageDigest sha = MessageDigest.getInstance("SHA-256");

            // Add password bytes to digest
            sha.update(salt.getBytes());

            // Get the hash's bytes
            byte[] bytes = sha.digest(Pass.getBytes());
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
                int UserId = rs.getInt("UserId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("LastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");

                u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);

                confirm = true;
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
        return confirm;    // u may be null 
    }

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

                int UserId = rs.getInt("UserId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("lastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");

                u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);
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
     *
     * Finds user details by checking the given username, question, and answer
     * against the database.
     *
     * @param uname the username of the user to find details for
     * @param question the security question of the user to find details for
     * @param answer the security answer of the user to find details for
     * @return a user object representing the details of the found user, or null
     * if not found
     */
    @Override
    public user findUserDetails(String uname, String question, String answer) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE username = ? AND Question = ? AND Answer = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, question);
            ps.setString(3, answer);

            rs = ps.executeQuery();
            if (rs.next()) {

                int UserId = rs.getInt("UserId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("lastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");

                u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserDetails() method:");
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
                System.err.println("A problem occurred when closing down the findUserDetails() method:\n" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

    /**
     * Retrieves a User object from the database based on the given email and
     * username.
     *
     * @param email the email of the user to be retrieved
     * @param username the username of the user to be retrieved
     * @return a User object representing the retrieved user, or null if no user
     * was found
     */
    public user findUserByEmail(String email, String Username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE Email = ? AND Username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, Username);

            rs = ps.executeQuery();
            if (rs.next()) {

                int UserId = rs.getInt("UserId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String FirstName = rs.getString("firstName");
                String LastName = rs.getString("lastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");

                u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserByEmail method:");
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
                System.err.println("A problem occurred when closing down the findUserByEmail method:\n" + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

    /**
     *
     * Retrieves a user from the database based on their user ID.
     *
     * @param id the user ID to search for
     *
     * @return the user object if found, or null if not found
     */
    @Override
    public user findUserById(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        user u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM user WHERE UserId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {

                int UserId = rs.getInt("UserId");
                String username = rs.getString("firstName");
                String password = rs.getString("password");
                String FirstName = rs.getString("username");
                String LastName = rs.getString("lastName");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("Question");
                String Answer = rs.getString("Answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");

                u = new user(UserId, username, password, FirstName, LastName, Email, phone, Question, Answer, DOB, isAdmin, subscription);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findUserById method:");
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
                System.err.println("A problem occurred when closing down the findUserById() method:\n" + e.getMessage());
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
     * marked as an admin, otherwise false.
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
     * Add a new <code>User</code> to the database.Uses SHA-256 encryption to
     * securely hash the new password before storing it. Returns true if the
     * update is successful, false otherwise.
     *
     * @param u The <code>User</code> to be added to the database.
     *
     * @return True if the <code>User</code> was successfully added to the
     * database, false otherwise.
     */
    @Override
    public boolean addUser(user u) {
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        if (findUserByUsername(u.getUsername()) == null) {

            try {
                con = this.getConnection();

                // Generate a random salt
                SecureRandom random = new SecureRandom();
                byte[] saltBytes = new byte[16];
                random.nextBytes(saltBytes);
                String salt = Base64.getEncoder().encodeToString(saltBytes);

                // Hash the password with the salt
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(saltBytes);
                byte[] hashedPasswordBytes = md.digest(u.getPassword().getBytes());
                String hashedPassword = Base64.getEncoder().encodeToString(hashedPasswordBytes);

                // Insert the user's data into the user table
                String userQuery = "INSERT INTO user(UserId, username, password, FirstName, Lastname,  Email, Phone, Question, Answer,  DOB, subscription) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(userQuery);
                ps.setInt(1, 0);
                ps.setString(2, u.getUsername());
                ps.setString(3, hashedPassword);
                ps.setString(4, u.getFirstName());
                ps.setString(5, u.getLastName());
                ps.setString(6, u.getEmail());
                ps.setString(7, u.getPhone());
                ps.setString(8, u.getQuestion());
                ps.setString(9, u.getAnswer());
                ps.setDate(10, u.getDOB());
                ps.setInt(11, u.getSubscription());
                ps.executeUpdate();

                // Insert the salt into the salt table
                String saltQuery = "INSERT INTO salt(username, salt) VALUES (?, ?)";
                ps2 = con.prepareStatement(saltQuery);
                ps2.setString(1, u.getUsername());
                ps2.setString(2, salt);
                ps2.executeUpdate();

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
                    if (ps2 != null) {
                        ps2.close();
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
     *
     * Retrieves a list of all users from the database
     *
     * @return List of user objects representing all users in the database
     */
    @Override
    public List<user> ListAllUsers() {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<user> users = new ArrayList();
        user u = null;
        String products = "";

        try {
            con = getConnection();

            String query = "SELECT * FROM user ORDER BY `UserId` ASC";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {

                int UserId = rs.getInt("UserId");
                String username = rs.getString("firstName");
                String password = rs.getString("lastName");
                String FirstName = rs.getString("username");
                String LastName = rs.getString("password");
                String Email = rs.getString("email");
                String phone = rs.getString("phone");
                String Question = rs.getString("question");
                String Answer = rs.getString("answer");
                Date DOB = rs.getDate("DOB");
                boolean isAdmin = rs.getBoolean("isAdmin");
                int subscription = rs.getInt("subscription");
                u = new user(UserId, FirstName, LastName, username, password, Email, phone, Question, Answer, DOB, isAdmin, subscription);

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the ListAllUsers() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the ListAllUsers() method: " + e.getMessage());
            }
        }
        return users;

    }

    /**
     * Edits the users details
     *
     * @param u Object U of the user to be edited
     * @param username The username of user to be edited
     * @return
     */
    public boolean editUser(user u, String username) {
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

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the editUser method:");
            System.err.println("\t" + e.getMessage());

        } finally {
            try {

                if (ps != null) {
                    ps.close();

                }

                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the editUser method:\n" + e.getMessage());
            }
        }
        return edit;
    }

    /**
     *
     * Removes a user from the database by their username.
     *
     * @param Username the username of the user to be removed
     *
     * @return true if the user was successfully removed, false otherwise
     */
    @Override
    public boolean removeUser(String Username) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();
            
            String query = "DELETE FROM salt WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, Username);
            int rowsAffected2 = ps.executeUpdate();
            
            String query2 = "DELETE FROM user WHERE username = ?";
            ps = con.prepareStatement(query2);
            ps.setString(1, Username);

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
    @Override
    public boolean updatePass(user u, String newPassword) {
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        boolean update = false;

        try {
            con = this.getConnection();

            // Generate a random salt
            SecureRandom random = new SecureRandom();
            byte[] saltBytes = new byte[16];
            random.nextBytes(saltBytes);
            String salt = Base64.getEncoder().encodeToString(saltBytes);

            // Hash the new password with the salt
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(saltBytes);
            byte[] hashedPasswordBytes = md.digest(newPassword.getBytes());
            String hashedPassword = Base64.getEncoder().encodeToString(hashedPasswordBytes);

            // Insert the salt into the salt table
            String saltQuery = "INSERT INTO salt(username, salt) VALUES (?, ?)";
            ps = con.prepareStatement(saltQuery);
            ps.setString(1, u.getUsername());
            ps.setString(2, salt);
            ps.executeUpdate();

            // Update the user's password in the user table
            String userQuery = "UPDATE user SET password = ? WHERE username = ?";
            ps2 = con.prepareStatement(userQuery);
            ps2.setString(1, hashedPassword);
            ps2.setString(2, u.getUsername());
            ps2.executeUpdate();

            update = true;
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the updatePass method:");
            System.err.println("\t" + e.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the updatePass method:\n" + e.getMessage());
            }
        }

        return update;
    }

    /**
     *
     * Adds a password reset token to the database for a given email.
     *
     * @param email the email address of the user requesting the password reset
     *
     * @param token the token generated for the password reset
     *
     * @return true if the reset was added successfully, false otherwise
     */
    public boolean addReset(String email, String token) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean added = false;
        try {
            con = this.getConnection();

            String query = "INSERT INTO reset (Email, Token) VALUES (?, ?)";

            ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, token);

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();
            added = true;

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addReset method:");
            System.err.println("\t" + e.getMessage());

        } finally {
            try {

                if (ps != null) {
                    ps.close();

                }

                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the addReset method:\n" + e.getMessage());
            }
        }
        return added;
    }

    /**
     * Deletes a user's profile from the database.
     *
     * @param u the user object to be deleted
     * @return true if the user profile was successfully deleted, false
     * otherwise
     */
    public boolean deleteUserProfile(user u) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();

            String query = "DELETE FROM user WHERE UserId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, u.getUserId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                removed = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the deleteUserProfile method:");
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
                System.err.println("A problem occurred when closing down the deleteUserProfile method:\n" + e.getMessage());
            }
        }
        return removed;
    }

    /**
     * Edits a user's profile from the database.
     *
     * @param u the user object to be edited
     * @return true if the user profile was successfully edited, false otherwise
     */
    public boolean editProfile(user u, String FirstName, String LastName, String Email, String Phone, Date DOB) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean edit = false;
        try {
            con = this.getConnection();

            String query = "UPDATE user SET FirstName = ? , Lastname = ? , Email = ? , Phone = ? , DOB = ? WHERE username = ?";

            ps = con.prepareStatement(query);

            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, Email);
            ps.setString(4, Phone);
            ps.setDate(5, DOB);
            ps.setString(6, u.getUsername());

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();
            edit = true;
            // Find out what the id generated for this entry was

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the editProfile method:");
            System.err.println("\t" + e.getMessage());

        } finally {
            try {

                if (ps != null) {
                    ps.close();

                }

                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the editProfile method:\n" + e.getMessage());
            }
        }
        return edit;
    }

}
