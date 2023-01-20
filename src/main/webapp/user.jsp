<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>

<head>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteUser() {
		console.log("Delete");
		document.getElementById("formSelectUser").action = "./DeleteUserServlet";
		document.getElementById("formSelectUser").method = "post";
		document.getElementById("formSelectUser").submit;
	}
	
	function updateUser() {
		console.log("Update");
		document.getElementById("formSelectUser").action = "./updateUser.jsp";
		document.getElementById("formSelectUser").method = "post";
		document.getElementById("formSelectUser").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
<title>List Users</title>

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>

	<form id="formSelectUser">
		<table class="users">
			<tr>
				<th></th>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
			<%
			ArrayList<UserDto> users = new ArrayList<UserDto>();
			users = UserService.getInstance().getAllUsers();
			for (UserDto user : users) {
				request.setAttribute("id", user.getId());
				
			%>
			<tr>
				<td><input type="radio" name="userId" onclick="javascript:abilitaBottone();" value="<%out.print(user.getId());%>" /></td>
				<td>
					<%
					out.print(user.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getFirstname().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getLastname().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getEmail().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteUser();">
		<input type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateUser();">
	</form>

</body>
</html>