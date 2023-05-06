/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import DTO.products;
import DTO.stock;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface StockDaoInterface {
    public List<stock> ListAllStockForProductId(products p);
}
