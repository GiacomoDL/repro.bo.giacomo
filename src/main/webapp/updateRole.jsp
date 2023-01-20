<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
<%@page import="proxima.informatica.academy.DatabaseManagerSingleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp" %>

<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
</head>
<body>
<%@include file="header.jsp" %>

<% RoleDto role = RoleService.getInstance().selectById(Integer.parseInt(request.getParameter("roleId"))); %>
	<form action="./UpdateRoleServlet" method="post">
		
	  	<label>ID</label><br>
  		<input type="number" name="id" value="<%= role.getId() %>"><br>
  		
  		<label>First Name</label><br>
  		<input type="text" name="label" value="<%= role.getLabel() %>"><br>
  		
  		<label>Last Name</label><br>
  		<input type="text" name="description" value="<%= role.getDescription() %>"><br>
	
  		<label>Email</label><br>
  		<input type="number" name="level" value="<%= role.getLevel() %>"><br>
  		
		<input type="submit" id="button" value="Update">
  		
	</form> 

</body>
</html>