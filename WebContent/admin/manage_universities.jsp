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
<div class = "title">Manage Universities</div>
	</head>
<body>
<div class="header">
	<%@ include file="../person/header.jsp" %>
	</div>
	<%
		String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("notASchool")){
            	out.println("You cannot edit a university which does not exist");
            }
        }
    %>
            
	<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<tr>
				<td style="vertical-align: top;">
					<a href = "add_university.jsp">New University</a>
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
						<input type = submit value = "Edit" name = "edit">
					</form>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>
<%}%>