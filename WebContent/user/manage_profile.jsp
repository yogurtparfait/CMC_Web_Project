<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
			body{
		background-color: #CEEBFB;
		}
		
			
		.title{
    		font-size: 20px; 
			font-weight: bold;
 			text-align: left;
			color: #565B5D;
			text-decoration: underline;
	}
		
		.header{
    		font-size: 15px; 
			font-weight: bold;
 			text-align: left;
			color: #565B5D;
		}
		
		.editUser_button{
  			background-color: #32EE93;
 			border: 2px solid #66A7C5;
 		 	font-size: 20px;
		}

		.reset_button{
  			background-color: #EE3233;
 			border: 2px solid #66A7C5;
 			font-size: 20px;
		}		

		tr:nth-child(){background-color: #f2f2f2}
		</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View/Edit Profile</title>
</head>
<body>
<div class="title"> Edit Profile</div>
<%
if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{
%>

<div class="header">
<%@ include file="../person/header.jsp" %>
</div>
<% 



	UserUI uui = (UserUI) session.getAttribute("UI"); 
	
	User user = uui.getUser();
%>
<form method="post" action="edit_profile_action.jsp" name="edit_profile_action">
<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="4">
		<tbody>
			<tr>
				<td style="vertical-align: top;">
					FirstName
				</td>
				<td style="vertical-align: top;">
					<input value= <%out.println(user.getFirstName());%> name = "firstname" >
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
				LastName
				</td>
				<td style="vertical-align: top;">
				<input value= <%out.println(user.getLastName());%> name = "lastname" >
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
				Username
				</td>
				<td style="vertical-align: top;">
				<input value= <%out.println(user.getUsername());%> name = "username" readOnly = "true" >
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
				Password
				</td>
				<td style="vertical-align: top;">
				<input value= <%out.println(user.getPassword());%> name = "password"  >
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
				Is an Admin?
				</td>
				<td style="vertical-align: top;">
				<input value= <%out.println(user.getIsAdmin());%> name = "type" readOnly = "true" >
				</td>
			</tr>
			
			<tr>
					<td style="vertical-align: top;"><input value="EditUser" class="editUser_button"
					name="EditUser" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="vertical-align: top;"><input value="Reset" class="reset_button"
					name="Reset" type="reset"></td>
				</tr>
<%}%>
</body>
</table>
</form>
</html>