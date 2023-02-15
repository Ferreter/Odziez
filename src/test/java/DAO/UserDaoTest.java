
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.user;
import java.sql.Date;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author kian2
 */
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

    /**
     * Test of findUserByUsernamePassword method, of class UserDao.
     * checking for a user that doesNotExist exist
     */
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
    
    /**
     * Test of findUserByUsernamePassword method, of class UserDao.
     * checking for a user that does exist
     */
    @Test
    public void testFindUserByUsernamePasswordPass() {
        System.out.println("findUserByUsernamePassword");
        String uname = "Kian";
        String pword = "password";
        UserDao userDao = new UserDao("clothes_shop_test");
        user expResult = null;
        user result = userDao.findUserByUsernamePassword(uname, pword);
        
        assertEquals(result,expResult );
       
        
    }

    /**
     * Test of findUserByUsername method, of class UserDao.
     */
    @Test
    public void testFindUserByUsernameFail() {
        System.out.println("findUserByUsername");
        String uname = "Kian2";
        UserDao userDao = new UserDao("clothes_shop_test");
        user expResult = null;
        user result = userDao.findUserByUsername(uname);
        assertEquals(expResult, result);
      
    }
    /**
     * Test of findUserByUsername method, of class UserDao.
     */
//    @Test
//    public void testFindUserByUsernamePass() {
//        System.out.println("findUserByUsername");
//        String uname = "Kian";
//        UserDao userDao = new UserDao("clothes_shop");
//        user expResult = null;
//        user result = userDao.findUserByUsername(uname);
//        assertEquals(expResult, result);
//      
//    }
  
    /**
     * Test of addUser method, of class UserDao.
     */
    @Test
    public void testAddUser() {
        System.out.println("addUser");
        String dob = "2001-02-07";
        Date date = Date.valueOf(dob);
        user u = new user("Kian2","password3","kian","Harding","kian2ki@hotmail.com","0838381391",date);
        UserDao userDao = new UserDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = userDao.addUser(u);
        assertEquals(expResult, result);
        
    }

    
}