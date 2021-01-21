<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bookings.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/dropdown.css">
<link rel="stylesheet" href="css/modal.css">

<link rel="stylesheet" href="css/footer.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Line Up</title>

</head>

<header> <nav>
<div class="logo">
	<h4>customer line up</h4>
</div>
<ul class="nav-links">
	<li><a href="http://localhost:8080/clup/homepageManager.jsp">Home</a></li>
	<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Prenotazioni</a>
		<div class="dropdown-content">
			<a href="http://localhost:8080/clup/BookingServlet">Visualizza
				Prenotazioni</a> <a href="http://localhost:8080/clup/addBooking.jsp">Aggiungi
				Prenotazione</a>
		</div></li>
	<li class="dropdown"><a href="#" class="dropbtn">Store</a>
		<div class="dropdown-content">
			<a href="http://localhost:8080/clup/storeSetup">Gestione negozio</a>
			<a href="#">Gestione dipendente</a> 
			<a href="http://localhost:8080/clup/getCategoryServlet">Gestione
				categorie</a>
		</div></li>
	<li><a href="#">User</a></li>

</ul>
<div class="burger">
	<div class="line1"></div>
	<div class="line2"></div>
	<div class="line3"></div>
</div>
</nav> </header>
<div>
	<br>

	<h2 style="text-align: center; color: black; font-size: 16pt;">
		<strong>Elenco categorie di prodotti</strong>
	</h2>


</div>


<body>
	<div class="table-wrapper">
		<form name="form1" method="post" action="deletionCategoryServlet">
			<table class="fl-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Descrizione</th>
						<th>Operazione</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${categoryList}" var="category">
						<tr>
							<td>${category.getIdCategory()}</td>
							<td>${category.getName()}</td>
							<td>${category.getDescription()}</td>
							<td><a
								href="http://localhost:8080/clup/deletionCategoryServlet?idCategory=${category.getIdCategory()}"
								class="button"><i class="fa fa-trash"></i></a> <a
								href="#"
								class="button"><i class="fa fa-pencil"></i></a></td>
								
						</tr>
						<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
    <h3>Modifica categoria</h3>
      <span class="close">&times;</span>
      
    </div>
    <div class="modal-body">
       <label for="fname">Nome</label><br>
  	<input type="text" id="name" name="fname" style="weigth:100%"><br>
             <label for="fname">Descrizione categoria</label><br>
  	<input type="text" id="description" name="fname" style="weigth:100%"><br>
  	<br>
  	<div class="btn-block">
					<button type="submit">Aggiorna</button>
				</div>
</div>
					</c:forEach>
				<tbody>
			</table>
		</form>
		<br>

	</div>

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
		<p>All rights reserved by ©CustomerLineUp 2021</p>
	</div>
	</footer>

</body>


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


<script>
var modal = document.getElementById("myModal");
var btn = document.getElementsByTagName("i");
var td = document.getElementsByTagName("td");
var tr = document.getElementsByTagName("tr");
var span = document.getElementsByClassName("close")[0];
var i;
for (i = 0; i < btn.length; i++) {
	btn[i].onclick = function() {
		var txt = "ciao";
		document.getElementById("name").value = "Casa";
		document.getElementById("description").value = "Prodotti per la casa";

		  modal.style.display = "block";
		}
}
span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
