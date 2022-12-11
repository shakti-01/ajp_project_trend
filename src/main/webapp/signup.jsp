<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- <html>
<head>
<meta charset="ISO-8859-1">
<title>signup</title>
</head>
<body>
<form action="signupservlet" method="post">  
Name:<input type="text" name="username"/><br/><br/>  
Password:<input type="password" name="userpass"/><br/><br/>  
<input type="submit" value="signup"/>  
</form>
</body>
</html>-->



<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Signup - TREND</title>
      <link rel="stylesheet" href="./static_files/style-signup.css">
   </head>
   <body>
      <div class="wrapper">
         <div class="title">
            Signup Form
         </div>
         <form action="signupservlet" method="POST">
            <div class="field">
               <input type="text" name="username" required>
               <label>Username</label>
            </div>
            <div class="field">
               <input type="password" name="userpass" required>
               <label>Password</label>
            </div>
            
            <div class="field">
               <input type="submit" value="Signup">
            </div>
         </form>
            <div class="signup-link">
               Already member? <a href="login.jsp">Login now</a>
            </div>
      </div>
   </body>
</html>