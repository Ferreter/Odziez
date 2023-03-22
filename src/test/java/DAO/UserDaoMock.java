//package DAO;
//
//import DAO.UserDao;
//import DTO.user;
//import static org.mockito.Mockito.*;
//
//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import org.junit.Assert;
//import org.junit.Before;
//import org.junit.Test;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//
//public class UserDaoMock {
//
//    @Mock
//    private Connection mockConnection;
//
//    @Mock
//    private PreparedStatement mockPreparedStatement;
//
//    @Mock
//    private ResultSet mockResultSet;
//
//    private UserDao userDao;
//  @Before
//    public void setUp() throws SQLException {
//        
//        Connection mockConnection = mock(Connection.class);
//         mockResultSet = mock(ResultSet.class); 
//         mockPreparedStatement = mock(PreparedStatement.class);
//         mockConnection = mock(Connection.class);
//    }
//  
//
//    @Test
//    public void testFindUserByUsername() throws SQLException {
//        String username = "testUser";
//        String dob = "2001-02-07";
//        Date date = Date.valueOf(dob);
//        
//        user expectedUser = new user(1, username, "password", "John", "Doe", "john.doe@example.com", "123-456-7890", "What is your favorite color?", "Blue", date, false, 0);
//
//        // Mock the result set to return the expected user
//        when(mockResultSet.next()).thenReturn(true);
//        when(mockResultSet.getInt("UserId")).thenReturn(expectedUser.getUserId());
//        when(mockResultSet.getString("username")).thenReturn(expectedUser.getUsername());
//        when(mockResultSet.getString("password")).thenReturn(expectedUser.getPassword());
//        when(mockResultSet.getString("firstName")).thenReturn(expectedUser.getFirstName());
//        when(mockResultSet.getString("lastName")).thenReturn(expectedUser.getLastName());
//        when(mockResultSet.getString("email")).thenReturn(expectedUser.getEmail());
//        when(mockResultSet.getString("phone")).thenReturn(expectedUser.getPhone());
//        when(mockResultSet.getString("question")).thenReturn(expectedUser.getQuestion());
//        when(mockResultSet.getString("answer")).thenReturn(expectedUser.getAnswer());
//        when(mockResultSet.getDate("DOB")).thenReturn(expectedUser.getDOB());
//        when(mockResultSet.getBoolean("isAdmin")).thenReturn(expectedUser.isIsAdmin());
//        when(mockResultSet.getInt("subscription")).thenReturn(expectedUser.getSubscription());
//
//        // Mock the prepared statement to return the mock result set
//        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
//
//        // Mock the connection to return the mock prepared statement
//        when(mockConnection.prepareStatement("SELECT * FROM user WHERE USERNAME = ?")).thenReturn(mockPreparedStatement);
//
//        // Call the actual method
//        user actualUser = userDao.findUserByUsername(username);
//
//        // Verify that the prepared statement was called with the correct parameter
//        verify(mockPreparedStatement).setString(1, username);
//
//        // Verify that the prepared statement was executed
//        verify(mockPreparedStatement).executeQuery();
//
//        // Verify that the result set was closed
//        verify(mockResultSet).close();
//
//        // Verify that the prepared statement was closed
//        verify(mockPreparedStatement).close();
//
//        // Verify that the connection was returned to the pool
//        verify(mockConnection).close();
//
//        // Assert that the actual user matches the expected user
//        Assert.assertEquals(expectedUser, actualUser);
//    }
//}
