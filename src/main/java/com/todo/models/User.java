/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.todo.models;

/**
 *
 * @author ohams
 */
public class User {
     private int id;
   private String firstname;
   private String lastname;
   private String username;
   private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
   
   

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    
    public String getFirstname(){
        return firstname;
    }
    
    public void setLastname(String lastname){
        this.lastname = lastname;
    }
    public String getLastname(){
        return lastname;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getUsername(){
        return username;
    }
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getPassword(){
        return password;
    }

    
}
