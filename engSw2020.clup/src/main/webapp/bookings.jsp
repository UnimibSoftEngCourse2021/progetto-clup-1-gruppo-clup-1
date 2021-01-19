<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bookings.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/footer.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
</head>

<header>
    <nav>
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
        <li><a href="#">Store</a></li>
        <li><a href="#">User</a></li>
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
    <input type="date" id="myDate" >
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
    <table class="fl-table">
        <thead>
        <tr>
            <th>Numero</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Telefono</th>
            <th>Prenotazione</th>
            <th>Ora di arrivo</th>
            <th>Ora di fine</th>
            <th>Operation</th>
                                    
        </tr>
        </thead>
        <tbody>
			<c:forEach items="${bookingList}" var="booking">
        		<tr>  
            		<td>${booking.getNumber()}</td>
            		<td>${booking.getUser().getName()}</td>
            		<td>${booking.getUser().getSurname()}</td>
            		<td>${booking.getUser().getEmail()}</td>
            		<td>${booking.getUser().getTelephoneNumber()}</td>            		
            		<td>${booking.getBookingDate()}</td>
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
      function openForm() {
        document.getElementById("popupForm").style.display = "block";
      }
      function closeForm() {
        document.getElementById("popupForm").style.display = "none";
      }
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
              link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;

        }
      });

      //burger animation
      burger.classList.toggle('toggle');


    });




  }

  navSlide();
</script>
