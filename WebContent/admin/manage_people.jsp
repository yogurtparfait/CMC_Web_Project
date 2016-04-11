<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*%>
    
<% 
	if(!Boolean.parseBoolean((String)session.getAttribute("isAdmin")))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	//AdminUI aui = (AdminUI) session.getAttribute("adminUI");   working on this Megan 
	
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
					Status
				</td>
				<td style="vertical-align: top;">
					
				</td>
			</tr>
			<% %>
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
					Status
				</td>
				<td style="vertical-align: top;">
					
				</td>
			</tr>
			
		</tbody>
	</table>
</body>
</html>