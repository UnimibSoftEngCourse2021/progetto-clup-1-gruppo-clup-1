<% int idUser = (Integer) session.getAttribute("id"); %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(document).ready(function(){
		$("#nuovaPassword").hide();
		$("#confermaPassowrd").hide();


		$("#edit").click(function(){
			console.log("click");
				$("#edit").toggleClass("enable");
				if($("#edit").attr('class')=="fa fa-pencil enable")
				{
					console.log("enable");
					$(":input").prop("disabled",false);
					$("#modify").prop("disabled",false);
					$("#nuovaPassword").show();
					$("#confermaPassowrd").show();

				}
				else
				{
					console.log("disabled");
					$(":input").prop("disabled",true);
					$("#modify").prop("disabled",true);
					$("#nuovaPassword").hide();
					$("#confermaPassowrd").hide();
					$("[name='confirmNewPassoword']").val('');
					$("[name='newPassword']").val('');
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
			<li><a href="#">Home</a></li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Prenotazioni</a>
				<div class="dropdown-content">
					<a href="#">Visualizza Prenotazioni</a> 
					<a href="#">Aggiungi Prenotazione</a>
				</div>
			</li>
			<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Gestione Account</a>
          		<div class="dropdown-content">
        			<a href="http://localhost:8080/clup/customerInformation.jsp">Informazioni Utente</a>
        			<a href="#">Logout</a>       	
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
<%
session.setAttribute("StatusInfo", 1);
%>

<form class="w3-container w3-card-4 w3-light-grey" action="UserServlet" method="POST" onsubmit="return validate();">
 <div style="text-align:center;"> 
 
 <h3 style="font-weight: bold; text-align: center">Informazioni utente</h3>
		<p style="font-weight: bold; text-align: center">Per modificare i dati premere l'icona per la modifica in fondo alla pagina.</p>
  </div>
  <input type="hidden" name="idUser" >
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
 <div>
  <p><label>Password</label>
  <input  id="editable" class="w3-input w3-border" name="password" type="password" value="${user.getPassword()}" disabled></p>
 </div>
 <div id="nuovaPassword">
  <p><label>Nuova Password</label>
  <input  id="newPwd" class="w3-input w3-border" name="newPassword" type="password"  disabled></p>
 </div>
 <div id="confermaPassowrd">
  <p><label>Conferma Password</label>
  <input  id="confirmNewPwd" class="w3-input w3-border" name="confirmNewPassoword" type="password" disabled></p>
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


<script>
	function validate() {
		var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;

		var newPwd = document.getElementById("newPwd");
		var confirmNewPwd = document.getElementById("confirmNewPwd");
		if (!password_valid.test(newPwd.value) || newPwd.value == '') {
			alert("Inserire una password corretta.");
			newPwd.focus();
			newPwd.style.background = '#f08080';
			return false;
		}
		if(newPwd.value != confirmNewPwd.value){
			alert("Le password non corrispondono.");
			newPwd.focus();
			confirmNewPwd.style.background = '#f08080';
			newPwd.style.background = '#f08080';
			return false;
		}
	}
</script>