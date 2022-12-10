<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="dao.*" %>
    
<%
String user = (String)request.getSession().getAttribute("user");
if (user != null) {
    request.setAttribute("user", user);
}
else{
	response.sendRedirect("login.jsp");
}
%>

<%
ProductDao pd = new ProductDao();
List<Product> prods = pd.getAllProds();
%>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="ISO-8859-1">
<title>Trend home</title>
</head>
<body>
hi this home
<%= request.getSession().getAttribute("user") %>
<form action="logoutservlet" method="post">
<input type="SUBMIT" value="LogOut">
</form>
<%
	if (!prods.isEmpty()) {
		for (Product p : prods) {
%>
		<div>
			<p><%=p.getName() %></p>
			<p><%=p.getPrice() %></p>
			<p><%=p.getSeller() %></p>
			<p><%=p.getRating() %></p>
		</div>
<%
		}
	} 
	else out.println("There are no proucts...");
	
%>
</body>
</html>--%>




<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TREND HOME</title>
    <link rel="stylesheet" href="static_files/style-home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>
    <header>
        <a href="#" ><img src="static_files/trendlogonew.png" class="logo"></a>
        <ul class="navigation">
            <li><a href="">Home</a></li>
            <li><a href="">Products</a></li>
            <li><a href="">Offers</a></li>
            <li><a href="">About Us</a></li>
            
            <li><a>Hello, 
            <%= request.getSession().getAttribute("user") %></a>
            </li>
			<l1><a><form class="logout-f"  action="logoutservlet" method="post">
			<input class="btn" type="SUBMIT" value="Log Out">
			</form></a></l1>
        </ul>
        
        <div class="search">
            <input type="text" placeholder="Search">
            <i class="fa fa-search" aria-hidden="true"></i>
            <button class="btn-1"><a href="">Search</a></button>
            
             <!--<button class="btn"><a href="">Log Out</a></button>-->
        </div>
    </header>
    <div class="banner">
        <div class="wrapper">
        
	        <%
			if (!prods.isEmpty()) {
				for (Product p : prods) {
			%>
            <div class="box">
              <p><h2><%=p.getName() %></h2><h4>Item for sale</h4></p>
              <div class="content">
                <div class="info">
                  <div class="name">Rs <%=p.getPrice() %> </div>
                  <div class="job"><%=p.getSeller() %></div>
                  <div class="stars">
                    <i class="fas fa-star"><b class="rating"><%=p.getRating() %>/5</b></i>
                  </div>
                </div>
              </div>
            </div>
			<%
				}
			} 
			else out.println("There are no proucts...");
	
%>
            

          </div>   
    </div>
</body>
</html>