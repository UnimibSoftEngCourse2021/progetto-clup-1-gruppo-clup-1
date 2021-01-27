<% int idUser = ((Integer)session.getAttribute("id")); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it">
<head>
<link rel="stylesheet" href="css/customer.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/card.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		getData();
		getCity();
		$("#city").change(function(){
			$("#store").empty();
			$('#store').append($('<option>', {
			    value: 1,
			    text: 'Selezionare un negozio...'
			}));
			getStore();
		})
		$("#store").change(function(){
			var store = $("#store option:selected").text();
			if(store != "Selezionare un negozio..."){
			var res=store.split(',');
			$("#idStore").val(res[0])}
			console.log($("#idStore").val());
		})
		
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 5000);
	})
</script>
</head>
<jsp:include page="navbarCustomer.jsp"/>
<body>
<%
session.setAttribute("StatusBooking", 0);
%>
<div>
<c:if test="${successMsg!=null}">
 <div style="color:green;" id="success" class="alert alert-success">
    <strong>Prenotazione completata!</strong> <%= request.getAttribute("successMsg") %>
  </div>
</c:if>


</div>
<div class="page-wrap">
   <div class = "content-wrapper">
   	<div class = "content">
   		<div class="row">
   	 		<div class="col-xl-3 col-sm-6">
            	<div class="card card-mini mb-4">
                	<div class="card-body">
                	<h2>Seleziona una città</h2>
                	<select id="city" value="Seleziona una città">
                		<option selected="selected">
                			Selezionare una città...
                		</option>
                	</select>
                    </div>
                </div>
            </div>
   			<div class="col-xl-3 col-sm-6">
            	<div class="card card-mini mb-4">
                	<div class="card-body">
                	<h2>Seleziona un negozio</h2>
                	<select id="store">
                		<option selected="selected">
                			Selezionare un negozio...
                		</option>
                	</select>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6">
            	<div class="card card-mini mb-4">
                	<div class="card-body">
					<form action="customerAddBooking.jsp" method="GET">
					<input id="idStore" type="hidden" name="idStore">
					<input type="submit" class="btn-block" value="Prenota ora">
					</form>
                    </div>
                </div>
            </div>
   	  	</div>	
   	</div>
   </div> 
   <br>
   <hr>
   <div class="card mb-4">
 		<div class="card-header">
   			<i class="fas fa-table mr-1"></i>
    			Prenotazioni per i prossimi 7 giorni
  		<div class="table-wrapper">
  			<table summary="BookingTbaleCustomer" class="fl-table">
  				<thead>
  		 			<tr>
            			<th id="Numero">Numero</th>
           				<th id="Data">Data</th>
            			<th id="OraArrivo">Ora di arrivo</th>
            			<th id="OraFine">Ora di fine</th>
            			<th id="Negozio">Negozio</th>
            			<th id="CittaPrenotazione">Città</th>
            			<th id="NumeroTelefono">Telefono</th>                           
        			</tr>
        		</thead>
        		<tbody id="table-body">
        		</tbody>
  			</table>  	
  		</div>
 		</div>
 	</div>
  </div>
</body>
<jsp:include page="footerCustomer.jsp"/>
</html>
<script>
	     function getData(){
    	  $.get("UserBookingServlet", function(responseJson) {   
    		  $("#table-body").empty();
	        $.each(responseJson, function(index, item) { 
	        	var $tr = $("<tr>").appendTo($("#table-body")); 
	        	$("<td>").text(item.idBooking).appendTo($tr); 
	        	$("<td>").text(item.dateAsString).appendTo($tr); 
	        	$("<td>").text(item.arrivalTime).appendTo($tr); 
	        	$("<td>").text(item.finishTime).appendTo($tr); 
	        	$("<td>").text(item.store.name).appendTo($tr); 
	        	$("<td>").text(item.store.city).appendTo($tr); 
	        	$("<td>").text(item.store.telephoneNumber).appendTo($tr); 
	        });


			});
		}
	     
	     function getCity(){
	    	 $.get("StoreCity",function(responseJson){
	    		 $.each(responseJson, function(index,item){
	    			 var $option = $("<option>").appendTo($("#city"));
	    			 $option.html(item);
	    		 });
	    	 });
	     }
	     
	     function getStore(){
	    	 var cityName = $("#city option:selected").text();
	    	 $.get("GetStore",{city:cityName}, function(responseJson){
	    		 $.each(responseJson, function(index,item){
	    			 var $option = $("<option>").appendTo($("#store"));
	    			 $option.html(item.idStore + "," + item.name + "," + item.city +"," +item.address);
	    		 });
	    	 });
	     }
</script>		