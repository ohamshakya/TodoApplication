/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.todo.controller;

import com.todo.connection.DbCon;
import com.todo.dao.TodoDao;
import com.todo.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.todo.models.TodoList;

/**
 *
 * @author ohams
 */
public class TodoRegister extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String title = request.getParameter("title");
        String description = request.getParameter("description");
        String progress = request.getParameter("isDone");
        String target_date = request.getParameter("target_date");
        
        HttpSession userSession = request.getSession(false);
        if (userSession == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        User user = (User) userSession.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        
        RequestDispatcher dispatcher = null;
        TodoList list = new TodoList();
        list.setTitle(title);
        list.setDescription(description);
        list.setIsDone(progress);
        list.setTargetDate(target_date);
        list.setUserId(userId);
        
       
        
        try{
            TodoDao dao = new TodoDao(DbCon.getConnection());
            boolean isCheck = dao.todoInsert(list);
            dispatcher = request.getRequestDispatcher("todoform.jsp");
            if(isCheck){
                request.setAttribute("status", "todo added successfully");
            }else{
                request.setAttribute("status","failed");
            }
             dispatcher.forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
