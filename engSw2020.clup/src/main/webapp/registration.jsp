<%@ page import="java.sql.*"%>

<%
	if (session.getAttribute("login") != null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Customer Line Up</title>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login-register.css">

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
							required>
						</label>
					</div>

					<input type="submit" name="btn_register" value="Registrati">

				</div>

				<a href="index.jsp" class="form-log-in-with-existing">Hai già un
					account? <b> Accedi </b>
				</a>

			</div>

		</form>

	</div>

</body>

</html>
