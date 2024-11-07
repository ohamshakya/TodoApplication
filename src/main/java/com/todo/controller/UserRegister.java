/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.todo.controller;

import com.todo.connection.DbCon;
import com.todo.dao.UserDao;
import com.todo.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ohams
 */
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(firstname+lastname+username+password);
        
        RequestDispatcher dispatcher = null;
        
        try{
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
           
            User user = new User();
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setUsername(username);
            user.setPassword(hashedPassword);
            
            UserDao dao = new UserDao(DbCon.getConnection());
            boolean isCheck = dao.userRegister(user);
            dispatcher = request.getRequestDispatcher("register.jsp");
            if(isCheck){
                request.setAttribute("status", "register successfully");
            }else{
                request.setAttribute("status","failed");
            }
             dispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
}
