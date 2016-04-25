<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% UserUI ui =(UserUI) session.getAttribute("UI");
String schoolName = request.getParameter("schoolName");
School currentSchool = ui.getSchoolByName(schoolName);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../person/header.jsp" %>
	
	
	<body>

<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;">SCHOOL<br>
</td>
<td style="vertical-align: top;">  
<%out.println(currentSchool.getName());%>
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">STATE<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getState());%>
<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">LOCATION<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getLocation());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">CONTROL<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getControl());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getNumStudents());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FEMALE<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getPercentFemale());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT VERBAL<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getSATVerb());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT MATH<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getSATMath());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EXPENSES<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getExpenses());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FINANCIAL AID<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getPercentFinancialAid());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getNumberOfApplicants());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ADMITTED<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getPercentAdmitted());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ENROLLED<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getPercentEnrolled());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">ACADEMICS SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getAcademicsScale());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SOCIAL SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getSocialScale());%> <br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">QUALITY OF LIFE SCALE(1-5)<br>
</td>
<td style="vertical-align: top;">
<%out.println(currentSchool.getQualityOfLifeScale());%><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EMPHASES<br>
</td>
<td style="vertical-align: top;">
<%String emphase1="";
if (!(currentSchool.getEmphases()[0]==null)){emphase1 = currentSchool.getEmphases()[0];}%>
<%out.println(emphase1);%><br>
<%String emphase2="";
if (!(currentSchool.getEmphases()[1]==null)){emphase2 = currentSchool.getEmphases()[1];}%>
<%out.println(emphase2);%><br>
<%String emphase3="";
if (!(currentSchool.getEmphases()[2]==null)){emphase3 = currentSchool.getEmphases()[2];}%>
<%out.println(emphase3);%><br>
<%String emphase4="";
if (!(currentSchool.getEmphases()[3]==null)){emphase4 = currentSchool.getEmphases()[3];}%>
<%out.println(emphase4);%><br>
</td>
</tr>
</tbody>
</table>
<br>
</body>



</body>
</html>