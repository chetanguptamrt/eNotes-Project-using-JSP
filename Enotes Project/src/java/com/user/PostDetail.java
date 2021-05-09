/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

import java.util.Date;

/**
 *
 * @author chetan
 */
public class PostDetail {
    private int id;
    private String title;
    private String content;
    private Date date;
    private int uid;

    public PostDetail(int id, String title, String content, Date date, int uid) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.date = date;
        this.uid = uid;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getDate() {
        return date;
    }

    public int getUID() {
        return uid;
    }
    
}
