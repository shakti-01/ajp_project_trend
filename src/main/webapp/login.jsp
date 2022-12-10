<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- <html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
<form action="loginservlet" method="post">  
Name:<input type="text" name="username"/><br/><br/>  
Password:<input type="password" name="userpass"/><br/><br/>  
<input type="submit" value="login"/> 
</form>
<a href="signup.jsp">signup</a>
</body>
</html>
-->



<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Login Form Design | CodeLab</title>
      <link rel="stylesheet" href="./static_files/style-login.css">
   </head>
   <body>
      <div class="wrapper">
         <div class="title">
            Login Form
         </div>
         <form action="loginservlet" method="POST">
            <div class="field">
               <input type="text" name="username" required>
               <label>Username</label>
            </div>
            <div class="field">
               <input type="password" name ="userpass" required>
               <label>Password</label>
            </div>
            <!--<div class="content">
               <div class="checkbox">
                  <input type="checkbox" id="remember-me">
                  <label for="remember-me">Remember me</label>
               </div>
               <div class="pass-link">
                  <a href="#">Forgot password?</a>
               </div>
            </div>-->
            <div class="field">
               <input type="submit" value="Login">
            </div>
         </form>
            <div class="signup-link">
               Not a member? <a href="signup.jsp">Signup now</a>
            </div>
      </div>
   </body>
</html>