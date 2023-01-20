<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
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
		document.getElementById("formSelectRole").action = "./DeleteRoleServlet";
		document.getElementById("formSelectRole").method = "post";
		document.getElementById("formSelectRole").submit;
	}
	
	function updateUser() {
		console.log("Update");
		document.getElementById("formSelectRole").action = "./updateRole.jsp";
		document.getElementById("formSelectRole").method = "post";
		document.getElementById("formSelectRole").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
<title>List Roles</title>

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>

	<form id="formSelectRole">
		<table class="roles">
			<tr>
				<th></th>
				<th>Id</th>
				<th>Label</th>
				<th>Description</th>
				<th>Level</th>
			</tr>
			<%
			ArrayList<RoleDto> roles = new ArrayList<RoleDto>();
			roles = RoleService.getInstance().getAllRoles();
			for (RoleDto role : roles) {
				request.setAttribute("id", role.getId());
				
			%>
			<tr>
				<td><input type="radio" name="roleId" onclick="javascript:abilitaBottone();" value="<%out.print(role.getId());%>" /></td>
				<td>
					<%
					out.print(role.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getLabel().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getDescription().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getLevel().toString());
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