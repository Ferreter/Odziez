///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
// */
//package DAO;
//
//import DTO.user;
//import org.junit.After;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import static org.junit.Assert.*;
//
///**
// *
// * @author kian2
// */
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
//    /**
//     * Test of findUserByUsernamePassword method, of class UserDao.
//     */
//    @Test
//    public void testFindUserByUsernamePassword() {
//        System.out.println("findUserByUsernamePassword");
//        String uname = "";
//        String pword = "";
//        UserDao instance = null;
//        user expResult = null;
//        user result = instance.findUserByUsernamePassword(uname, pword);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of findUserByUsername method, of class UserDao.
//     */
//    @Test
//    public void testFindUserByUsername() {
//        System.out.println("findUserByUsername");
//        String uname = "";
//        UserDao instance = null;
//        user expResult = null;
//        user result = instance.findUserByUsername(uname);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of checkIfUserIsAdmin method, of class UserDao.
//     */
//    @Test
//    public void testCheckIfUserIsAdmin() {
//        System.out.println("checkIfUserIsAdmin");
//        String uname = "";
//        UserDao instance = null;
//        boolean expResult = false;
//        boolean result = instance.checkIfUserIsAdmin(uname);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of addUser method, of class UserDao.
//     */
//    @Test
//    public void testAddUser() {
//        System.out.println("addUser");
//        user u = null;
//        UserDao instance = null;
//        boolean expResult = false;
//        boolean result = instance.addUser(u);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
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
//    
//}
