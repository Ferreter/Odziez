/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.Cart;
import java.util.List;
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
public class CartDaoTest {
    
    public CartDaoTest() {
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
     * Test of addCart method, of class CartDao.
     */
    @Test
    public void testAddCart() {
        System.out.println("addCart");
        Cart u = null;
        CartDao instance = null;
        boolean expResult = false;
        boolean result = instance.addCart(u);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ListAllCart method, of class CartDao.
     */
    @Test
    public void testListAllCart() {
        System.out.println("ListAllCart");
        int userid = 0;
        CartDao instance = null;
        List<Cart> expResult = null;
        List<Cart> result = instance.ListAllCart(userid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateQuantity method, of class CartDao.
     */
    @Test
    public void testUpdateQuantity() throws Exception {
        System.out.println("updateQuantity");
        int userId = 0;
        String productId = "";
        int quantity = 0;
        CartDao instance = null;
        instance.updateQuantity(userId, productId, quantity);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteCartItem method, of class CartDao.
     */
    @Test
    public void testDeleteCartItem() {
        System.out.println("deleteCartItem");
        String productId = "";
        CartDao instance = null;
        instance.deleteCartItem(productId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
