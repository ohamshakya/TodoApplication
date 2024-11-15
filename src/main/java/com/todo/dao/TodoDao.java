/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.todo.dao;

import java.sql.PreparedStatement;
import com.todo.models.TodoList;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.todo.connection.DbCon;
import com.todo.models.User;
import java.sql.ResultSet;

/**
 *
 * @author ohams
 */
public class TodoDao {

    private Connection con;

    public TodoDao(Connection con) {
        this.con = con;
    }

    public boolean todoInsert(TodoList list) {
        boolean isInserted = false;
        try {

            String sql = "INSERT INTO todo_list(title,description,progress,target_date,user_id) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareCall(sql);
            pstmt.setString(1, list.getTitle());
            pstmt.setString(2, list.getDescription());
            pstmt.setString(3, list.getIsDone());
            pstmt.setString(4, list.getTargetDate());
            pstmt.setInt(5, list.getUserId());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                isInserted = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInserted;
    }
    
   

    public List<TodoList> getAllTodo() throws ClassNotFoundException, SQLException {
        List<TodoList> list = new ArrayList<TodoList>();

        String sql = "Select * from todo_list";
        try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                TodoList row = new TodoList();
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setIsDone(rs.getString("progress"));
                row.setTargetDate(rs.getString("target_date"));

                list.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<TodoList> getTodosByUserId(int userId) {
        List<TodoList> todoList = new ArrayList<>();
        String sql = "SELECT * FROM todo_list where user_id = ?";
        try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            // Iterate over all the rows returned
            while (rs.next()) {
                TodoList row = new TodoList();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setIsDone(rs.getString("progress"));
                row.setTargetDate(rs.getString("target_date"));

                // Add the row to the list
                todoList.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return todoList;
    }
    
    public boolean updateTodo(int id){
        boolean isUpdated = false;
        TodoList list = new TodoList();
        try{
            Connection con = DbCon.getConnection();
            String sql = "Update todo_list set title = ?,description = ?,progress = ?,target_date = ? where id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, list.getTitle());
            pstmt.setString(3,list.getDescription());
            pstmt.setString(4,list.getIsDone());
            pstmt.setString(5,list.getTargetDate());
            int i = pstmt.executeUpdate();
            if(i == 1){
                isUpdated = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    public boolean DeleteTodo(int id){
        try{
            Connection con = DbCon.getConnection();
            String sql = "DELETE FROM todo_list where id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            int rowsAffected = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public TodoList getVlaues(int id){
        TodoList list = new TodoList();
        
        try{
            Connection con = DbCon.getConnection();
            String sql = "SELECT * FROM todo_list where id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                list.setId(rs.getInt("id"));
                list.setTitle(rs.getString("title"));
                list.setDescription(rs.getString("description"));
                list.setIsDone(rs.getString("progress"));
                list.setTargetDate(rs.getString("target_date"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }

}
