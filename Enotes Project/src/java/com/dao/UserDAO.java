/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.user.UserDetail;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author chetan
 */
public class UserDAO {
    
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }
    public String addUser(UserDetail us){
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from user where email = '"+us.getEmail()+"'");
            if (rs.next()){
                return "alreadyEmail";
            }
            else{
                String query = "insert into user(name,email,password) values(?,?,?)";
                PreparedStatement pt = this.conn.prepareStatement(query);
                pt.setString(1, us.getName());
                pt.setString(2, us.getEmail());
                pt.setString(3, us.getPassword());
                int i = pt.executeUpdate();
                if(i==1){
                    return "done";
                }
            }
        }
        catch(SQLException e){
        }
        return "no";
    }
    public String loginUser(UserDetail us){
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from user where email = '"+us.getEmail()+"' and password = '"+us.getPassword()+"'");
            if (rs.next()){
                return "done";
            }
            else{
                return "invalid";
            }
        }
        catch(SQLException e){
        }
        return "no";
    }
    
    public UserDetail getLoginUser(UserDetail us){
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from user where email = '"+us.getEmail()+"' and password = '"+us.getPassword()+"'");
            if (rs.next()){
                return new UserDetail(rs.getInt("id"),rs.getString("name"),rs.getString("email"));
            }
        }
        catch(SQLException e){
        }
        return null;
    }
}
