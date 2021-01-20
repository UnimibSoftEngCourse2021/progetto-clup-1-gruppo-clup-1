<%@ page import="java.sql.*"%>

<%
	if (session.getAttribute("login") != null) {
	response.sendRedirect("welcome.jsp");
}
%>

<!DOCTYPE html>
<html lang="it">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Customer LineUp</title>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login-register.css">
</head>
<body>
	<div class="main-content">

		<form class="form-register" name="successSignUpForm">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Esito registrazione utente</h1>
					</div>

					<p style="color: red">
						<%
							if (request.getAttribute("successMsg") != null) {
							out.println(request.getAttribute("successMsg")); //register success message

						} else if (request.getAttribute("errorMsg") != null) {
							out.println(request.getAttribute("errorMsg")); //register success message
						}
						%>
					
				</div>

				<a href="index.jsp" class="form-log-in-with-existing">Per
					entrare nel sistema: <strong> Effettua il login</strong>
				</a>

			</div>

		</form>

	</div>

</body>

</html>
