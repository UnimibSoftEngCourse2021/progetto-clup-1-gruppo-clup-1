<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bookings.css">
<link rel="stylesheet" href="css/footer.css">

    <link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<header>
    <nav>
      <div class="logo">
        <h4>customer line up</h4>
      </div>
      <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">Prenota</a></li>
        <li><a href="#">Esplora</a></li>
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
  <h2 style="text-align:center; color:black" id="currentDate"><strong>Prenotazioni del 08 Gennaio 2021</strong> </h2>
  </div>


<body>
<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th>Booking Id</th>
            <th>Booking Number</th>
            <th>Booking Date</th>
            <th>Arrival Time</th>
            <th>Finish Time</th>
            <th>Operation</th>
            
            
        </tr>
        </thead>
        <tbody>
			<c:forEach items="${bookingList}" var="booking">
        		<tr>  
            		<td>${booking.getIdBooking()}</td>
            		<td>${booking.getNumber()}</td>
            		<td>${booking.getBookingDate()}</td>
            		<td>${booking.getArrivalTime()}</td>
            		<td>${booking.getFinishTime()}</td>            		
        		</tr>
    		</c:forEach>
        <tbody>
    </table> 
</div>

  <div id="my_centered_buttons">
            <button class="btn"><i class="fa fa-download"></i> Download</button>
  
  </div>

</body>
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
  All rights reserved by �CustomerLineUp 2021 </p>
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
              link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;

        }
      });

      //burger animation
      burger.classList.toggle('toggle');


    });




  }

  navSlide();
</script>