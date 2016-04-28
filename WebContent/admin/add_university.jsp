<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	else{
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
/*		input[type="submit"], button{
	background-color: #565B5D;
	border: none;
	color: #F0ECEB;
	padding: 5px 10px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
}*/

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
</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add University</title>
</head>
<body>
<div class="heading-block">

		<div class = "title">Add University</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>
<%
String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            
        }
 %>
	<form method="post" action="add_university_action.jsp" name="add">
		<table style="text-align: left; width: 266px; height: 228px;"
		border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">School Name: </td>
					<td style="vertical-align: top;"><input name="schoolName" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">State: </td>
					<td style="vertical-align: top;"><input name="state"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;" >Location: </td>
					<td style="vertical-align: top;"><input name="location" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Control: </td>
					<td style="vertical-align: top;"><input name="control" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Number of Students: </td> 
					<td style="vertical-align: top;"><input name="numberOfStudents" ></td> 
				</tr>
				<tr>
					<td style="vertical-align: top;">% Female </td>
					<td style="vertical-align: top;"><input name="percentFemale" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT Verbal </td>
					<td style="vertical-align: top;"><input name="SATVerbal" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT Math </td>
					<td style="vertical-align: top;"><input name="SATMath" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Expenses </td>
					<td style="vertical-align: top;"><input name="expenses" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Financial Aid</td>
					<td style="vertical-align: top;"><input name="percentFinancialAid" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Number of Applicants </td>
					<td style="vertical-align: top;"><input name="numberOfApplicants" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Admitted </td>
					<td style="vertical-align: top;"><input name="percentAdmitted" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Enrolled</td>
					<td style="vertical-align: top;"><input name="percentEnrolled" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Academics Scale (1-5)</td>
					<td style="vertical-align: top;"><input name="academicsScale" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Social Scale</td>
					<td style="vertical-align: top;"><input name="socialScale" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;"> Quality of Life Scale</td>
					<td style="vertical-align: top;"><input name="qualityOfLifeScale" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Emphases</td>
					<td style="vertical-align: top;">
					<input name="emphasis0" > 
					<input name="emphasis1" > 
					<input name="emphasis2" > 
					<input name="emphasis3" > 
					<input name="emphasis4" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Add School" class="submit"
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