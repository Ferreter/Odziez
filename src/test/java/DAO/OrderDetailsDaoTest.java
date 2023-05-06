///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
// */
//package DAO;
//
//import DTO.OrderDetails;
//import java.util.List;
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
//public class OrderDetailsDaoTest {
//    
//    public OrderDetailsDaoTest() {
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
//     * Test of addOrderDetails method, of class OrderDetailsDao.
//     */
//    @Test
//    public void testAddOrderDetails() {
//        System.out.println("addOrderDetails");
//        OrderDetails u = new OrderDetails(2,"Test",2.0,3);
//        OrderDetailsDao detailsDao = new OrderDetailsDao("clothes_shop_test");
//        boolean expResult = true;
//        boolean result = detailsDao.addOrderDetails(u);
//        assertEquals(expResult, result);
//        
//    }
//
////    /**
////     * Test of findOrderDetailsById method, of class OrderDetailsDao.
////     */
////    @Test
////    public void testFindOrderDetailsById() {
////        System.out.println("findOrderDetailsById");
////        int UserId = 2;
////         OrderDetailsDao detailsDao = new OrderDetailsDao("clothes_shop_test");
////        List<OrderDetails> result = detailsDao.findOrderDetailsById(UserId);
////         assertNotNull(result);
////        assertTrue(result.size() > 0);
////    }
//    
//}
