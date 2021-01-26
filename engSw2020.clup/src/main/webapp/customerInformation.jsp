<% int idUser = (Integer) session.getAttribute("id"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
<title>Customer Line Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/modifyBooking.css">
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
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 10000);
	})
</script>
</head>
<jsp:include page="navbarCustomer.jsp"/>
<body>
<%
session.setAttribute("StatusInfo", 1);
%>
<c:if test="${errorMsg!=null}">
 <div style="color:red;" id="failed" class="alert alert-success">
    <strong>Modifica non avvenuta, utente non trovato!</strong> <%= request.getAttribute("errorMsg") %>
  </div>
</c:if>
<c:if test="${successMsg!=null}">
 <div style="color:green;" id="success" class="alert alert-success">
    <strong>Modifica avvenuta correttamente!</strong> <%= request.getAttribute("successMsg") %>
  </div>
</c:if>
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
 <div style="text-align:center" class="btn-block"> 
  <button id="modify" type="submit">Aggiorna</button>
  <i id="edit" class="fa fa-pencil" style="color:seagreen; font-size:24px; cursor:pointer"></i>
</div>
</form>


<jsp:include page="footerCustomer.jsp"/>
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