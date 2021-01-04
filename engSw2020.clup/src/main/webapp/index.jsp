<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!= null) 
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

	<title>Customer LineUp</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<script>
		
		function validate()
		{
			var email = document.indexForm.txt_email;
			var password = document.indexForm.txt_password;
				
			if (email.value == null || email.value == "") 
			{
				window.alert("Inserire lo username"); 
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if (password.value == null || password.value == "") 
			{
				window.alert("Inserire la password"); 
				password.style.background = '#f08080';
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>
    <div class="main-content">

        <form class="form-register" action="loginServlet" method="post" name="indexForm" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Login</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
				   

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="username" id="email" placeholder="Inserire username">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="password" id="password" placeholder="Inserire password">
                        </label>
                    </div>

					<input type="submit" name="btn_login" value="Login">
                    
                </div>

				<a href="registration.jsp" class="form-log-in-with-existing">Non hai un account? <strong> Registrati qui</strong></a>

            </div>

        </form>

    </div>

</body>

</html>
