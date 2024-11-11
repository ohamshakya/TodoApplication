<%-- 
    Document   : index
    Created on : Nov 7, 2024, 2:56:07 PM
    Author     : ohams
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.todo.models.TodoList"%>
<%@page import="java.util.List"%>
<%@page import="com.todo.connection.DbCon"%>
<%@page import="com.todo.dao.TodoDao"%>
<%@page import="com.todo.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
      
        <nav class="fixed top-0 border-solid border-gray-200 w-full border-b py-3 bg-white z-50 bg-inherit">
            <div class="container mx-auto">
                <div class="w-full flex  lg:flex-row">
                    <div class="lg:flex lg:justify-between w-full lg:flex-row">
                        <p>Todo Application</p>
                        <div class="flex items-center">
                            <a href="Logout">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <%
            HttpSession sessionuser = request.getSession(false);
            User user = (User) sessionuser.getAttribute("user");
            if (user != null) {
                String firstName = user.getUsername();
        %>

        <h1 class="mt-24 text-xl font-semibold">Welcome! <%= firstName %></h1>
        <%} else {%>
        <%
                response.sendRedirect("login.jsp");
                return;
            }

        %>
        <a href="todoform.jsp" >
            <button type="button" class="mt-4 w-40 p-1 outline outline-offset-2 outline-1 border-green">Add Todo</button>
        </a>
        <%         
            HttpSession id_session = request.getSession(false);
            User useridRetrieve = (User) id_session.getAttribute("user");
            
            Integer userId = useridRetrieve.getId();

            List<TodoList> todoList = new ArrayList<>();

            if (userId != null) {
               
                TodoDao dao = new TodoDao(DbCon.getConnection());
                todoList = dao.getTodosByUserId(userId); 
                
            } 
        %>

        <% if (!todoList.isEmpty()) { %>
        <div class="p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-xl font-semibold">Your To-Do List</h2>
            <table class="min-w-full mt-4 table-auto border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-blue-500 text-black">
                        <th class="py-3 px-4 text-left border border">Task Title</th>
                        <th class="py-3 px-4 text-left border border">Description</th>
                        <th class="py-3 px-4 text-left border border">Progress</th>
                        <th class="py-3 px-4 text-left border border">Target Date</th>
                        <th class="py-3 px-4 text-left border border">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (TodoList td : todoList) {
                    %>
                    <tr class="border-t border-gray-200 hover:bg-gray-50">
                        <td class="py-3 px-4 border border"><%= td.getTitle()%></td>
                        <td class="py-3 px-4 border border-gray-300"><%= td.getDescription()%></td>
                        <td class="py-3 px-4 border border"><%= td.getIsDone()%></td>
                        <td class="py-3 px-4 border border"><%= td.getTargetDate()%></td>
                        <td class="py-3 px-4 border border">
                            <a class="bg-yellow-300 outline outline-offset-2 outline-1 outline-yellow-600 text-black" href="editTodo.jsp?id=<%= td.getId() %>&userId=<%= userId %>" >Edit</a> | 
                            <a class="bg-red-900 outline outline-offset-2 outline-1 outline-red-900 text-black"  href="deleteTodo.jsp?id=<%= td.getId() %>&userId=<%= userId %>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <% } else { %>
        <p>No tasks found for this user.</p>
        <% }%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>





