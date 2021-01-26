<%@ page import="java.sql.*"%>

<%
	if (session.getAttribute("login") != null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>
<!DOCTYPE html>
<html lang="it">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Customer Line Up</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css?ts=<?=time()?>&quot">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"></script> <!-- Compliant: integrity value should be replaced with the digest of the expected resource -->
<link rel="stylesheet" href="css/login-register.css">
<script>
	$(document).ready(function(){	
		$("#pwdInfo").hover(
				function(){
					console.log("sono qui");
					$("#pwdRequirement").show();
			  },function(){
					$("#pwdRequirement").hide();
		});
	});
</script>
<!-- javascript for registeration form validation-->
<script>
	function validate() {
		var first_name = /^[a-z A-Z]+$/;
		var last_name = /^[a-z A-Z]+$/;
		var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
		var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;

		var fname = document.getElementById("fname");
		var lname = document.getElementById("lname");
		var email = document.getElementById("email");
		var password = document.getElementById("password");

		if (!first_name.test(fname.value) || fname.value == '') {
			alert("Errore: Inserisci nuovamente il nome!");
			fname.focus();
			fname.style.background = '#f08080';
			return false;
		}
		if (!last_name.test(lname.value) || lname.value == '') {
			alert("Errore: Inserisci nuovamente il cognome!");
			lname.focus();
			lname.style.background = '#f08080';
			return false;
		}
		if (!email_valid.test(email.value) || email.value == '') {
			alert("Email non valida. Riprovare");
			email.focus();
			email.style.background = '#f08080';
			return false;
		}
		if (!password_valid.test(password.value) || password.value == '') {
			alert("Inserire una password corretta.");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}
	}
</script>

</head>

<body>
	<div class="main-content">

		<form class="form-register" action="registrationServlet" method="post"
			onsubmit="return validate();">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Registrazione utente</h1>
					</div>


					<p style="color: green">
						<%
							if (request.getAttribute("successMsg") != null) {
							out.println(request.getAttribute("successMsg"));
						}
						%>
					</p>


					<div class="form-row">
						<label> <span>Nome</span> <input type="text" name="Name"
							id="fname" placeholder="Inserisci nome" required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Cognome</span> <input type="text"
							name="Surname" id="lname" placeholder="Inserisci cognome"
							required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Data di nascita</span> <input type="date"
							value="2017-06-01" id="data" name="BirthdayDate" required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Sesso</span> <select id="sesso" name="Sesso">
								<option value="M">M</option>
								<option value="F">F</option>
						</select>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Numero di telefono</span> <input type="text"
							name="TelephoneNumber" id="phoneNumber"
							placeholder="Inserisci numero di telefono" required>
						</label>
					</div>

					<div class="form-row">
						<label> <span>Email</span> <input type="text" name="Email"
							id="email" placeholder="Inserisci email" required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Username</span> <input type="text"
							name="Username" id="username" placeholder="Inserisci username"
							required>
						</label>
					</div>

					<div class="form-row">
						<label> <span>Password</span> <input type="password"
							name="Password" id="password" placeholder="Inserisci password"
							required><i id="pwdInfo" class="fa fa-question-circle" style="font-size:24px;"></i>
						</label>
					</div>

					<input type="submit" name="btn_register" value="Registrati">

				</div>

				<a href="index.jsp" class="form-log-in-with-existing">Hai già un
					account? <strong> Accedi </strong>
				</a>

			</div>

		</form>

	</div>
	<div class="popup" id="pwdRequirement">
		<form class="form-container">
			La password deve contenere una lettera maiuscola, una lettera minuscola, almeno un carattere speciale (!@#$%&*()<>) 
			e deve essere compresa fra i 6 e i 12 caratteri
		</form>
	</div>
</body>

</html>
