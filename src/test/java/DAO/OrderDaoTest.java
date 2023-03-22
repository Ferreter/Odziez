/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.orders;
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
public class OrderDaoTest {
    
    public OrderDaoTest() {
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
     * Test of addOrder method, of class OrderDao.
     */
    @Test
    public void testAddOrder() {
        System.out.println("addOrder");
        orders u = new orders("Test","Test","Test","Test","Test","Test","Test","Test","Test","Test","Test",22);
        OrderDao orderDao = new OrderDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = orderDao.addOrder(u);
        assertEquals(expResult, result);
        
    }

//    /**
//     * Test of getLastIndex method, of class OrderDao.
//     */
//    @Test
//    public void testGetLastIndex() {
//        System.out.println("getLastIndex");
//        OrderDao orderDao = new OrderDao("clothes_shop_test");
//        int expResult = 0;
//        int result = orderDao.getLastIndex();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
