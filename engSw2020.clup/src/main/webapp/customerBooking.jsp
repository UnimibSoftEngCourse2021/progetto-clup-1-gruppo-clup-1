<% int idUser = (Integer) session.getAttribute("id"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bookings.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/footer.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Customer Line Up</title>
<script>
	$(document).ready(function(){
		getData();		
		setTimeout(function() {
			  $("#success").fadeOut().empty();
			}, 500);
	})
</script>
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
        			<a href="http://localhost:8080/clup/customerInformation.jsp">Informazioni Utente</a>
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
	<div>
  <br>
  
    <h2 style="text-align:center; color:black; font-size: 16pt;" >
    <input type="text" id="myName" onkeyup="myFunction()" placeholder="Filtra per negozio">
    <br>
    <input type="date" id="myDate"  onkeydown="return false">
    
    <i class="fa fa-trash" style="color:seagreen"></i>
    <br>
    <strong id="date"></strong> 
    </h2>
    	<script>
	$(document).ready(function(){	
		
		 $("#date").text("Storico prenotazioni completo");
		 $("#myDate").change(function() {
			 $("tr").each(function(){
				 if($(this).attr('class')=="hide"){
					 $(this).removeClass("hide");
					 $(this).show();
				 }
			 })
			 var date = $("#myDate").val();
			 var res = date.split("-");
			 var year = res[0];
			 var month = res[1];
			 if(month == "01" || month == "02" || month == "03"  || month == "04" || month == "05" || month == "06" || month == "07" || month == "08" || month == "09")
				 {
				    month = month.slice(-1);
				 }
			 var day = res[2]
			 if(date==null || date =="")
				 {
				 $("tr").removeClass("hide");
				 var defaultDate = new Date();
				 $("#date").text("Prenotazioni del " + defaultDate.getDate() + " " + getMonthName(defaultDate.getMonth()) + " " + defaultDate.getFullYear());
				 return false;
				 }
			 function getMonthName(monthNumber){
				 var months = ['Gennaio','Febbrio','Marzo','Aprile','Maggio','Giugno','Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre'];
				 return months[monthNumber];
			 }
			 $("#date").text("Prenotazioni del " + day + " " + getMonthName(month-1) + " " + year);

			 $('tr td.bookingDate').each(function(){
				if($(this).text()!= date || $(this).parent().attr('class') == "hide-by-name")
					{	
					console.log(date);
						if($(this).parent().attr('class') != "hide-by-name")
							{
								$(this).parent('tr').addClass("hide");
							}
						$(this).parent().hide();
						
						
					}
			 });
		 });
		 $(".fa-trash").click(function(){
			 $("tr").removeClass("hide");
			 $("tr").removeClass("hide-by-name");
			 $("tr").show();
			 setDefaultDate();
			 $("#myName").val("");
			 $("#myDate").val("");
			 $("#date").text("Storico prenotazioni completo");
			
		 })
	});
	</script>
	
	<script>
	function myFunction() {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue, date;
	  date = document.getElementById("myDate")
	  input = document.getElementById("myName");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("bookingTable");
	  tr = table.getElementsByTagName("tr");
	  console.log(date.value);
	  if(input.value=="" || input.value == null)
	  {	
		  	if(date.value == null || date.value == ""){
		  		$("tr").removeClass("hide-by-name");  		
		  		$("tr").show();
		  	}
		  	else{
			$("tr td.bookingDate").each(function(){
				if($(this).parent().attr('class')=="hide-by-name")
					{
					 $(this).parent().removeClass("hide-by-name");
					 if(date.value == $(this).text()){
						 console.log("ciao");
					 	 $(this).parent().show();
					 }
					}
			});
		  
	  	}
	  }
	  else{
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1 && tr[i].className != "hide") {	    	  
	    	  tr[i].style.display = "";
	      } 
	      else if (!(txtValue.toUpperCase().indexOf(filter) > -1) && tr[i].className != "hide")  {
	    	tr[i].classList.add("hide-by-name");
	        tr[i].style.display = "none";
	      }
	    }
	  }
	 }
	}
   
	</script>
    
  
  <script>
  function setDefaultDate(){
  n =  new Date();
  const month = n.toLocaleString('default', { month: 'long' });
  y = n.getFullYear();
  d = n.getDate();
  document.getElementById("date").innerHTML = "Prenotazioni del " + d + " " + month + " " + y;
  document.getElementById("myDate").valueAsDate = n;
  }
  </script>
 </div>
	
</header>
</head>

<body>
<%
session.setAttribute("StatusBooking", 1);
%>
<div class="table-wrapper">
  <form name="form1" method="post" action="DeletionServlet">
    <table summary="TableWithBooking" id="bookingTable" class="fl-table">
        <thead>
        <tr>
            <th id="Nome">Negozio</th>
            <th id="City">CittÓ</th>
            <th id="Cognome">Indirizzo</th>
            <th id="Telefono">Telefono</th>
            <th  id="Prenotazione">Data</th>
            <th id="OraArrivo">Ora di arrivo</th>
            <th id="OraArrivo">Ora di fine</th>
            <th id="Operazione">Operazione</th>
            
            
                                    
        </tr>
        </thead>
        <tbody id="table-body">
        		</tbody>
    </table>
  </form>
  <br>

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
		<p>All rights reserved by ęCustomerLineUp 2021</p>
	</div>
</footer>
</html>
<script>
  const navSlide = () => {
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('.nav-links li');
    //Toggle Nav
    burger.addEventListener('click', ()=>{
      nav.classList.toggle('nav-active');
      //Animate Links
      navLinks.forEach((link, index)=>{
        if(link.style.animation){
          link.style.animation = ''
        }else{
              link.style.animation = "navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s";
        }
      });
      //burger animation
      burger.classList.toggle('toggle');
    });
  }
  navSlide();
</script>


<script>
	     function getData(){
    	  $.get("UserBookingServlet", function(responseJson) {   
    		  $("#table-body").empty();
	        $.each(responseJson, function(index, item) { 
	        	
	        	
	        	var $tr = $("<tr>").appendTo($("#table-body"));
	        	var id = item.idBooking;
	        	var strDel = "DeletionServlet?idBooking=" + id;
	        	var strMod = "modifyCustomerBooking.jsp?idBooking=" + id;
	        	$("<td class= name>").text(item.store.name).appendTo($tr);
	        	$("<td>").text(item.store.city).appendTo($tr);
	        	$("<td>").text(item.store.address).appendTo($tr); 
	        	$("<td>").text(item.store.telephoneNumber).appendTo($tr); 
	        	$("<td class= bookingDate>").text(item.dateAsString).appendTo($tr); 
	        	$("<td>").text(item.arrivalTime).appendTo($tr); 
	        	$("<td>").text(item.finishTime).appendTo($tr);
	        	 var today = (new Date()).toISOString().split('T')[0];
	        	 console.log(today);
	        	 if(item.dateAsString < today)
	        		 {
	        		 $("<td>").text("NON MODIFICABILE").wrapInner("<strong />").appendTo($tr);
	        		 }
	        	 else{
	        		 $('<td><a href =' + strDel + '  class="button"><i class="fa fa-trash"></i></a> <a href =' + strMod + ' class="button"><i class="fa fa-pencil"></i></a></td></td>').appendTo($tr);
	        		
	        	 }
	        	
	        });
			});
		}
</script>	