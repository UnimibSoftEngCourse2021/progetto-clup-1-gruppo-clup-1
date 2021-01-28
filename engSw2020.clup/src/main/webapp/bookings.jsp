<% String user = session.getAttribute("name") + ""; 
int idUser = (Integer) session.getAttribute("idUser"); 
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it">
<head>
<!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">-->
<link rel="stylesheet" href="css/bookings.css?ts=<?=time()?>&quot">
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
<jsp:include page="navbarManager.jsp">
<jsp:param value="<%= idUser %>" name="idUser"/>
<jsp:param value="<%= user %>" name="user"/>
</jsp:include>
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
  document.getElementById("date").innerHTML = "Storico prenotazioni completo";
  document.getElementById("myDate").valueAsDate = n;
  </script>
 </div>


<body>
<div class="page-wrap">
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
            <th>time</th>
            <th id="Operazione">Operazione</th>
                                    
        </tr>
        </thead>
        <tbody>
        	<jsp:useBean id="date" class="java.util.Date"/>
        	<fmt:formatDate var="time" value="${date}" type="time"/>
        	<jsp:useBean id="now" class="java.util.Date"/>
        	<fmt:formatDate value = "${now}" pattern = "yyyy-MM-dd"  var="myDate" />
			<c:forEach items="${bookingList}" var="booking">
        		<tr>  
            		<td>${booking.getUser().getName()}</td>
            		<td class="surname">${booking.getUser().getSurname()}</td>
            		<td>${booking.getUser().getEmail()}</td>
            		<td>${booking.getUser().getTelephoneNumber()}</td>            		
            		<td class="bookingDate">${booking.getBookingDate()}</td>
            		<td>${booking.getArrivalTime()}</td>
            		<td>${booking.getFinishTime()}</td>
            		<td>${time}</td>
            		<c:if test="${booking.getBookingDate() gt myDate}">
            		<td><a href ="http://localhost:8080/clup/DeletionServlet?idBooking=${booking.getIdBooking()}"
            		class="button"><i class="fa fa-trash"></i></a>
            		<a href="http://localhost:8080/clup/modifyBooking.jsp?idBooking=${booking.getIdBooking()}" class="button"><i class="fa fa-pencil"></i></a>
            		</td>
            		</c:if>
            		<c:if test="${booking.getBookingDate() eq myDate}">
            		<c:if test="${booking.getArrivalTime() gt time }">
            		<td><a href ="http://localhost:8080/clup/DeletionServlet?idBooking=${booking.getIdBooking()}"
            		class="button"><i class="fa fa-trash"></i></a>
            		<a href="http://localhost:8080/clup/modifyBooking.jsp?idBooking=${booking.getIdBooking()}" class="button"><i class="fa fa-pencil"></i></a>
            		</td>
            		</c:if>
            		<c:if test="${booking.getArrivalTime() lt time }">
            		<td><strong style="color:red;">NON MODIFICABILE</strong></td>
            		</c:if>
            		</c:if>    
            		<c:if test="${booking.getBookingDate() lt myDate}">      		
            		<td><strong style="color:red;">NON MODIFICABILE</strong></td>
            		</c:if>                        		
        		</tr>
    		</c:forEach>
        <tbody>
    </table>
  </form>
  <br>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>


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