<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Role</title>
</head>
<body>
<%@include file="header.jsp" %>

	<form action="./InsertRoleServlet" method="post">
  		
  		<label>Label</label><br>
  		<input type="text" name="label"><br>
  		
  		<label>Description</label><br>
  		<input type="text" name="description"><br>
	
  		<label>Level</label><br>
  		<input type="number" name="level"><br>
  		
		<input type="submit" id="button" value="Insert">
  		
	</form> 
</body>
</html>