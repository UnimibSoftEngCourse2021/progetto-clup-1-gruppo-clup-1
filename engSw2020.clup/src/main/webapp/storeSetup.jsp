<% int idUser = (Integer) session.getAttribute("idUser");  
    String user = session.getAttribute("name") + "";
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="ISO-8859-1">
<title>Customer Line Up</title>
<!--  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="css/modifyBooking.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"></script> <!-- Compliant: integrity value should be replaced with the digest of the expected resource -->

</head>
<jsp:include page="navbarManager.jsp">
<jsp:param value="<%= idUser %>" name="idUser"/>
<jsp:param value="<%= user %>" name="user"/>
</jsp:include>
<body>
<c:if test="${errorMsg!=null}">
 <div style="color:red;" id="failed" class="alert alert-success">
    <strong>Modifica non avvenuta!</strong> <%= request.getAttribute("errorMsg") %>
  </div>
</c:if>
<c:if test="${successMsg!=null}">
 <div style="color:green;" id="success" class="alert alert-success">
    <strong>Modifica avvenuta correttamente!</strong> <%= request.getAttribute("successMsg") %>
  </div>
</c:if>
	<div class="page-wrap">
	<form class="w3-container w3-card-4 w3-light-grey"
		action="updateStoreInfo" method="Post" onsubmit="return validate();">
		<h3 style="font-weight: bold; text-align: center">Gestione
			negozio</h3>
		<p style="font-weight: bold; text-align: center">Modificare i
			seguenti dati e salvare le informazioni.</p>
		<p style="font-weight: bold; text-align: center">ATTENZIONE: Il
			nome non è modificabile!</p>
		<p style="color: red">
			<%
				if (request.getAttribute("errorMsg") != null) {
				out.println(request.getAttribute("errorMsg"));
			}
			%>
		</p>

		<p>
			<label>Nome negozio</label> <input class="w3-input w3-border"
				id="nomeNegozio" name="nomeNegozio" type="text"
				value="<%out.println(request.getAttribute("Name"));%>" readonly>
		</p>

		<p>
			<label>Descrizione</label> <input class="w3-input w3-border"
				id="descrizione" name="descrizione"
				value="<%out.println(request.getAttribute("Descrizione"));%>"
				type="text">
		</p>
		<p>
			<label>Telefono</label> <input class="w3-input w3-border"
				id="telefono" name="Telefono"
				value="<%out.println(request.getAttribute("NumeroDiTelefono"));%>"
				type="text">
		</p>
		<p>
			<label>Indirizzo</label> <input class="w3-input w3-border"
				id="indirizzo" name="Indirizzo"
				value="<%out.println(request.getAttribute("Indirizzo"));%>"
				type="text">
		</p>
		<p>
			<label>Città</label> <input class="w3-input w3-border" id="city"
				name="city" value="<%out.println(request.getAttribute("City"));%>"
				type="text">
		</p>
		<p>
			<label>Capienza</label> <input type="number" id="quantity"
				name="quantity" min="1" max="300"
				value="<%out.print(request.getAttribute("Capienza"));%>">
		<p>
			<label>Posti prenotabili</label> <input type="number"
				id="postiPrenotabili" name="postiPrenotabili"
				value="<%out.print(request.getAttribute("CapienzaPrenotabile"));%>"
				min="1" max="300">
		<div class="btn-block">
			<button type="submit">Aggiorna</button>
		</div>
		<br>
	</form>
</div>


</body>
<jsp:include page="footer.jsp"/>
</html>



<script>
	function validate() {
		var description = document.getElementById("descrizione");
		var telefono = document.getElementById("telefono");
		var indirizzo = document.getElementById("indirizzo");
		var city = document.getElementById("city");

		if (description.value == null || description.value == "") {
			window.alert("Inserire la descrizione");
			description.style.background = '#f08080';
			description.focus();
			return false;
		}
		if (telefono.value == null || telefono.value == "") {
			window.alert("Inserire il numero di telefono");
			telefono.style.background = '#f08080';
			telefono.focus();
			return false;
		}
		if (indirizzo.value == null || indirizzo.value == "") {
			window.alert("Inserire l'indirizzo");
			indirizzo.style.background = '#f08080';
			indirizzo.focus();
			return false;
		}
		if (city.value == null || city.value == "") {
			window.alert("Inserire la città");
			city.style.background = '#f08080';
			city.focus();
			return false;
		}
		
		description.value = description.value.trim();
		telefono.value = telefono.value.trim();
		indirizzo.value = indirizzo.value.trim();
		city.value = city.value.trim();
	}
</script>