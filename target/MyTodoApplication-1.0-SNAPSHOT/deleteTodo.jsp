<%-- 
    Document   : deleteTodo
    Created on : Nov 11, 2024, 11:12:06 PM
    Author     : ohams
--%>
<%@page import="com.todo.connection.DbCon"%>
<%@page import="com.todo.dao.TodoDao"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="font-mono">
        <%
            String id = (String) request.getParameter("id");
            int retrieveId = Integer.parseInt(id);

            TodoDao dao = new TodoDao(DbCon.getConnection());

            boolean isCheck = dao.DeleteTodo(retrieveId);
            if (isCheck) {
                out.println("Deleted successfully");
            } else {
                out.println("Something went wrong");
            }

        %>

    </body>
</html>
