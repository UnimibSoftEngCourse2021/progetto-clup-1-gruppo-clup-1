<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="it">

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
		var username_regex = /^[a-z A-Z]+$/;
		var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
		var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;

		var username = document.getElementById("Username");
		var email = document.getElementById("email");
		var password = document.getElementById("password");
		var Confirmpassword = document.getElementById("ConfirmPassword");
		username.style.background = 'white';
		email.style.background = 'white';
		password.style.background = 'white';
		Confirmpassword.style.background = 'white';


		if (username.value == '') {
			alert("Errore: Inserisci nuovamente lo username!");
			username.focus();
			username.style.background = '#f08080';
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
		if(password.value != Confirmpassword.value)
			{
			alert("Le password non corrispondono.");
			password.focus();
			password.style.background = '#f08080';
			Confirmpassword.style.background = '#f08080';

			return false;
			}
	}
</script>

</head>

<body>
	<div class="main-content">

		<form class="form-register" action="forgotPassword" method="post"
			onsubmit="return validate();">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Recupero password</h1>
					</div>
					<p style="color: green">
						<%
							if (request.getAttribute("successMsg") != null) {
							out.println(request.getAttribute("successMsg"));
						}
						%>
					</p>


					<div class="form-row">
						<label> <span>Username</span> <input type="text" name="Username"
							id="Username" placeholder="Inserisci username" required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Email</span> <input type="text"
							name="Email" id="email" placeholder="Inserisci email"
							required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Nuova password</span> <input type="password"
							name="Password" id="password" placeholder="Inserisci password"
							required>
						</label>
					</div>
					<div class="form-row">
						<label> <span>Conferma password</span> <input type="password"
							name="ConfirmPassword" id="ConfirmPassword" placeholder="Conferma password"
							required>
						</label>
					</div>

					<input type="submit" name="btn_register" value="Recupera password">

				</div>

				<a href="index.jsp" class="form-log-in-with-existing">Hai già un
					account? <strong> Accedi </strong>
				</a>

			</div>

		</form>

	</div>

</body>

</html>
