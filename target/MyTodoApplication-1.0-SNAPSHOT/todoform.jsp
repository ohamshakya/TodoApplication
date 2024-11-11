<%-- 
    Document   : todoform
    Created on : Nov 7, 2024, 4:10:38 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String status = (String) request.getAttribute("status");
    if (status != null) {
%>
        <div class="alert">
            <%= status %>
        </div>
<%
    }
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Todo form</title>
    <script src="https://cdn.tailwindcss.com"></script>
   
  </head>
  <body>
  <form class="max-w-sm mx-auto" action="TodoRegister" method="post">
  <div class="mb-5">
    <label for="title" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
    <input type="text" name="title" id="title" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="title of the todo" required />
  </div>
  <div class="mb-5">
    <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
    <input type="text" name="description" id="description" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Description" required />
  </div>
  <div class="mb-5">
    <label for="progress" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Progress</label>
    <select name="isDone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
        <option value="0">Select an option</option>
        <option value="success">success</option>
        <option value="inprogress">in progress</option>
    </select>
  </div>
      <div class="mb-5">
    <label for="target_date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Target date</label>
    <input type="date" name="target_date" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="target_date" required />
  </div>
  
  <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add todo</button>
</form>
  </body>
</html>
