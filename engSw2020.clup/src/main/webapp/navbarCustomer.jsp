<% int idUser = ((Integer)session.getAttribute("id")); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/dropdown.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<header> 
	    <nav role="navigation">
		<div class="logo">
			<h4>customer line up</h4>
		</div>
		<ul class="nav-links">
			<li><a href="http://localhost:8080/clup/homepageCustomer.jsp">Home</a></li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Prenotazioni</a>
				<div class="dropdown-content">
					<a href="http://localhost:8080/clup/customerBooking.jsp">Visualizza storico prenotazioni</a> 
					
				</div>
			</li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Gestione Account</a>
          		<div class="dropdown-content">
        			<a href="http://localhost:8080/clup/UserServlet?iduser=<%= idUser %>">Informazioni Utente</a>
        			<a href="http://localhost:8080/clup/LogoutServlet">Logout</a>       	
          		</div>
        	</li>
        	<li><a href="#">Benvenuto </a></li>

		</ul>
      <div class="burger">
        <div class="line1"></div>
        <div class="line2"></div>
        <div class="line3"></div>
      </div>
    </nav>
</header>
<body>

</body>
</html>