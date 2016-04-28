<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	else
	{
		AdminUI aui = (AdminUI) session.getAttribute("UI");   
		Person person = new Person();

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
		table {
   		 border-collapse: collapse;
  		  width: 100%;
			}

		th, td {
  		  text-align: left;
  		  padding: 8px;
		}

		tr:nth-child(even){background-color: #f2f2f2}
		
		body{
		background-color: #CEEBFB;
		}
		
		.title{
 	    font-size: 20px; 
		font-weight: bold;
 		text-align: left;
		color: #565B5D;
		}
		
		.header{
     	font-size: 15px; 
		font-weight: bold;
 	 	text-align: left;
		color: #565B5D;
}
</style>
		</head>
		<body>
		


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class = "title">Edit <%=request.getParameter("username") %></div>

<body>
<div class="header">
<%@ include file="../person/header.jsp" %>
</div>
<%
String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            
        }
 %>
	<form method="post" action="add_person_action.jsp" name="add">
		<table style="text-align: left; width: 266px; height: 228px;"
		border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">First Name: </td>
					<td style="vertical-align: top;"><input name="firstName" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Last Name: </td>
					<td style="vertical-align: top;"><input name="lastName"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;" >Username: </td>
					<td style="vertical-align: top;"><input name="username" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password: </td>
					<td style="vertical-align: top;"><input name="password" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Admin: </td> 
					<td style="vertical-align: top;"><input name="isAdmin" type = "checkbox"></td> 
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
<%}%>