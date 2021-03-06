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
	List<School> schools = aui.getSchools();
	
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
			text-decoration: underline;
		}
		
		.header{
<<<<<<< HEAD
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
		input[type="submit"], button{
	background-color: #565B5D;
	border: none;
	color: #F0ECEB;
	padding: 5px 10px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
=======
     		font-size: 15px; 
			font-weight: bold;
 	 		text-align: left;
			color: #565B5D;
>>>>>>> branch 'master' of https://github.com/yogurtparfait/CMC_Web_Project.git
}

		.edit_button{
  			background-color: #32EE93;
 			border: 2px solid #66A7C5;
 		 	font-size: 20px;
		}
		
		.table{
	font-size: 15px; 
	border-style: none;
}
		
		
</style>
		</head>
		<body>

		
		
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
</head>
<body>
<div class="heading-block">

		<div class = "title">Manage Universities</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>
	<%
		String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("notASchool")){
            	out.println("You cannot edit a university which does not exist");
            }
        }
    %>
            
	<table class="table" style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="1" cellspacing="1">
		<tbody>
			<tr>
				<td style="vertical-align: top;">
					<a href = "add_university.jsp"><button class=menu-button>New University</button></a>
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">
					School
				</td>
				<td style="vertical-align: top;">
					State
				</td>
				<td style="vertical-align: top;">
					Location
				</td>
				<td style="vertical-align: top;">
					Control
				</td>
				<td style="vertical-align: top;">
					# of Students
				</td>
				<td style="vertical-align: top;">
					% Female
				</td>
				<td style="vertical-align: top;">
					SAT Verbal
				</td>
				<td style="vertical-align: top;">
					SAT Math
				</td>
				<td style="vertical-align: top;">
					Expenses
				</td>
				<td style="vertical-align: top;">
					% with Financial aid
				</td>
				<td style="vertical-align: top;">
					# of Applicants
				</td>
				<td style="vertical-align: top;">
					% Admitted
				</td>
				<td style="vertical-align: top;">
					% Enrolled
				</td>
				<td style="vertical-align: top;">
					Academics Scale(1-5)
				</td>
				<td style="vertical-align: top;">
					Social Scale(1-5)
				</td>
				<td style="vertical-align: top;">
					Quality of Life Scale(1-5)
				</td>
				<td style="vertical-align: top;">
					Edit
				</td>
			</tr>
			<% for (School s: schools){%>
			<tr>
				<td style="vertical-align: top;">
					<%=s.getName() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getState() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getLocation() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getControl() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getNumStudents() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getPercentFemale() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getSATVerb() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getSATMath() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getExpenses() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getPercentFinancialAid() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getNumberOfApplicants() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getPercentAdmitted() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getPercentEnrolled() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getAcademicsScale()%>
				</td>
				<td style="vertical-align: top;">
					<%=s.getSocialScale() %>
				</td>
				<td style="vertical-align: top;">
					<%=s.getQualityOfLifeScale() %>
				</td>
				<td style="vertical-align: top;">
					
					<form method = "get" action = "edit_university.jsp" name = "edit_university">
						<input value = "<%=s.getName() %>" name = "schoolName" type = hidden>
						<input type = submit value = "Edit" name = "edit" class="edit_button">
					</form>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>
<%}%>