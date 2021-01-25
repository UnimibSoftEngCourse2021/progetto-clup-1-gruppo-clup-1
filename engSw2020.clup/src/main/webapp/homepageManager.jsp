<%
	int i = ((Integer) session.getAttribute("id")).intValue();
	String user = session.getAttribute("name") + "";
	int idUser = (Integer) session.getAttribute("idUser"); 
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Customer Line Up</title>
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/footer.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500" rel="stylesheet" />
<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="css/homepageManager.css?ts=<?=time()?>&quot">

<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
	function callservlet() {

		var servletname = "BookingServlet";

		if (servletname == "") {
			alert("NO value..");
			return false;
		} else {
			document.location.href = "BookingServlet";
			return false;
		}
	}
</script>
    <script>
    	$(document).ready(function() {  
         var myVar = setInterval(getData,1000);
         var myVar2 = setInterval(getCountBooking,500);
	     function getData(){
    	  $.get("AsyncServlet", function(responseJson) {   
    		  $("#table-body").empty();
	        $.each(responseJson, function(index, item) { 
	        	var $tr = $("<tr>").appendTo($("#table-body")); 
	        	$("<td>").text(item.idBooking).appendTo($tr); 
	        	$("<td>").text(item.user.name).appendTo($tr); 
	        	$("<td>").text(item.user.surname).appendTo($tr); 
	        	$("<td>").text(item.user.email).appendTo($tr); 
	        	$("<td>").text(item.user.telephoneNumber).appendTo($tr); 
	        	$("<td>").text(item.bookingDate).appendTo($tr); 
	        	$("<td>").text(item.arrivalTime).appendTo($tr); 
	        	$("<td>").text(item.finishTime).appendTo($tr); 
	        });


			});
		}
		function getCountBooking() {
			$.get("CountBookingServlet", function(responseJson) {
				$("#booking-count").text(responseJson);
			});
		}
	});
</script>
</head>
<header> 
	<nav role="navigation">
		<div class="logo">
			<h4>customer line up</h4>
		</div>
		<ul class="nav-links">
			<li><a href="http://localhost:8080/clup/homepageManager.jsp">Home</a></li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Prenotazioni</a>
				<div class="dropdown-content">
					<a href="http://localhost:8080/clup/BookingServlet">Visualizza Prenotazioni</a> 
					<a href="http://localhost:8080/clup/addBooking.jsp">Aggiungi Prenotazione</a>
				</div>
			</li>
			<li class="dropdown"><a href="#" class="dropbtn">Store</a>
				<div class="dropdown-content">
					<a href="http://localhost:8080/clup/storeSetup">Gestione negozio</a>
					<a href="http://localhost:8080/clup/getCategoryServlet">Gestione categorie</a>
				</div>
			</li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Gestione Account</a>
          		<div class="dropdown-content">
        			<a href="http://localhost:8080/clup/UserServlet?iduser=<%= idUser %>">Informazioni Utente</a>
        			<a href="http://localhost:8080/clup/LogoutServlet">Logout</a>       	
          		</div>
        	</li>
        	<li><a href="#">Benvenuto <%= user %></a></li>

		</ul>
		<div class="burger">
			<div class="line1"></div>
			<div class="line2"></div>
			<div class="line3"></div>
		</div>
	</nav>
</header>

  <body>
  <div class="content-wrapper">
        <div class="content">						 
                  <!-- Top Statistics -->
                  <div class="row">
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini mb-4">
                        <div class="card-body">
                          <h2 id="booking-count" class="mb-1">0</h2>    
                          <p>Prenotazioni odierne</p>                  
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini  mb-4">
                        <div class="card-body">
                          <h2 class="mb-1">9,503</h2>
                          <p>New Visitors Today</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini mb-4">
                        <div class="card-body">
                          <h2 class="mb-1">71,503</h2>
                          <p>Monthly Total Order</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini mb-4">
                        <div class="card-body">
                          <h2 class="mb-1">9,503</h2>
                          <p>Total Revenue This Year</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>    
               </div>
	<div class="card mb-4">
 		<div class="card-header">
   			<i class="fas fa-table mr-1"></i>
    			Prenotazioni per le prossime ore
  		<div class="table-wrapper">
  			<table summary="TablePrenotazioni" class="fl-table">
  				<thead>
  		 			<tr>
            			<th id="Numero">Numero</th>
           				<th id="Nome">Nome</th>
            			<th id="Cognome">Cognome</th>
            			<th id="Email">Email</th>
            			<th id="NumeroTelefono">Telefono</th>
            			<th id="Prenotazione">Prenotazione</th>
            			<th id="OraArrivo">Ora di arrivo</th>
            			<th id="OraFine">Ora di fine</th>                               
        			</tr>
        		</thead>
        		<tbody id="table-body">
        		</tbody>
  			</table>  	
  		</div>
 		</div>
 	</div>
</body>
<footer class="footer">
	<div class="l-footer">
		<h1>
			<img src="https://i.postimg.cc/y62wcLBq/logo.png" alt="">
		</h1>
		<p>Customer Line Up</p>
	</div>
	<ul class="r-footer">
		<li class="features">
			<h2>Account</h2>
			<ul class="box h-box">
				<li><a href="#">Home</a></li>
				<li><a href="#">Prenota un ticket</a></li>
				<li><a href="#">Gestione prenotazioni</a></li>
				<li><a href="#">Gestione account</a></li>

			</ul>
		</li>
		<li>
			<h2>Legal</h2>
			<ul class="box">
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Terms of Use</a></li>
			</ul>
		</li>
	</ul>
	<div class="b-footer">
		<p>All rights reserved by ©CustomerLineUp 2021</p>
	</div>
</footer>
</html>