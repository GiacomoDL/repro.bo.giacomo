<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="header.css">

</head>
<body>

 <div class="navbar">
  <a href="user.jsp">Lista Utenti</a>
  <a href="registration.html">Inserisci Utente</a>
<!--   <a href="updateUser.jsp">Modifica Utente</a> -->
  <a href="role.jsp">Lista Ruoli</a>
  <a href="insertRole.jsp">Inserisci Ruolo</a>
<!--   <a href="updateRole.jsp">Modifica Ruolo</a> -->
  <a id="right" href="LogoutServlet">Logout</a>
  <span> Welcome <%= session.getAttribute("userLoggedEmail") %> </span>
</div>

<% 
if(request.getAttribute("deleteUser") == "OK"){ %>
	<p> Utente Eliminato </p>
<% } %>
<% 
if(request.getAttribute("deleteUser") == "KO"){ %>
	<p> Utente Non Eliminato </p>
<% } %>

<% 
if(request.getAttribute("deleteRole") == "OK"){ %>
	<p> Ruolo Eliminato </p>
<% } %>
<% 
if(request.getAttribute("deleteRole") == "KO"){ %>
	<p> Ruolo Non Eliminato </p>
<% } %>


<% 
if(request.getAttribute("updateUser") == "OK"){ %>
	<p> Utente Modificato </p>
<% } %>
<% 
if(request.getAttribute("updateUser") == "KO"){ %>
	<p> Utente Non Modificato  </p>
<% } %>

<% 
if(request.getAttribute("updateRole") == "OK"){ %>
	<p> Ruolo Modificato </p>
<% } %>
<% 
if(request.getAttribute("updateRole") == "KO"){ %>
	<p> Ruolo Non Modificato  </p>
<% } %>

<% 
if(request.getAttribute("insertRole") == "OK"){ %>
	<p> Ruolo Aggiunto </p>
<% } %>
<% 
if(request.getAttribute("insertRole") == "KO"){ %>
	<p> Ruolo Non Aggiunto  </p>
<% } %>
</body>
</html>