/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class DBConnect {
    private static Connection conn;
    public static Connection getConn(){
        
        if(conn == null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","Champ123@");
            }
            catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
            }   
        } 
        
        return conn;
    }
}

