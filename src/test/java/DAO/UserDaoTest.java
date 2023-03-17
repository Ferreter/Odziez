//package DAO;
//
//import DTO.user;
//import java.sql.Date;
//import org.junit.After;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import static org.junit.Assert.*;
//
//public class UserDaoTest {
//    
//    public UserDaoTest() {
//    }
//    
//    @BeforeClass
//    public static void setUpClass() {
//    }
//    
//    @AfterClass
//    public static void tearDownClass() {
//    }
//    
//    @Before
//    public void setUp() {
//    }
//    
//    @After
//    public void tearDown() {
//    }
//
//    @Test
//    public void testFindUserByUsernamePasswordFail() {
//        System.out.println("findUserByUsernamePassword");
//        String uname = "Ki";
//        String pword = "pas";
//        UserDao userDao = new UserDao("clothes_shop_test");
//        user expResult = null;
//        user result = userDao.findUserByUsernamePassword(uname, pword);
//        
//        assertEquals(expResult, result);
//    }
//    
//    @Test
//    public void testFindUserByUsernamePasswordPass() {
//        System.out.println("findUserByUsernamePassword");
//        String uname = "Kian";
//        String pword = "Password3";  
//        UserDao userDao = new UserDao("clothes_shop_test");
//        String expResult = "Kian_test";
//        user result = userDao.findUserByUsernamePassword(uname, pword);
//        
//        assertEquals(expResult,result.getUsername());
//    }
// 
//    @Test
//    public void testFindUserByUsernameFail() {
//        System.out.println("findUserByUsername");
//        String uname = "Kia";
//        UserDao userDao = new UserDao("clothes_shop_test");
//        user expResult = null;
//        user result = userDao.findUserByUsername(uname);
//        assertEquals(expResult, result);
//      
//    }
//
//    @Test
//public void testFindUserByUsernamePass() {
//    // setup test data
//    UserDao userDao = new UserDao("clothes_shop_test");
// 
//    // call the method being tested
//    user result = userDao.findUserByUsername("Kian");
//
//    // assert that the method returns a non-null user
//    assertNotNull(result);
//
//    // assert that the user attributes are correct
//    assertEquals(2, result.getUserId());
//    assertEquals("Kian", result.getUsername());
//    assertEquals("Kian", result.getFirstName());
//    assertEquals("Harding", result.getLastName());
//    assertEquals("kh@gmail.com", result.getEmail());
//    assertEquals("830995017", result.getPhone());
//    assertEquals(Date.valueOf("2023-01-02"), result.getDOB());
//    assertTrue(result.isIsAdmin());
//
//}
//    
//  
//    @Test
//        public void testAddUser() {
//        System.out.println("addUser");
//    // setup test data
//    String dob = "2001-02-07";
//    Date date = Date.valueOf(dob);
//    user u = new user(7,"Kiantest","Password4","kian","Harding","kian2ki@hotmail.com","0838381391",date,false);
//
//    // setup test environment
//    UserDao userDao = new UserDao("clothes_shop_test");
//   
//    // call the method being tested
//    boolean result = userDao.addUser(u);
//
//    // assert that the method returns true
//    assertTrue(result);
//
//    // assert that the user was added to the database
//    user retrievedUser = userDao.findUserByUsername(u.getUsername());
//    assertNotNull(retrievedUser);
//
//    // cleanup test data
//    userDao.removeUser(u.getUsername());
//}
//
//}
