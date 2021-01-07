<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bookings.css">
    <link rel="stylesheet" href="css/homepageManager.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
  All rights reserved by ©CustomerLineUp 2021 </p>
  </div>
  </footer>
</html>
