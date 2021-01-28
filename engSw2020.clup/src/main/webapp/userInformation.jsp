<% int idUser = (Integer) session.getAttribute("idUser"); %>
<% String user = session.getAttribute("name") + ""; %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="it">
<head>
<title>Customer Line Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="css/modifyBooking.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function validateData() {
	
	$("input").each(function()
		{
			if($(this).text()==null)
				{
					$(this).focus();
					return false;
				}
		});
		var name = $("#name").val().trim();
	    $("#name").val(name);
		var surname = $("#surname").val().trim();
	    $("#surname").val(surname);
		var date = $("#date").val().trim();
	    $("#date").val(date);
		var telephone = $("#telephoneNumber").val().trim();
	    $("#telephoneNumber").val(telephone);
		var email = $("#email").val().trim();
	    $("#email").val(email);
		var userName = $("#username").val().trim();
	    $("#username").val(userName);
		
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
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 10000);
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 10000);
	})
</script>
</head>
<jsp:include page="navbarManager.jsp">
<jsp:param value="<%= idUser %>" name="idUser"/>
<jsp:param value="<%= user %>" name="user"/>
</jsp:include>
<body>
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
<div class="page-wrap">>
<form id="editForm" class="w3-container w3-card-4 w3-light-grey" action="UserServlet" method="POST" onsubmit="return validateData();">

  <h3 style="font-weight:bold; text-align:center;">Informazioni utente</h3>
  <p style="font-weight:bold; text-align:center;">Per modificare i dati premere l'icona per la modifica in fondo alla pagina.</p>

  <input type="hidden" name="idUser" value="<%= idUser %>">
<div>
  <label>Nome</label>
  <input id="name" class="w3-input w3-border" name="name" type="text" value="${user.getName()}" disabled>
</div>
<div>
  <p><label>Cognome</label>
  <input  id="surname" class="w3-input w3-border" name="surname" type="text" value="${user.getSurname()}" disabled></p>
</div>
<div>
  <p><label>Data di nascita</label>
  <input  id="date" class="w3-input w3-border" name="birthdayDate" type="date" value="${user.getBirthdayDate()}" disabled></p>
</div>
<div>
  <p><label>Numero di telefono</label>
  <input  id="telephoneNumber" class="w3-input w3-border" name="telephoneNumber" type="text" value="${user.getTelephoneNumber()}" disabled></p>
</div>
<div>
  <p><label>E-mail</label>
  <input  id="email" class="w3-input w3-border" name="email" type="text" value="${user.getEmail()}" disabled></p>
</div>
<div>
  <p><label>Username</label>
  <input  id="username" class="w3-input w3-border" name="username" type="text" value="${user.getUserName()}" disabled></p>
 </div>
 <div style="text-align:center" class="btn-block"> 
  <button id="modify" type="submit">Aggiorna</button>
  <i id="edit" class="fa fa-pencil" style="color:seagreen; font-size:24px; cursor:pointer"></i>
</div>
</form>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html> 