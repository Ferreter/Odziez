///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
// */
//package DAO;
//
//import DTO.Cart;
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
//public class CartDaoTest {
//    
//    public CartDaoTest() {
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
//     * Test of addCart method, of class CartDao.
//     */
//    @Test
//    public void testAddCart() {
//        System.out.println("addCart");
//        Cart u = new Cart(1,"Test",5,6.0,6.0);
//    
//        CartDao cartdao = new CartDao("clothes_shop_test");
//        boolean expResult = true;
//        boolean result = cartdao.addCart(u);
//        assertEquals(expResult, result);
//        
//    }
//
//    /**
//     * Test of ListAllCart method, of class CartDao.
//     */
//    @Test
//    public void testListAllCart() {
//        System.out.println("ListAllCart");
//        int userid = 1;
//        CartDao cartdao = new CartDao("clothes_shop_test");
//        
//        List<Cart> result = cartdao.ListAllCart(userid);
//        assertNotNull(result);
//        assertTrue(result.size() > 0);
//    }
//
//    /**
//     * Test of AddQuantity method, of class CartDao.
//     */
//    @Test
//    public void testAddQuantity() {
//        System.out.println("AddQuantity");
//        String productId = "Test";
//        CartDao cartdao = new CartDao("clothes_shop_test");
//         cartdao.AddQuantity(productId);
//        
//    }
//
//    /**
//     * Test of DelQuantity method, of class CartDao.
//     */
//    @Test
//    public void testDelQuantity() {
//        System.out.println("DelQuantity");
//        String productId = "Test";
//        CartDao cartdao = new CartDao("clothes_shop_test");
//        cartdao.DelQuantity(productId);
//       
//    }
//
//    /**
//     * Test of deleteCartItem method, of class CartDao.
//     */
//    @Test
//    public void testDeleteCartItem() {
//        System.out.println("deleteCartItem");
//        String productId = "Test";
//        CartDao cartdao = new CartDao("clothes_shop_test");
//        cartdao.deleteCartItem(productId);
//    }
//
//    /**
//     * Test of EmptyCartItem method, of class CartDao.
//     */
//    @Test
//    public void testEmptyCartItem() {
//        System.out.println("EmptyCartItem");
//        int userId = 1;
//        Cart u = new Cart(1,"Test",5,6.0,6.0);
//    
//        CartDao cartdao = new CartDao("clothes_shop_test");
//        cartdao.addCart(u);
//        cartdao.EmptyCartItem(userId);
//    }
//    
//}
