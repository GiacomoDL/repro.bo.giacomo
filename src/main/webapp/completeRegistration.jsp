<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complete Registration</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	if(request.getAttribute("registrationFailed") != null){ 
	%><p> Registrazione fallita, riprovare  </p><% 
		id=request.getParameter("userId");
	} %>

	<form action="./CompleteRegistrationServlet" method="post">

  		<input type="hidden" name="userId" value="<%= id %>">
  		
  		<label>Password</label><br>
  		<input type="password" name="password1"><br>
  		
  		<label>Conferma Password</label><br>
  		<input type="password" name="password2"><br>
  		
  		<br>
  		<input type="submit" value="Confirm">
	</form>
</body>
</html>