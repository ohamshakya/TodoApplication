<%-- 
    Document   : register
    Created on : Nov 4, 2024, 12:55:08 AM
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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <!--bootstrap-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.tailwindcss.com"></script>

  <title>Login</title>
</head>

<body class="bg:white flex flex-col justify-center items-center h-screen font-mono">
    <div class=col-md-6 col-md-offset-3">
<div class=alert alert-success center" role ="alert">
<p>${NOTIFICATION}</p>
</div>
  <div class="wrapper-main">
    <div class="wrapper flex gap-10">
      <div class="left-content flexf flex-col gap-16 items-center">
<!--        <h1 class="text-blue-500 text-1xl font-semi-bold">SecondHand Motorcycle Market</h1>
        <img src="../assets/images/background.png" class="w-56" alt="">-->
      </div>
      <div class="right-content shadow-2xl w-[22rem] h-[25rem] rounded-sm bg:white flex flex-col justify-center items-center ml-32">
        <h2>Signup</h2>
        <div class="form-wrapper">
            <form action="UserRegister" method="post">
            <div class="first-last flex gap-2 mt-4">
              <div class="firstname">
                <input type="text" name="fname" placeholder="Firstname" class="w-40 p-2 border rounded-md">
              </div>
              <div class="lastname">
                <input type="text" name="lname" placeholder="Lastname" class="w-40 p-2 border rounded-md">
              </div>
            </div>
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
                  <a class="text-sm hover:underline" href="login.jsp">Login</a>
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
