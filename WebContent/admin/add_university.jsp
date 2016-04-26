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

		tr:nth-child(even){background-color: #f2f2f2}
		</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add University</title>
</head>
<body>
<%@ include file="../person/header.jsp" %>
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
					<td style="vertical-align: top;"><input name="emphasis1" > </td>
					<td style="vertical-align: top;"><input name="emphasis2" > </td>
					<td style="vertical-align: top;"><input name="emphasis3" > </td>
					<td style="vertical-align: top;"><input name="emphasis4" > </td>
					<td style="vertical-align: top;"><input name="emphasis5" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Add School"
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