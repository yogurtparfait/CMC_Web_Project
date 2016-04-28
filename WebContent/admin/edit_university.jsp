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
</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class = "title">Edit University</div>
</head>
<body>
<div class="header">
<%@ include file="../person/header.jsp" %>
</div>
<%
String anyErrors = request.getParameter("Error");
if(anyErrors!=null){}
School s = aui.getSchoolByName(request.getParameter("schoolName"));
//System.out.println(request.getParameter("schoolName"));
//System.out.println(s==null);
 %>
	<form method="post" action="edit_university_action.jsp" name="add">
		<table style="text-align: left; width: 266px; height: 228px;"
		border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">School Name: </td>
					<td style="vertical-align: top;"><input name="schoolName" readonly value = "<%=s.getName() %>"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">State: </td>
					<td style="vertical-align: top;"><input name="state" value = "<%=s.getState() %>"> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;" >Location: </td>
					<td style="vertical-align: top;"><input name="location" value = <%=s.getLocation() %> > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Control: </td>
					<td style="vertical-align: top;"><input name="control" value = <%=s.getControl() %> > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Number of Students: </td> 
					<td style="vertical-align: top;"><input name="numberOfStudents" value = <%=s.getNumStudents() %>></td> 
				</tr>
				<tr>
					<td style="vertical-align: top;">% Female </td>
					<td style="vertical-align: top;"><input name="percentFemale" value = <%=s.getPercentFemale() %> > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT Verbal </td>
					<td style="vertical-align: top;"><input name="SATVerbal" value = <%=s.getSATVerb() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT Math </td>
					<td style="vertical-align: top;"><input name="SATMath" value = <%=s.getSATMath() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Expenses </td>
					<td style="vertical-align: top;"><input name="expenses" value = <%=s.getExpenses() %> ></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Financial Aid</td>
					<td style="vertical-align: top;"><input name="percentFinancialAid" value = <%=s.getPercentFinancialAid() %> > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Number of Applicants </td>
					<td style="vertical-align: top;"><input name="numberOfApplicants" value = <%=s.getNumberOfApplicants() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Admitted </td>
					<td style="vertical-align: top;"><input name="percentAdmitted" value = <%=s.getPercentAdmitted() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% Enrolled</td>
					<td style="vertical-align: top;"><input name="percentEnrolled" value = <%=s.getPercentEnrolled() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Academics Scale (1-5)</td>
					<td style="vertical-align: top;"><input name="academicsScale" value = <%=s.getAcademicsScale() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Social Scale</td>
					<td style="vertical-align: top;"><input name="socialScale" value = <%=s.getSocialScale() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;"> Quality of Life Scale</td>
					<td style="vertical-align: top;"><input name="qualityOfLifeScale" value = <%=s.getQualityOfLifeScale() %>> </td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Emphases</td>
					<td style="vertical-align: top;"><input name="emphasis1" > 
					<input name="emphasis2" >
					<input name="emphasis3" > 
					<input name="emphasis4" > 
					<input name="emphasis5" > </td>
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Save Changes"
					name="Save" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="vertical-align: top;"><input value="Reset"
					name="Reset" type="reset"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
<%} %>




