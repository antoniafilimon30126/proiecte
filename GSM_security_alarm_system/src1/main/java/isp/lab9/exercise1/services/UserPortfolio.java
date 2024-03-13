/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package isp.lab9.exercise1.services;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.swing.table.AbstractTableModel;
import java.math.BigDecimal;
import java.util.Map;

/**
 * Uses Lombok to get rid of boilerplate code.
 *
 * @author mihai.hulea
 * @author radu.miron
 */
@Data // it creates getters, setters, equals(), hashCode() and toString() (at compile time)
@AllArgsConstructor // it creates the constructor with arguments for all the attributes (at compile time)
public class UserPortfolio extends AbstractTableModel {
    private BigDecimal cash;

    private Map<String, Integer> shares; // a map of number of shares by stock symbol

    public void addStocks(String symbol, int quantity){
        System.out.println("Buy"+symbol+":"+quantity);
    if(shares.containsKey(symbol)){
       int newc= shares.get(symbol)+quantity;
       shares.put(symbol,newc);

    }
    else {
        shares.put(symbol,quantity);
    }

    }


    @Override
    public int getRowCount() {
        return 0;
    }

    @Override
    public int getColumnCount() {
        return 0;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        return null;
    }
}




