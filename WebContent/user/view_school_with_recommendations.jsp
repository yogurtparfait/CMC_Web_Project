<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{

	UserUI ui =(UserUI) session.getAttribute("UI");
	String schoolName = request.getParameter("schoolName");
	School currentSchool = ui.getSchoolByName(schoolName);
	List<School> schools = ui.getRecommendations(currentSchool);
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
		
		.save_button{
  		background-color: #32EE93;
 		 border: 2px solid #66A7C5;
 		 font-size: 20px;
		}
		

		tr:nth-child(){background-color: #f2f2f2}
		</style>
		</head>
		<body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View School and Recommendations</title>
</head>
<body>
<div class="title"> View School and Recommendations</div>
<div class="header">
<%@ include file="../person/header.jsp" %>
</div>
	
	
	<body>

<form action="save_school_action.jsp" name="saveSchool">&nbsp;&nbsp;&nbsp;
		<input value="<%=currentSchool.getName()%>" type=hidden name=schoolName></input> 
		<input name="save" value = "save" type="submit" class="save_button"></input></form>

<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;">SCHOOL<br>
</td>
<td style="vertical-align: top;">  
<input value= "<%out.println(currentSchool.getName());%>" name = "SCHOOL" readOnly = "true" >
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">STATE<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getState());%> name = "STATE" readOnly = "true" >
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">LOCATION<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getLocation());%> name = "LOCATION" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">CONTROL<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getControl());%> name = "CONTROL" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getNumStudents());%> name = "NUMBEROFSTUDENT" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FEMALE<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentFemale());%> name = "FEMALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT VERBAL<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSATVerb());%> name = "SATVERBAL" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT MATH<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSATMath());%> name = "SATMATH" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EXPENSES<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getExpenses());%> name = "EXPENSES" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FINANCIAL AID<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentFinancialAid());%> name = "FINANCIALAID" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getNumberOfApplicants());%> name = "NUMBEROFAPPLICANTS" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ADMITTED<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentAdmitted());%> name = "ADMITTED" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ENROLLED<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentEnrolled());%> name = "ENROLLED" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">ACADEMICS SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getAcademicsScale());%> name = "ACADEMICSSCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SOCIAL SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSocialScale());%> name = "SOCIALSCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">QUALITY OF LIFE SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getQualityOfLifeScale());%> name = "QUALITYOFLIFESCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EMPHASES<br>
</td>
<td style="vertical-align: top;">
<%String emphase1="";
if (!(currentSchool.getEmphases()[0]==null)){emphase1 = currentSchool.getEmphases()[0];}%>
<input value= <%out.println(emphase1);%> name = "EMPHASES" readOnly = "true" ><br>
<%String emphase2="";
if (!(currentSchool.getEmphases()[1]==null)){emphase2 = currentSchool.getEmphases()[1];}%>
<input value= <%out.println(emphase2);%> name = "EMPHASES" readOnly = "true" ><br>
<%String emphase3="";
if (!(currentSchool.getEmphases()[2]==null)){emphase3 = currentSchool.getEmphases()[2];}%>
<input value= <%out.println(emphase3);%> name = "EMPHASES" readOnly = "true" ><br>
<%String emphase4="";
if (!(currentSchool.getEmphases()[3]==null)){emphase4 = currentSchool.getEmphases()[3];}%>
<input value= <%out.println(emphase4);%> name = "EMPHASES" readOnly = "true" ><br>
</td>
</tr>
</tbody>
</table>
<br>
</body>

<% 
for(int n = 0; n<5;n++){
currentSchool=schools.get(n);
if(!(currentSchool==null)){
%>
<%out.print("May we also recommend:"); %>


<form action="save_school_action.jsp" name="saveSchool">&nbsp;&nbsp;&nbsp;
		<input value="<%=currentSchool.getName()%>" type=hidden name=schoolName></input> 
		<input name="save" value = "save" type="submit" class="save_button"></input></form>

<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;">SCHOOL<br>
</td>
<td style="vertical-align: top;">  
<input value= "<%out.println(currentSchool.getName());%>" name = "SCHOOL" readOnly = "true" >
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">STATE<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getState());%> name = "STATE" readOnly = "true" >
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">LOCATION<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getLocation());%> name = "LOCATION" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">CONTROL<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getControl());%> name = "CONTROL" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getNumStudents());%> name = "NUMBEROFSTUDENT" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FEMALE<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentFemale());%> name = "FEMALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT VERBAL<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSATVerb());%> name = "SATVERBAL" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT MATH<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSATMath());%> name = "SATMATH" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EXPENSES<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getExpenses());%> name = "EXPENSES" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FINANCIAL AID<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentFinancialAid());%> name = "FINANCIALAID" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getNumberOfApplicants());%> name = "NUMBEROFAPPLICANTS" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ADMITTED<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentAdmitted());%> name = "ADMITTED" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ENROLLED<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getPercentEnrolled());%> name = "ENROLLED" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">ACADEMICS SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getAcademicsScale());%> name = "ACADEMICSSCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SOCIAL SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getSocialScale());%> name = "SOCIALSCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">QUALITY OF LIFE SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<input value= <%out.println(currentSchool.getQualityOfLifeScale());%> name = "QUALITYOFLIFESCALE" readOnly = "true" ><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EMPHASES<br>
</td>
<td style="vertical-align: top;">
<%emphase1="";
if (!(currentSchool.getEmphases()[0]==null)){emphase1 = currentSchool.getEmphases()[0];}%>
<input value= <%out.println(emphase1);%> name = "EMPHASES" readOnly = "true" ><br>
<%emphase2="";
if (!(currentSchool.getEmphases()[1]==null)){emphase2 = currentSchool.getEmphases()[1];}%>
<input value= <%out.println(emphase2);%> name = "EMPHASES" readOnly = "true" ><br>
<%emphase3="";
if (!(currentSchool.getEmphases()[2]==null)){emphase3 = currentSchool.getEmphases()[2];}%>
<input value= <%out.println(emphase3);%> name = "EMPHASES" readOnly = "true" ><br>
<%emphase4="";
if (!(currentSchool.getEmphases()[3]==null)){emphase4 = currentSchool.getEmphases()[3];}%>
<input value= <%out.println(emphase4);%> name = "EMPHASES" readOnly = "true" ><br>
</td>
</tr>
</tbody>
</table>
<br>
</body>
<% }}%>

</body>
</html>

<%}%>