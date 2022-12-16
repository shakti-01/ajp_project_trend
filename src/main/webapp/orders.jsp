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

ProductDao pd = new ProductDao();
List<Product> prods = pd.getOrderProds(user);


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders - <%= request.getSession().getAttribute("user") %></title>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./static_files/style-home.css">
</head>
<body>
</head>
<body>
    <header>
        <!-- -------------------------NAVBAR start----------------------------------------- -->
        
        <nav class="navbar navbar-expand-lg navbar-dark ">
            <a href="#" ><img src="./static_files/trendlogonew.png" style="width:4em"></a>
            <!-- <a class="navbar-brand" href="#">TREND</a> -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Orders </a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Related
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">About Us</a>
                    <a class="dropdown-item" href="#">Contact Us</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Offer</a>
                </li>
                
              </ul>
              <form class="form-inline my-2 my-lg-0" action="logoutservlet" method="POST">
                <p class="user-welcome">Hello!, <%= request.getSession().getAttribute("user") %></p>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
              </form>
            </div>
          </nav>
        <!-- -------------------------NAVBAR END  ------------------------------------------- -->
            </header>
            

             <div class="banner">
                <div class="wrapper">
                
                <%
					if (!prods.isEmpty()) {
						for (Product p : prods) {
				%>
                    <div class="box">
                      <p><h2><%=p.getName() %></h2><h4>Item for sale..</h4></p>
                      <div class="content">
                        <div class="info">
                          <div class="name">Rs <%=p.getPrice() %></div>
                          <div class="job"><%=p.getSeller() %></div>
                          <div class="stars">
                            <i class="fas fa-star"><b class="rating"><%=p.getRating() %>/5</b></i>
                          </div>
                          <br>
                          <a href="removeproductservlet?pname=<%=p.getName() %>"><button class="btn btn-danger">remove it</button></a>
                        </div>
                      </div>
                    </div>
        		<%
						}
					} 
					else out.println("There are no proucts...");
					
				%>
                    
        
                  </div>   
                <!-- <img src="comp.png" class="image"> -->
            </div>


<!-- ------------------------------FOOTER-------------------------------------------------- -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<!-- ------------------------------FOOTER-------------------------------------------------- -->    
</body>
</html>