/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.todo.dao;

import com.todo.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ohams
 */
public class UserDao {
      private Connection conn;
    private PreparedStatement pstmt;
    
   
    public UserDao(Connection conn){
        this.conn = conn;
    }
    
    
    public boolean userRegister(User user) throws SQLException {
        boolean isInserted = false;
         if (conn == null || conn.isClosed()) {
            throw new SQLException("Connection is closed or null");
        }

        try {
            
            String sql = "INSERT INTO users(firstname,lastname,username,password) VALUES (?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            
         
            pstmt.setString(1, user.getFirstname());
            pstmt.setString(2, user.getLastname());
            pstmt.setString(3, user.getUsername());
            pstmt.setString(4, user.getPassword());

            int i = pstmt.executeUpdate();

            if (i == 1) {
                isInserted = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } 
        return isInserted;

    }
    
}
