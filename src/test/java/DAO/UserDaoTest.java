package DAO;

import DTO.user;
import java.sql.Date;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class UserDaoTest {

    public UserDaoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testFindUserByUsernamePasswordFail() {
        System.out.println("findUserByUsernamePassword");
        String uname = "Ki";
        String pword = "pas";
        UserDao userDao = new UserDao("clothes_shop_test");
        user expResult = null;
        user result = userDao.findUserByUsernamePassword(uname, pword);

        assertEquals(expResult, result);
    }

    @Test
    public void testFindUserByUsernamePasswordPass() {
        System.out.println("findUserByUsernamePassword");
        String uname = "Kian";
        String pword = "Password@123";
        UserDao userDao = new UserDao("clothes_shop_test");
        String expResult = "Kian_test";
        user result = userDao.findUserByUsernamePassword(uname, pword);

        // assert that the method returns a non-null user
        assertNotNull(result);

        // assert that the user attributes are correct
        assertEquals(2, result.getUserId());
        assertEquals("Kian", result.getUsername());
        assertEquals("Kian", result.getFirstName());
        assertEquals("Harding", result.getLastName());
        assertEquals("kh@gmail.com", result.getEmail());
        assertEquals("830995017", result.getPhone());
        assertEquals(Date.valueOf("2023-01-02"), result.getDOB());
        assertTrue(result.isIsAdmin());
        assertEquals("Where were you when you first heard about 9/11?", result.getQuestion());
        assertEquals("Playground with stuffed animal", result.getAnswer());
        assertEquals(0, result.getSubscription());
    }

    @Test
    public void testFindUserByUsernameFail() {
        System.out.println("findUserByUsername");
        String uname = "Kia";
        UserDao userDao = new UserDao("clothes_shop_test");
        user expResult = null;
        user result = userDao.findUserByUsername(uname);
        assertEquals(expResult, result);

    }

    @Test
    public void testFindUserByUsernamePass() {
        // setup test data
        UserDao userDao = new UserDao("clothes_shop_test");

        // call the method being tested
        user result = userDao.findUserByUsername("Kian");

        // assert that the method returns a non-null user
        assertNotNull(result);

        // assert that the user attributes are correct
        assertEquals(2, result.getUserId());
        assertEquals("Kian", result.getUsername());
        assertEquals("Kian", result.getFirstName());
        assertEquals("Harding", result.getLastName());
        assertEquals("kh@gmail.com", result.getEmail());
        assertEquals("830995017", result.getPhone());
        assertEquals(Date.valueOf("2023-01-02"), result.getDOB());
        assertTrue(result.isIsAdmin());
        assertEquals("Where were you when you first heard about 9/11?", result.getQuestion());
        assertEquals("Playground with stuffed animal", result.getAnswer());
        assertEquals(0, result.getSubscription());

    }

    @Test
    public void testAddUser() {
        System.out.println("addUser");
        // setup test data
        String dob = "2001-02-07";
        Date date = Date.valueOf(dob);

        user u = new user(7, "Kiantest", "Password4", "kian", "Harding", "kian2ki@hotmail.com", "0838381391", "Test", "Test", date, false, 1);

        // setup test environment
        UserDao userDao = new UserDao("clothes_shop_test");

        // call the method being tested
        boolean result = userDao.addUser(u);

        // assert that the method returns true
        assertTrue(result);

        // assert that the user was added to the database
        user retrievedUser = userDao.findUserByUsername(u.getUsername());
        assertNotNull(retrievedUser);

        // cleanup test data
        userDao.removeUser(u.getUsername());
    }

    /**
     * Test of findUserDetails method, of class UserDao.
     */
    @Test
    public void testFindUserDetails() {
        System.out.println("findUserDetails");
        String uname = "Kian";
        String question = "Where were you when you first heard about 9/11?";
        String answer = "Playground with stuffed animal";
        UserDao userDao = new UserDao("clothes_shop_test");
        user result = userDao.findUserDetails(uname, question, answer);
        assertEquals("Where were you when you first heard about 9/11?", result.getQuestion());
        assertEquals("Playground with stuffed animal", result.getAnswer());
        assertEquals(0, result.getSubscription());
    }

    /**
     * Test of findUserByEmail method, of class UserDao.
     */
    @Test
    public void testFindUserByEmail() {
        System.out.println("findUserByEmail");
        String email = "kh@gmail.com";
        String Username = "Kian";
        UserDao userDao = new UserDao("clothes_shop_test");

        user result = userDao.findUserByEmail(email, Username);
        assertEquals(2, result.getUserId());
        assertEquals("Kian", result.getUsername());
        assertEquals("Kian", result.getFirstName());
        assertEquals("Harding", result.getLastName());
        assertEquals("kh@gmail.com", result.getEmail());
        assertEquals("830995017", result.getPhone());
        assertEquals(Date.valueOf("2023-01-02"), result.getDOB());
        assertTrue(result.isIsAdmin());
        assertEquals("Where were you when you first heard about 9/11?", result.getQuestion());
        assertEquals("Playground with stuffed animal", result.getAnswer());
        assertEquals(0, result.getSubscription());
    }

    /**
     * Test of findUserById method, of class UserDao.
     */
    @Test
    public void testFindUserById() {
        System.out.println("findUserById");
        int id = 2;
        UserDao userDao = new UserDao("clothes_shop_test");

        user result = userDao.findUserById(id);

        assertEquals(2, result.getUserId());
        assertEquals("Kian", result.getUsername());
        assertEquals("Kian", result.getFirstName());
        assertEquals("Harding", result.getLastName());
        assertEquals("kh@gmail.com", result.getEmail());
        assertEquals("830995017", result.getPhone());
        assertEquals(Date.valueOf("2023-01-02"), result.getDOB());
        assertTrue(result.isIsAdmin());
        assertEquals("Where were you when you first heard about 9/11?", result.getQuestion());
        assertEquals("Playground with stuffed animal", result.getAnswer());
        assertEquals(0, result.getSubscription());
    }

    /**
     * Test of checkIfUserIsAdmin method, of class UserDao.
     */
    @Test
    public void testCheckIfUserIsAdmin() {
        System.out.println("checkIfUserIsAdmin");
        String uname = "Kian";
        UserDao userDao = new UserDao("clothes_shop_test");

        assertTrue(userDao.checkIfUserIsAdmin(uname));
    }

    /**
     * Test of ListAllUsers method, of class UserDao.
     */
    @Test
    public void testListAllUsers() {
        System.out.println("ListAllUsers");
        UserDao userDao = new UserDao("clothes_shop_test");

        List<user> result = userDao.ListAllUsers();
        assertNotNull(result);
        assertTrue(result.size() > 0);

    }

//    /**
//     * Test of editUser method, of class UserDao.
//     */
//    @Test
//    public void testEditUser() {
//        System.out.println("editUser");
//        user u = null;
//        String username = "";
//        UserDao instance = null;
//        boolean expResult = false;
//        boolean result = instance.editUser(u, username);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    /**
     * Test of removeUser method, of class UserDao.
     */
    @Test
    public void testRemoveUser() {
        System.out.println("removeUser");

        // setup test data
        String dob = "2001-02-07";
        Date date = Date.valueOf(dob);
        String Username = "Kiantest";
        user u = new user(7, "Kiantest", "Password4", "kian", "Harding", "kian2ki@hotmail.com", "0838381391", "Test", "Test", date, false, 1);

        // setup test environment
        UserDao userDao = new UserDao("clothes_shop_test");

        // call the method being tested
        userDao.addUser(u);

        boolean expResult = true;
        boolean result = userDao.removeUser(Username);
        assertEquals(expResult, result);

    }

    /**
     * Test of updatePass method, of class UserDao.
     */
    @Test
    public void testUpdatePass() {
         System.out.println("updatePass");

        String dob = "2023-01-02";
        Date date = Date.valueOf(dob);
        user u = new user(7, "Kiantest", "Password4", "kian", "Harding", "kian2ki@hotmail.com", "0838381391", "Test", "Test", date, false, 1);
        String password = "Password3";
        
        UserDao userDao = new UserDao("clothes_shop_test");
        userDao.addUser(u);
        boolean expResult = true;
        boolean result = userDao.updatePass(u, password);
        assertEquals(expResult, result);
        userDao.removeUser("Kiantest");
        
    }

//    /**
//     * Test of addReset method, of class UserDao.
//     */
//    @Test
//    public void testAddReset() {
//        System.out.println("addReset");
//        String email = "";
//        String token = "";
//        UserDao instance = null;
//        boolean expResult = false;
//        boolean result = instance.addReset(email, token);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

}
