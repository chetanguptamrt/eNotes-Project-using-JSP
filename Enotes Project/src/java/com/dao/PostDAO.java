/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.user.PostDetail;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class PostDAO {
    private final Connection conn;

    public PostDAO(Connection conn) {
        this.conn = conn;
    }
    
    public String addPost(String title,String content,int uid){
        try{
            String query = "insert into post (title,content,uid) values (?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, title);
            pt.setString(2, content);
            pt.setInt(3, uid);
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    public List<PostDetail> getAllPost(int uid){
        List<PostDetail> list = new ArrayList<PostDetail>();
        PostDetail post = null;
        try{
            String query = "select * from post where uid = ? order by id desc";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, uid);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                post = new PostDetail(rs.getInt("id"),rs.getString("title"),rs.getString("content"),rs.getTimestamp("date"),rs.getInt("uid"));
                list.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public PostDetail editNotes(int id,int uid){
        PostDetail post = null;
        try{
            String query = "select * from post where id=? and uid = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, uid);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                post = new PostDetail(rs.getInt("id"),rs.getString("title"),rs.getString("content"),rs.getTimestamp("date"),rs.getInt("uid"));
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return post;
    }
    
    public String notesUpdate(int id, String title, String content, int uid){
        try{
            String query = "update post set title = ?, content = ? where id = ? and uid = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, title);
            pt.setString(2, content);
            pt.setInt(3,id);
            pt.setInt(4, uid);
            int f = pt.executeUpdate();
            if(f==1){
                return "done";
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return "no";
    }

    public boolean notesDelete(int id,int uid){
        try{
            String query = "delete from post where id = ? and uid = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1,id);
            pt.setInt(2, uid);
            int f = pt.executeUpdate();
            if(f==1){
                return true;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
}