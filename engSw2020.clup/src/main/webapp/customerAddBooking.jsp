<% 
   int iduser = (Integer) session.getAttribute("id");
   
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it">
<head>
<title>Customer Line Up</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
<link rel="stylesheet" href="css/modifyBooking.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		getCategory();
		setTimeout(function() {
			  $("#failed").fadeOut().empty();
			}, 5000);
	});
</script>
<script>
	$(function() {
		$.datepicker.setDefaults({
			onClose : function(date, inst) {
				$("#selectedDtaeVal").html(date);
			}
		});

		$("#datepicker").datepicker();
	});
</script>
<script>

	function getCategory(){
		var idStore = $("#idStore").val();
		console.log(idStore);
		$.get("GetBookingCategory",{store:idStore} , function(responseJson){
			$.each(responseJson, function(index,item){
				 $('<label />', { 'for': 'category'+index, text: item.Name }).appendTo("#categoryDiv");
  				 $('<input />', { type: 'checkbox', id: 'category'+index, value: item.idCategory, name:"category" }).appendTo("#categoryDiv");
			})
		});
	}
</script>

</head>
<jsp:include page="navbarCustomer.jsp"/>
<body>
<c:if test="${errorMsg!=null}">
 <div style="color:red;"id="failed" class="alert alert-danger">
    <strong>Prenotazione fallita!</strong> <%= request.getAttribute("errorMsg") %>
  </div>
</c:if>
	<div class="testbox">
		<form id="editform" action="AddBookingUser" class="formContainer" method="post" onsubmit="return validateDate();">
			<fieldset>
				<legend>Prenotazione</legend>
				<div class="item">
					<label for="bookingDate">Data Prenotazione <span>*</span></label> <input
						id="datepicker" type="date" name="bookingDate" id="datePicker" /> <i
						class="fas fa-calendar-alt"></i>
				</div>
				<div class="item">
					<label for="arrivalTime">Orario di arrivo<span>*</span></label> <input
						id="arrivalTime" type="time" name="arrivalTime"
						placeholder="Orario di arrivo" />
				</div>
				<div class="item">
					<label for="finishTime">Orario di fine<span>*</span></label> <input
						id="finishTime" type="time" name="finishTime"
						placeholder="Orario di fine" />
				</div>
				<div class="item">					
					<input id="idStore" type="hidden" name="idStore" value="<%=request.getParameter("idStore")%>" />
				</div>
				<div id="categoryDiv" style="width:3%">
				<label>Categorie</label><br>
				</div>
				<div class="item"> 
					<input id="idUser" type="hidden" name="idUser" value="<%= iduser %>" />
				</div>
				
				<div class="btn-block">
					<button type="submit">Prenota</button>
				</div>
			</fieldset>
		</form>


	</div>
</body>
<jsp:include page="footerCustomer.jsp"/>
</html>
<script>
	function validateDate() {

		var date = document.getElementById("editform").elements[1];
		var startTime = document.getElementById("editform").elements[2];
		var endTime = document.getElementById("editform").elements[3];
		var todayDate = new Date();
		var bookingDate = new Date(date.value);
		var userCheckBox = document.getElementById("editform").elements[5];
		var userName = document.getElementById("editform").elements[6];
		var userSurname = document.getElementById("editform").elements[7];
		var userEmail = document.getElementById("editform").elements[8];
		var userTelephoneNumber = document.getElementById("editform").elements[9];

		if (date.value == null || date.value == ""
				|| (bookingDate.getMonth()<todayDate.getMonth() && bookingDate.getDate() < todayDate.getDate())) {
			alert("Inserire una data valida");
			date.style.background = "#f08080";
			date.focus();
			return false;
		}

		if (startTime.value == null || startTime.value == "") {
			alert("Inserire un orario di arrivo valido");
			startTime.style.background = "#f08080";
			startTime.focus();
			return false;
		}

		if (endTime.value == null || endTime.value == "") {
			alert("Inserire un orario di fine valido");
			endTime.style.background = "#f08080";
			endTime.focus();
			return false;
		}

		var time = startTime.value.split(":");
		var startHour = time[0];
		var startMinutes = time[1];

		var time1 = endTime.value.split(":");
		var endHour = time1[0];
		var endMinutes = time1[1];

		if (startHour > endHour) {
			alert("L'orario di arrivo deve essere minore dell'orario di fine");
			startTime.style.background = "#f08080";
			startTime.focus();
			return false;
		} else if (startHour == endHour) {
			if (startMinutes > endMinutes) {
				alert("L'orario di arrivo deve essere minore dell'orario di fine");
				startTime.style.background = "#f08080";
				startTime.focus();
				return false;
			}
		}
	}
</script>