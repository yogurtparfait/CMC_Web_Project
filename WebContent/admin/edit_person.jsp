<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	AdminUI aui = (AdminUI) session.getAttribute("adminUI");   
	Person person = new Person();
	try{
		person = aui.getPersonByUsername(request.getParameter("username"));
	}
	catch(Exception e) //person does not exist
	{
		response.sendRedirect("manage_people.jsp?Error=notAPerson");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit <%=request.getParameter("username") %></title>
</head>
<body>
<%
String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("notAUser")){
                out.println("The person you tried to Edit does not exist");
            }
        }
 %>
	<form method="post" action="edit_person_action.jsp" name="edit">
		<table style="text-align: left; width: 266px; height: 228px;"
		border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">First Name: </td>
					<td style="vertical-align: top;"><input name="firstName" value="<%=person.getFirstName()%>" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Last Name: </td>
					<td style="vertical-align: top;"><input name="lastName" value="<%=person.getLastName()%>"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;" >Username: </td>
					<td style="vertical-align: top;"><input name="username" value="<%=person.getUsername()%>" readonly> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password: </td>
					<td style="vertical-align: top;"><input name="password" value="<%=person.getPassword()%>"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Admin: </td> 
					<td style="vertical-align: top;"><input name="isAdmin" type = "checkbox" value = "<%=person.getIsAdmin()%>"></td> 
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Save"
					name="Save" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="vertical-align: top;"><input value="Reset"
					name="Reset" type="reset"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>