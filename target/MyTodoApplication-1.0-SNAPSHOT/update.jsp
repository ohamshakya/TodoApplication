<%-- 
    Document   : update
    Created on : Nov 13, 2024, 7:38:45 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String progress = request.getParameter("isDone");
        String target_date = request.getParameter("target_date");
        
       String id = (String)request.getParameter("id");
//         int retrieveId = Integer.parseInt(id);
        
        
        %>
        <h1><%=id%></h1>
    </body>
</html>
