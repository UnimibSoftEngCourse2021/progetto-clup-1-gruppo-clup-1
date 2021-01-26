<% int idUser = (Integer) session.getAttribute("idUser");  
    String user = session.getAttribute("name") + "";
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="it">
<head>
<!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
<link rel="stylesheet" href="css/bookings.css?ts=<?=time()?>&quot">
<link rel="stylesheet" href="css/modal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Line Up</title>

</head>

<jsp:include page="navbarManager.jsp">
<jsp:param value="<%= idUser %>" name="idUser"/>
<jsp:param value="<%= user %>" name="user"/>
</jsp:include>
<div>
	<br>

	<h2 style="text-align: center; color: black; font-size: 16pt;">
		<strong>Elenco categorie di prodotti</strong>
	</h2>


</div>

<body>
	<div class="table-wrapper">
	
		
	<table  summary="TableWithCategory"  class="fl-table">
		<thead>
			<tr>
				<th id="IDCategoria">ID</th>
				<th id="NomeCategoria">Nome</th>
				<th id="DescrizioneCategoria">Descrizione</th>
				<th id="OperazioneCategoria">Operazione</th>

			</tr>
		</thead>
			<tbody>
				<c:forEach items="${categoryList}" var="category">
					<tr>
						<td id="idRiga" >${category.getIdCategory()}</td>
						<td >${category.getName()}</td>
						<td >${category.getDescription()}</td>
						<td>
							
						<form name="form1" action="deletionCategoryServlet" method="POST">
							
							<a
								href="http://localhost:8080/clup/deletionCategoryServlet?idCategory=${category.getIdCategory()}"
								class="button"><i class="fa fa-trash"></i></a>
						</form>
					</tr>
				</c:forEach>
	</table>	

	<div id="myModal" class="modal">
			
		<div class="modal-content">
  			<form>
   					 <div class="modal-header">
    					<h3>Aggiunta categoria</h3>
    					<br>
      					<span class="close">&times;</span>
      
    			 	 </div>
    			<div class="modal-body">
     				
  			</form>
  <form name="form3" action="addCategoryServlet" method="POST">
  <label for="fname">Selezionare la categoria da aggiungere al negozio:</label><br>
  						<select id = "categoryNameToAdd" name="categoryNameToAdd" style="width:100%">
       						<c:forEach items="${AllCategoryList}" var="AllCategoryList">
       							<option value="${AllCategoryList.getName()}">${AllCategoryList.getName()}</option>
							</c:forEach>
						</select>
  						<br>
  	<div class="btn-block">
  
  	<button type="submit">Inserisci</button>
				</div>
				</form>
</div>
</div>		
		<br>
	</div>
	
	<div class="btn-block">
			<button id="addCategory" type="submit">Inserisci</button>
	</div>

<jsp:include page="footer.jsp"/>

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
var index = 0;
var modal = document.getElementById("myModal");
var btn = document.getElementById("addCategory");
var span = document.getElementsByClassName("close")[0];
var i;

btn.onclick = function(event) {
	modal.style.display = "block";
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
