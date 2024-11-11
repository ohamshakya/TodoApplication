<%-- 
    Document   : login
    Created on : Nov 7, 2024, 1:07:34 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String error = (String) session.getAttribute("error");
if (error != null) {
%>
    <div class="error mb-10 flex justify-center items-center"><%= error %></div>
<%
    session.removeAttribute("error"); 
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .error{
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                background-color: red;
                width: 250px;
                height: 45px;
                color: black;
            }
            
        </style>
    </head>
    <body class="bg:white flex flex-col justify-center items-center h-screen font-mono>
        <div class="wrapper-main">
    <div class="wrapper flex gap-10">
      <div class="right-content shadow-2xl w-[22rem] h-[16rem] rounded-sm bg:white flex flex-col justify-center items-center ml-32">
        <h2>Login</h2>
        <div class="form-wrapper">
            <form action="UserLogin" method="POST">
            <div class="username mt-4">
              <input type="text" name="username" placeholder="Username" class="w-[20.5rem] p-2 border rounded-md">
            </div>
            
            <div class="password mt-4">
              <input type="password" name="password" placeholder="Password" class="w-[20.5rem] p-2 border rounded-md">
            </div>
            <div class="button mt-4">
              <button type="submit" class="w-56 p-2 border rounded-md bg-[#090963] text-white">Signup</button>
            </div>

            <div class="new-here mt-2">
              <p class="text-loginBtnColor">New here?
                <a class="text-sm hover:underline" href="#">Login</a>
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>
  </div>
        
    </body>
</html>
