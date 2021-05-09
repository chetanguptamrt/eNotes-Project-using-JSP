/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

/**
 *
 * @author chetan
 */
public class UserDetail {
    private int id;
    private String name;
    private String email;
    private String password;

    public UserDetail(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }
    
    public UserDetail(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }
    
    public UserDetail(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    
}
