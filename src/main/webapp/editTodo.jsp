<%-- 
    Document   : editTodo
    Created on : Nov 12, 2024, 5:16:54 PM
    Author     : ohams
--%>
<%@page import="com.todo.models.TodoList"%>
<%@page import="com.todo.connection.DbCon"%>
<%@page import="com.todo.dao.TodoDao"%>
<%
    String status = (String) request.getAttribute("success");
    if (status != null) {
%>
        <div class="alert">
            <%= status %>
        </div>
<%
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
         <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body class="font-mono">
        <%
    String id = (String)request.getParameter("id");
    int retrieveId = Integer.parseInt(id);
    
  TodoDao dao = new TodoDao(DbCon.getConnection());
  TodoList list = dao.getVlaues(retrieveId);
 

  
%>
<h1><%=retrieveId%></h1>




  <form class="max-w-sm mx-auto" action="update.jsp" method="post">
  <div class="mb-5">
    <label for="title" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
    <input type="text" name="title" id="title" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="title of the todo" value="<%= list.getTitle() %>" />
  </div>
  <div class="mb-5">
    <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
    <input type="text" name="description" id="description" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Description" value="<%= list.getDescription() %>" required />
  </div>
  <div class="mb-5">
    <label for="progress" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Progress</label>
    <select name="isDone" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
        <option value="<%= list.getIsDone() %>">Select an option</option>
        <option value="success">success</option>
        <option value="inprogress">in progress</option>
    </select>
  </div>
      <div class="mb-5">
    <label for="target_date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Target date</label>
    <input type="date" name="target_date" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="target_date" value="<%= list.getTargetDate() %>" required />
  </div>
  
  <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update Todo</button>
</form>
    </body>
</html>
