/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import DTO.archived;
import java.util.List;

/**
 *
 * @author kian2
 */
public interface ArchivedDaoInterface {
     public List<archived> ListAllProducts();
     public boolean ReturnToProducts(String p);

}
