package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {

    private final String databaseName;

    public Dao(String databaseName) {
        this.databaseName = databaseName;
    }

    /**
     *
     * Returns a connection to the specified MySQL database.
     *
     * @return a {@link java.sql.Connection} object representing a connection to
     * the database.
     *
     * catches ClassNotFoundException if the MySQL JDBC driver cannot be found.
     *
     * catches SQLException if a database access error occurs or the URL is
     * null.
     */
    public Connection getConnection() {

        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/" + databaseName;
        String username = "root";
        String password = "";
        Connection con = null;
        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex1)
        {
            System.out.println("Failed to find driver class " + ex1.getMessage());
            System.exit(1);
        } catch (SQLException ex2)
        {
            System.out.println("Connection failed " + ex2.getMessage());
            System.exit(2);
        }
        return con;
    }

    /**
     *
     * Releases the specified {@link java.sql.Connection} object and makes it
     * available for reuse.
     *
     * @param con the {@link java.sql.Connection} object to release
     * catches SQLException if a database access error occurs
     */
    public void freeConnection(Connection con) {
        try
        {
            if (con != null)
            {
                con.close();
                con = null;
            }
        } catch (SQLException e)
        {
            System.out.println("Failed to free connection: " + e.getMessage());
            System.exit(1);
        }
    }

    /**
     * Returns the string with database name in it
     * 
     * @return a string containing name of database
     */
    public String getDatabaseName() {
        return databaseName;
    }
}
