<% int idUser = (Integer) session.getAttribute("idUser"); %>
<% System.out.println(request.getAttribute("user")); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
<title>Customer Line Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/userInformation.css">
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function validateData() {
	console.log("sono qui");
	$("input").each(function()
		{
			if($(this).text()==null)
				{
					$(this).focus();
					return false;
				}
		})
}
</script>
<script>
	$(document).ready(function(){
		$("#edit").click(function(){
			console.log("click");
				$("#edit").toggleClass("enable");
				if($("#edit").attr('class')=="fa fa-pencil enable")
				{
					console.log("enable");
					$(":input").prop("disabled",false);
				}
				else
				{
					console.log("disabled");
					$(":input").prop("disabled",true);
				}
					
			
		});
	})
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
        	<a href="#">Gestione negozio</a>
        	<a href="#">Gestione categorie</a>       	   	
          </div>
        </li>
        <li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Gestione Account</a>
          <div class="dropdown-content">
        	<a href="http://localhost:8080/clup/UserServlet?iduser=<%= idUser %>">Informazioni Utente</a>
        	<a href="http://localhost:8080/clup/LogoutServlet">Logout</a>       	
          </div>
        </li>
        <li><a href="#">Benvenuto <%= session.getAttribute("name") + "" %></a></li>

      </ul>
      <div class="burger">
        <div class="line1"></div>
        <div class="line2"></div>
        <div class="line3"></div>
      </div>
    </nav>
  </header>
<body>

<form class="w3-container w3-card-4 w3-light-grey" action="UserServlet" method="POST" onsubmit="return validateData();">
 <div style="text-align:center;"> 
  <h2 style="font-weight: bold; text-align: center">Informazioni utente</h2>
  <p style="font-weight: bold; text-align: center">Per modificare i dati premere l'icona per la modifica in fondo alla pagina.</p>
  </div>
  <input type="hidden" name="idUser" value="<%= idUser %>">
<div>
  <label>Nome</label>
  <input id="editable" class="w3-input w3-border" name="name" type="text" value="${user.getName()}" disabled>
</div>
<div>
  <p><label>Cognome</label>
  <input  id="editable" class="w3-input w3-border" name="surname" type="text" value="${user.getSurname()}" disabled></p>
</div>
<div>
  <p><label>Data di nascita</label>
  <input  id="editable" class="w3-input w3-border" name="birthdayDate" type="date" value="${user.getBirthdayDate()}" disabled></p>
</div>
<div>
  <p><label>Numero di telefono</label>
  <input  id="editable" class="w3-input w3-border" name="telephoneNumber" type="text" value="${user.getTelephoneNumber()}" disabled></p>
</div>
<div>
  <p><label>E-mail</label>
  <input  id="editable" class="w3-input w3-border" name="email" type="text" value="${user.getEmail()}" disabled></p>
</div>
<div>
  <p><label>Username</label>
  <input  id="editable" class="w3-input w3-border" name="username" type="text" value="${user.getUserName()}" disabled></p>
 </div>
 <div style="text-align:center"> 
  <input id="modify" type="submit" class="btn btn-block" value="Invia modifiche">
  <i id="edit" class="fa fa-pencil" style="color:seagreen; font-size:24px; cursor:pointer"></i>
</div>
</form>


 <footer class="footer">
  <div class="l-footer">
  <h1>
  <img src="https://i.postimg.cc/y62wcLBq/logo.png" alt=""></h1>
  <p>Customer Line Up</p>
  </div>
  <ul class="r-footer">

  <li class="features">
    <h2>
  Account</h2>
  <ul class="box h-box">
  <li><a href="#">Home</a></li>
  <li><a href="#">Prenota un ticket</a></li>
  <li><a href="#">Gestione prenotazioni</a></li>
  <li><a href="#">Gestione account</a></li>

  </ul>
  </li>
  <li>
    <h2>
  Legal</h2>
  <ul class="box">
  <li><a href="#">Privacy Policy</a></li>
  <li><a href="#">Terms of Use</a></li>
  </ul>
  </li>
  </ul>
  <div class="b-footer">
  <p>
  All rights reserved by ©CustomerLineUp 2021 </p>
  </div>
  </footer>
</body>
</html> 
