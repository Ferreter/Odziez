/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.Cart;
import DTO.products;
import DTO.review;
import DTO.stock;
import java.sql.Date;
import java.util.ArrayList;
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
public class ProductsDaoTest {

    public ProductsDaoTest() {
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
     * Test of ListAllProducts method, of class ProductsDao.
     */
    @Test
    public void testListAllProducts() {
        System.out.println("ListAllProducts");
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");

        List<products> result = prodDao.ListAllProducts();
        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

    /**
     * Test of searchbyname method, of class ProductsDao.
     */
    @Test
    public void testSearchbyname() {
        System.out.println("searchbyname");
        String Name = "PARIS";
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");

        List<products> result = prodDao.searchbyname(Name);

        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

    /**
     * Test of searchbybrand method, of class ProductsDao.
     */
    @Test
    public void testSearchbybrand() {
        System.out.println("searchbybrand");
        String Brand = "Palm";
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        List<products> result = prodDao.searchbyname(Brand);

        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

    /**
     * Test of searchbyId method, of class ProductsDao.
     */
    @Test
    public void testSearchbyId() {
        System.out.println("searchbyId");
        String ProductId = "3R1GC01NRIZ10999";
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");

        products result = prodDao.searchbyId(ProductId);
        System.out.println(result.getName());
        assertNotNull(result);
    }

//    /**
//     * Test of getTotalCartPrice method, of class ProductsDao.
//     */
//    @Test
//    public void testGetTotalCartPrice() {
//        System.out.println("getTotalCartPrice");
//        ArrayList<Cart> cartList = null;
//        ProductsDao instance = null;
//        double expResult = 0.0;
//        double result = instance.getTotalCartPrice(cartList);
//        assertEquals(expResult, result, 0);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    /**
//     * Test of getCartProducts method, of class ProductsDao.
//     */
//    @Test
//    public void testGetCartProducts() {
//        System.out.println("getCartProducts");
//        ArrayList<Cart> cartList = null;
//        ProductsDao instance = null;
//        List<Cart> expResult = null;
//        List<Cart> result = instance.getCartProducts(cartList);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    /**
     * Test of insertReview method, of class ProductsDao.
     */
    @Test
    public void testInsertReview() {
        System.out.println("insertReview");
        String dob = "2001-02-07";
        Date date = Date.valueOf(dob);
        review r = new review(0, "3R1GC01NRIZ10999", 1, 4, "Test", date);

        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = prodDao.insertReview(r);
        assertEquals(expResult, result);

    }

    /**
     * Test of getReviewsByProductId method, of class ProductsDao.
     */
    @Test
    public void testGetReviewsByProductId() {
        System.out.println("getReviewsByProductId");
        String productId = "3R1GC01NRIZ10999";
        ProductsDao  prodDao = new ProductsDao("clothes_shop_test");
        List<review> result = prodDao.getReviewsByProductId(productId);
       assertNotNull(result);
        assertTrue(result.size() > 0);
    }
    
    /**
     * Test of AddProduct method, of class ProductsDao.
     */
    @Test
    public void testAddProduct() {
        System.out.println("AddProduct");

        stock s = new stock("Test", 1, 1, 1, 1, 1);
        products p = new products("Test", "Test", 2.0, 2.0, "Test", "Test", "Test", "Test");

        ProductsDao prodDao = new ProductsDao("clothes_shop_test");

        boolean result = prodDao.AddProduct(p, s);
        assertEquals(true, result);
    }

    /**
     * Test of findUserByProductId method, of class ProductsDao.
     */
    @Test
    public void testFindUserByProductId() {
        System.out.println("findUserByProductId");
        String pId = "727163TNVR31070";
        products p = new products("727163TNVR31070", "MIRROR BALENCIAGA HOODIE OVERSIZED IN BLACK", 895, 895, "\"• Medium fleece\n"
                + "• This item is unisex\n"
                + "• Oversize fit\n"
                + "• Hood without drawstring\n"
                + "• Dropped shoulder\n"
                + "• 1 kangaroo pocket on front\n"
                + "• Gathered at cuffs and waistline\n"
                + "• Mirror Balenciaga artwork printed at front\n"
                + "• Made in Portugal\n"
                + "• Cold machine wash\"", "Hoodie", "Balenciaga, Hoodie, Black, Oversized, Printed", "Balenciaga");
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        products expResult = p;
        products result = prodDao.findUserByProductId(pId);
        assertEquals(expResult, result);

    }

    /**
     * Test of DeleteProduct method, of class ProductsDao.
     */
    @Test
    public void testDeleteProduct() {
        System.out.println("DeleteProduct");
        products p = new products("Test", "Test", 2.0, 2.0, "Test", "Test", "Test", "Test");
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = prodDao.DeleteProduct(p);
        //assertEquals(expResult, result);

    }

    /**
     * Test of EditProduct method, of class ProductsDao.
     */
    @Test
    public void testEditProduct() {
        System.out.println("EditProduct");
        stock s = new stock("Test2", 1, 1, 1, 1, 1);
        products p = new products("Test2", "Test2", 2.0, 2.0, "Test2", "Test2", "Test2", "Test2");
        products Edit = new products("Test2", "ChangeTest", 2.0, 2.0, "ChangeTest", "ChangeTest", "ChangeTest", "ChangeTest");
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        prodDao.AddProduct(p, s);
        boolean expResult = true;
        boolean result = prodDao.EditProduct(Edit);
        prodDao.DeleteProduct(Edit);
        assertEquals(expResult, result);

    }

    /**
     * Test of searchByFilters method, of class ProductsDao.
     */
    @Test
    public void testSearchByFilters() {
        System.out.println("searchByFilters");
        String Style = "T-Shirt";
        String NeckLine = "U-Neck";
        String Material = "Cotton";
        String Fit = "Oversized";
        String Length = "Normal";
        String Occasion = "Streetwear";
        String Printed = "Printed";
        String Color = "Black";
        ProductsDao prodDao = new ProductsDao("clothes_shop_test");
        List<products> expResult = null;
        List<products> result = prodDao.searchByFilters(Style, NeckLine, Material, Fit, Length, Occasion, Printed, Color);
        assertNotNull(result);
        assertTrue(result.size() > 0);
    }

}
