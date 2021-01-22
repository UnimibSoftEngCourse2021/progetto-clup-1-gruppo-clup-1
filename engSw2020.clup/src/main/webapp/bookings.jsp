<% String user = session.getAttribute("name") + ""; 
int idUser = (Integer) session.getAttribute("idUser"); 
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script type="text/javascript">
		function callservlet(idBooking) {

    		var servletname="DeletionServlet";

   			if(servletname== "")
        	{
       			alert("NO value..");
        		return false;
            }
            else
        	{
            	document.location.href = "DeletionServlet?idBooking=" + idBooking;
        		return false;
        	}
	}
	</script>
	<script>
		function validateDate(){
			var startTime = document.getElementById("editform").elements[1].value;
			var time = startTime.split(":");
			var startHour = time[0];
			var startMinutes = time[1];

			var endTime = document.getElementById("editform").elements[2].value;
			var time1 = endTime.split(":");
			var endHour = time1[0];
			var endMinutes = time1[1];

			if(startHour>endHour)
				{alert("L'orario di arrivo deve essere minore dell'orario di fine");
				return false;}
			else if(startHour == endHour){
				if(startMinutes > endMinutes){
					alert("L'orario di arrivo deve essere minore dell'orario di fine");
					return false;
				}
			}
		}
	</script>
	<script>
	$(document).ready(function(){		
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
			 $("#myName").val("");
			 $("#myDate").val("");
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
	    td = tr[i].getElementsByTagName("td")[1];
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
<div>
  <br>
  
    <h2 style="text-align:center; color:black; font-size: 16pt;" >
    <input type="text" id="myName" onkeyup="myFunction()" placeholder="Cerca per cognome...">
    <br>
    <input type="date" id="myDate" onkeydown="return false">
    
    <i class="fa fa-trash" style="color:seagreen"></i>
    
        
    <br>
    <strong id="date"></strong> 
    </h2>
    
  
  <script>
  n =  new Date();
  const month = n.toLocaleString('default', { month: 'long' });
  y = n.getFullYear();
  d = n.getDate();
  document.getElementById("date").innerHTML = "Prenotazioni del " + d + " " + month + " " + y;
  document.getElementById("myDate").valueAsDate = n;
  </script>
 </div>


<body>
<div class="table-wrapper">
  <form name="form1" method="post" action="DeletionServlet">
    <table summary="TableWithBooking" id="bookingTable" class="fl-table">
        <thead>
        <tr>
            <th id="Nome">Nome</th>
            <th id="Cognome">Cognome</th>
            <th id="Email">Email</th>
            <th id="Telefono">Telefono</th>
            <th id="Prenotazione">Prenotazione</th>
            <th id="OraArrivo">Ora di arrivo</th>
            <th id="OraFine">Ora di fine</th>
            <th id="Operazione">Operazione</th>
                                    
        </tr>
        </thead>
        <tbody>
			<c:forEach items="${bookingList}" var="booking">
        		<tr>  
            		<td>${booking.getUser().getName()}</td>
            		<td class="surname">${booking.getUser().getSurname()}</td>
            		<td>${booking.getUser().getEmail()}</td>
            		<td>${booking.getUser().getTelephoneNumber()}</td>            		
            		<td class="bookingDate">${booking.getBookingDate()}</td>
            		<td>${booking.getArrivalTime()}</td>
            		<td>${booking.getFinishTime()}</td>           		
            		<td><a href ="http://localhost:8080/clup/DeletionServlet?idBooking=${booking.getIdBooking()}"
            		class="button"><i class="fa fa-trash"></i></a>
            		<a href="http://localhost:8080/clup/modifyBooking.jsp?idBooking=${booking.getIdBooking()}" class="button"><i class="fa fa-pencil"></i></a>
            		</td>            		
        		</tr>
    		</c:forEach>
        <tbody>
    </table>
  </form>
  <br>
    
  <form name="formDownload" method="GET" action="bookingDownload">
  <div class="container">
  <div class="row">
    <div class="col text-center">
	<button class="btn"><i class="fa fa-download" ></i> Download</button>
    </div>
  </div>
</div>

</form>

</div>


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
  $( function() {
    $.datepicker.setDefaults({
        onClose:function(date, inst){
            $("#selectedDtaeVal").html(date);
        }
    });
    $( "#datepicker" ).datepicker();
});
</script>
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