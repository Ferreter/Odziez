/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.orders;
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
        
        orders u = new orders(2,2,0,2.0,"Test");
        OrderDao orderDao = new OrderDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = orderDao.addOrder(u);
        assertEquals(expResult, result);
      
    }


    /**
     * Test of findOrdersByUserId method, of class OrderDao.
     */
    @Test
    public void testFindOrdersByUserId() {
        System.out.println("findOrdersByUserId");
        int userId = 2;
        OrderDao orderDao = new OrderDao("clothes_shop_test");
        List<orders> result = orderDao.findOrdersByUserId(userId);
        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

    /**
     * Test of AllOrders method, of class OrderDao.
     */
    @Test
    public void testAllOrders() {
        System.out.println("AllOrders");
        OrderDao orderDao = new OrderDao("clothes_shop_test");
        List<orders> result = orderDao.AllOrders();
        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

    /**
     * Test of ChangeStatus method, of class OrderDao.
     */
    @Test
    public void testChangeStatus() {
        System.out.println("ChangeStatus");
        int OrderId = 15;
        String Changed = "Processed";
        OrderDao orderDao = new OrderDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = orderDao.ChangeStatus(OrderId, Changed);
        assertEquals(expResult, result);
        
    }

}
