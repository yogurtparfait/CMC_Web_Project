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
	String currentUsername = aui.getCurrentUsername();
	List<Person> people = aui.getPeople();
	

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

input[type="submit"], button{
	background-color: #565B5D;
	border: none;
	color: #F0ECEB;
	padding: 5px 10px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
}

input[type=submit]:disabled {
    background-color: #a5a9ab;
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
		
		
		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
</head>
<body>
	<div class="heading-block">

		<div class = "title">Manage People</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>
	<%
		String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("attemptedSelfStatusChange")){
                out.println("You cannot change your own status");
            }
            if (anyErrors.equals("notAPerson")){
            	out.println("You cannot edit or change the status of a person who does not exist");
            }
        }
    %>
            
	<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<tr>
				<td style="vertical-align: top;">
					<a href = "add_person.jsp"><button class = menu-button>New Person</button></a>
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
						<input value= <%out.println(p.getUsername());%> name = "usernameForDeactivate" type = "hidden">
						<input value=<%if(p.getIsActive())
											out.println("deactivate"); 
										else 
											out.println("activate");%> 
										<%if (p.getUsername().equals(currentUsername))
											out.println("disabled");%> 
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
					<form method="get" action="edit_person.jsp" name="edit_person">
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
<%}%>