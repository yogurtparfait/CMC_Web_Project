<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	AdminUI aui = (AdminUI) session.getAttribute("adminUI");   
	List<Person> people = aui.getPeople();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Manage People</title>
	</head>
<body>


	<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<tr>
				<td style="vertical-align: top;">
					<a href = "add_person.jsp">New Person</a>
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
					
				</td>
				<td style="vertical-align: top;">
					First Name
				</td>
				<td style="vertical-align: top;">
					Last Name
				</td>
				<td style="vertical-align: top;">
					Username
				</td>
				<td style="vertical-align: top;">
					Password
				</td>
				<td style="vertical-align: top;">
					isAdmin
				</td>
				<td style="vertical-align: top;">
					isActive
				</td>
				<td style="vertical-align: top;">
					
				</td>
			</tr>
			<% for (Person p: people){%>
			<tr>
				<td style="vertical-align: top;">
					<form method="post" action="deactivate_activate_person_action.jsp" name="deactivate_activate_person">
						<input value= <%out.println(p.getUsername());%> name = "username" type = "hidden">
						<input value=<%if(p.getIsActive())out.println("deactivate"); 
										else out.println("activate"); %>
										name="activate_deactivate" type="submit">
					</form>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getFirstName()); %>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getLastName()); %>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getUsername()); %>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getPassword()); %>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getIsAdmin()); %>
				</td>
				<td style="vertical-align: top;">
					<%out.println(p.getIsActive()); %>
				</td>
				<td style="vertical-align: top;">
					<form method="post" action="edit_person.jsp" name="edit_person">
						<input value= <%out.println(p.getUsername());%> name = "username" type = "hidden">
						<input value="edit"name="edit" type="submit">
					</form>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>