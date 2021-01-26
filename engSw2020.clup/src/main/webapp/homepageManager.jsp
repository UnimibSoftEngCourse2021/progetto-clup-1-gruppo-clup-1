<%
	int i = ((Integer) session.getAttribute("id")).intValue();
	String user = session.getAttribute("name") + "";
	int idUser = (Integer) session.getAttribute("idUser"); 
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Customer Line Up</title>
<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/card.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/homepageManager.css?ts=<?=time()?>&quot">
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
    	getCapacity();
         var getdata = setInterval(getData,5000);
         var getcount = setInterval(getCountBooking,1000);
         var getpeople = setInterval(getPeople,1000);
         var getcategory = setInterval(getCategory,1000);
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
		
		function getCapacity(){
			$.get("GetCapacityServlet", function(responseJson){
				$("#capacity").text(responseJson)
			});
		}
		function getPeople(){
			$.get("GetPeopleStoreServlet", function(responseJson){
				$("#people").text(responseJson);
			});
		}
		
		function getCategory(){
			$.get("GetMaxCategoryServlet",function(responseJson){
				$("#category").text(responseJson);
			})
		}
		
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 10000);
	});
</script>
</head>
<jsp:include page="navbarManager.jsp">
<jsp:param value="<%= idUser %>" name="idUser"/>
<jsp:param value="<%= user %>" name="user"/>
</jsp:include>
  
  <body>
  <c:if test="${successMsg!=null}">
 <div style="color:green;" id="success" class="alert alert-success">
    <strong>Prenotazione completata!</strong> <%= request.getAttribute("successMsg") %>
  </div>
</c:if>
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
                          <h2 id="capacity" class="mb-1">0</h2>
                          <p>Capacita' negozio</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini mb-4">
                        <div class="card-body">
                          <h2 id="people" class="mb-1">0</h2>
                          <p>Persone presenti attualmente</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card card-mini mb-4">
                        <div class="card-body">
                          <h2 id="category" class="mb-1">Alimentari</h2>
                          <p>Categoria piu' richiesta oggi</p>
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
 	<jsp:include page="footer.jsp"/>
</body>

</html>