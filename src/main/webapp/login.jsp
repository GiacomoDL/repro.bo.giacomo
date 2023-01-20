<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

 <link rel="stylesheet" href="styles.css">
 
</head>
<body>
<h1>Login</h1>
<% 
if(request.getAttribute("logoutMessage") != null){ %>
	<p> Logout Effettuato  </p>
<% } %>
<form action="./LoginServlet" method="post">
  <label id="email">Email</label>
  <br>
  <input type="email" name="email">
  <br>
  <label id="password">Password</label>
  <br>
  <input type="password" name="password">
  <br><br>
  <input id="button" type="submit" value="Continue">
</form> 

<br>
	Don't have an account?  <a href="registration.html">Sign up</a>
</body>
</html>