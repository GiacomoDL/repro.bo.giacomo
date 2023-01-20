<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
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

<% UserDto user = UserService.getInstance().selectById(Integer.parseInt(request.getParameter("userId"))); %>
	<form action="./UpdateUserServlet" method="post">
		
	  	<label>ID</label><br>
  		<input type="number" name="id" value="<%= user.getId() %>"><br>
  		
  		<label>First Name</label><br>
  		<input type="text" name="firstname" value="<%= user.getFirstname() %>"><br>
  		
  		<label>Last Name</label><br>
  		<input type="text" name="lastname" value="<%= user.getLastname() %>"><br>
	
  		<label>Email</label><br>
  		<input type="email" name="email" value="<%= user.getEmail() %>"><br>
  		
  		<label>Password</label><br>
  		<input type="password" name="password" value="<%= user.getPassword() %>"><br>
  		
  		<label>Data of Birth</label><br>
  		<input type="date" name="dateofbirth" value="<%= user.getDateofbirth() %>"><br>
  		
  		<label>Registration Date</label><br>
  		<input type="datetime-local" name="regdate" value="<%= user.getRegdate() %>"><br>
  		
  		<label>Role</label><br>
  		<input type="number" name="role" value="<%= user.getRole() %>"><br>
  		
  		<label>Image Path</label><br>
  		<input type="text" name="imgpath" value="<%= user.getImgpath() %>"><br>
  		
  		<label>Note</label><br>
  		<input type="text" name="note" value="<%= user.getNote() %>"><br>
  		
  		<label>Enabled</label><br>
<!-- 		<select name="enabled"> -->
<%-- 			<option <% if(user.getEnabled()) out.print("selected='selected'"); %>value="true">True</option> --%>
<%-- 			<option <% if(!user.getEnabled()) out.print("selected='selected'"); %>value="false">False</option> --%>
<!-- 		</select> -->
<!--   		<br> -->
<!--   		  		<label>Enabled2</label><br> -->
  		<input type="checkbox" name="enabled" <% if(user.getEnabled()) out.print("checked"); %>><br>
  		<br>
  		
  		<input type="submit" id="button" value="Update">
  		
	</form> 

</body>
</html>