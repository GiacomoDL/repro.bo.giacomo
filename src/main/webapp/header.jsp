<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>

 <link rel="stylesheet" href="header.css">

</head>
<body>

 <div class="navbar">
  <a href="user.jsp">User List</a>
  <a href="registration.html">Insert User</a>
<!--   <a href="updateUser.jsp">Modifica Utente</a> -->
  <a href="role.jsp">Role List</a>
  <a href="insertRole.jsp">Insert Role</a>
<!--   <a href="updateRole.jsp">Modifica Ruolo</a> -->
  <a id="right" href="LogoutServlet">Logout</a>
  <span> Welcome <%= session.getAttribute("userLoggedEmail") %> </span>
</div>

<% 
if(request.getAttribute("deleteUser") == "OK"){ %>
	<p> Deleted user </p>
<% } %>
<% 
if(request.getAttribute("deleteUser") == "KO"){ %>
	<p> Unable to delete user </p>
<% } %>

<% 
if(request.getAttribute("deleteRole") == "OK"){ %>
	<p> Deleted role </p>
<% } %>
<% 
if(request.getAttribute("deleteRole") == "KO"){ %>
	<p> Unable to delete role </p>
<% } %>


<% 
if(request.getAttribute("updateUser") == "OK"){ %>
	<p> Updated user</p>
<% } %>
<% 
if(request.getAttribute("updateUser") == "KO"){ %>
	<p> Unable to update user  </p>
<% } %>

<% 
if(request.getAttribute("updateRole") == "OK"){ %>
	<p> Updated role </p>
<% } %>
<% 
if(request.getAttribute("updateRole") == "KO"){ %>
	<p> Unable to update role  </p>
<% } %>

<% 
if(request.getAttribute("insertRole") == "OK"){ %>
	<p> Inserted role </p>
<% } %>
<% 
if(request.getAttribute("insertRole") == "KO"){ %>
	<p> Unable to insert role  </p>
<% } %>
</body>
</html>