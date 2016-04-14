<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>  //Megan added imports 4-13

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>searchResults</title>
</head>
<body>
<% List<School> schools = request.getParameter("schools");
if(schools.isEmpty())
	out.println("no schools found");
else{
	%>
	<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
			cellspacing="2">
			<tbody><%
	for(School s:schools){
		%>
		<tr>
		<td style="vertical-align: top;">
		<form action="save_school_action.jsp" name="saveSchool">&nbsp;&nbsp;&nbsp;
		Save: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button name="save"></button></form>
		</td>
		<td style="vertical-align: top;"><%out.println(s.getName()); %><br>
		</td>
		<td style="vertical-align: top;">
		<form action="view_School.jsp" name="view">View: <button
		name="view"></button></form>
		</td>
		</tr>
		<%
	}
%>
</tbody>
</table> <%

}
%>

<form action="save_school_action" name="save"></form>
&nbsp; <br>


<br>
</body>
</html>