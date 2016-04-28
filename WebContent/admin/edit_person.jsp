<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	else
		{
		AdminUI aui = (AdminUI) session.getAttribute("UI");   
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

<style>
		table {
   		 border-collapse: collapse;
  		  width: 100%;
			}

		th, td {
  		  text-align: left;
  		  padding: 8px;
		}

		tr:nth-child(){background-color: #f2f2f2}
		
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

.submit{
  background-color: #A3D6F5;
  border: 2px solid #66A7C5;
  font-size: 20px;
}

.reset{
  background-color: #EE3233;
  border: 2px solid #66A7C5;
  font-size: 20px;
}
.heading-block{
    font-size: 20px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;

	background-color: #66A7C5;
	width:100%;
	padding-top: 10px;
	padding-left:30px;
	padding-right:30px;
	padding-bottom:0px;
	float: left;

	//text-decoration: underline;

}
/*.header{
font-size: 15px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;
	padding: 15px 30px;
	float: right;
}*/

.menuButton{
	background-color: #66A7C5;
	border: none;
	color: #F0ECEB;
	padding: 15px 30px;
	width: 30%;
	text-align: center;
	font-weight: bold; 
	margin: 5px;
}

.header-button{
	background-color: #565B5D;
	border: none;
	color: #F0ECEB;
	padding: 5px 10px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
}

.header-item{
	float:right;
	
}

.header{
	position: relative;
	top: -20px;
	margin-right:50px;
	
}

body{
background-color: #CEEBFB;
padding:0px;
border:0px;
margin:0px;
}

.options{
    font-size: 30px; 
	font-weight: bold;
 	text-align: center;
	color: #565B5D;
}
</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit <%=request.getParameter("username") %></title>
</head>
<body>
<div class="heading-block">

		<div class = "title">Edit <%=request.getParameter("username") %></div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>
<%
	String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("notAUser")){
                out.println("The person you tried to Edit does not exist");
            }
        }
 %>
	<form method="post" action="edit_person_action.jsp" name="edit_person">		<!-- //please dont touch this line it was working before someone changed the action to manage_profile-->
		<table style="text-align: left; width: 266px; height: 228px;"
		border="1" cellpadding="2" cellspacing="2">
			<tbody class = "inputTable">
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
					<td style="vertical-align: top;"><input value="Save" class="submit"
					name="Save" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="vertical-align: top;"><input value="Reset" class="reset"
					name="Reset" type="reset"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
<%}%>