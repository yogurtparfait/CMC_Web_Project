<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Viewing School</title>
</head>
<body>
<%@ include file="../person/header.jsp" %>
<body>
<input value="Save" type="submit"><br>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;">SCHOOL<br>
</td>
<td style="vertical-align: top;"><input name="SCHOOL"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">STATE<br>
</td>
<td style="vertical-align: top;"><input name="STATE"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">LOCATION<br>
</td>
<td style="vertical-align: top;"><input name="LOCATION"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">CONTROL<br>
</td>
<td style="vertical-align: top;"><input name="CONTROL"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
</td>
<td style="vertical-align: top;"><input name="NUMBER OF STUDENTS"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FEMALE<br>
</td>
<td style="vertical-align: top;"><input name="% FEMALE"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT VERBAL<br>
</td>
<td style="vertical-align: top;"><input name="SAT VERBAL"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SAT MATH<br>
</td>
<td style="vertical-align: top;"><input name="SAT MATH"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EXPENSES<br>
</td>
<td style="vertical-align: top;"><input name="EXPENSES"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">% FINANCIAL AID<br>
</td>
<td style="vertical-align: top;"><input name="% FINANCIAL AID"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
</td>
<td style="vertical-align: top;"><input
name="NUMBER OF APPLICANTS"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ADMITTED<br>
</td>
<td style="vertical-align: top;"><input name="%ADMITTED"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">%ENROLLED<br>
</td>
<td style="vertical-align: top;"><input name="%ENROLLED"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">ACADEMICS SCALE(1-5)<br>
</td>
<td style="vertical-align: top;"><input
name="ACADEMICS SCALE(1-5)"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">SOCIAL SCALE(1-5)<br>
</td>
<td style="vertical-align: top;"><input name="SOCIAL SCALE(1-5)"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">QUALITY IF LIFE SCALE(1-5)<br>
</td>
<td style="vertical-align: top;"><input
name="QUALITY IF LIFE SCALE(1-5)"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">EMPHASES<br>
</td>
<td style="vertical-align: top;"><input name="EMPHASES"><br>
</td>
</tr>
</tbody>
</table>
<br>
</body>

<%
UserUI ui =(UserUI) session.getAttribute("UI");
String schoolName = request.getParameter("schoolName");
School currentSchool = ui.getSchoolByName(schoolName);
List<School> schools = ui.getRecommendations(currentSchool);

%>

</body>
</html>