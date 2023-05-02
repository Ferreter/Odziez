/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import DTO.address;
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
public class AddressDaoTest {
    
    public AddressDaoTest() {
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
     * Test of searchbyUserId method, of class AddressDao.
     */
    @Test
    public void testSearchbyUserId() {
        System.out.println("searchbyUserId");
        int UserId = 7;
        AddressDao AddDao = new AddressDao("clothes_shop_test");
        int expResult = 1;
        int result = AddDao.searchbyUserId(UserId);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of AddressByUserId method, of class AddressDao.
     */
//    @Test
//    public void testAddressByUserId() {
//        System.out.println("AddressByUserId");
//        int UserId = 7;
//        AddressDao AddDao = new AddressDao("clothes_shop_test");
//        
//        address result = AddDao.AddressByUserId(UserId);
//        assertEquals("IE-CO", result.getCity());
//        assertEquals("128747384787", result.getPincode());
//    }

    /**
     * Test of addNewAddress method, of class AddressDao.
     */
    @Test
    public void testAddNewAddress() {
        System.out.println("addNewAddress");
        address  p = new address(0,2,"18 Home","2 Home","3 Home","City","County","Country","23123123");
            
        AddressDao AddDao = new AddressDao("clothes_shop_test");
        boolean expResult = true;
        boolean result = AddDao.addNewAddress(p);
        assertEquals(expResult, result);
        
    }

  
    
}
