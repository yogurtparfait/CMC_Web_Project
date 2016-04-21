<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Managing Schools</title>
</head>
<body>
<%@ include file="../person/header.jsp" %> 
<%
UserUI ui =(UserUI) session.getAttribute("UI");
List<School> schools = ui.getSavedSchools();

if(schools==null)
	out.print(" No saved schools:   <P>Return to<A HREF=\"user_menu.jsp\"> menu </A>");
else{
	%>
	
	
	<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
			cellspacing="2">
			<tbody><%}
	for(School s:schools){
		%>
		<tr>
		<td style="vertical-align: top;">
		<form action="remove_saved_school_action.jsp" name="unsaveSchool">&nbsp;&nbsp;&nbsp;
		Remove: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input value="<%=s.getName()%>" type=hidden name=schoolName></input> 
		<input name="remove" type="submit" ></input></form>
		</td>
		<td style="vertical-align: top;"><%out.println(s.getName()); %><br>
		</td>
		<td style="vertical-align: top;">
		<form action="view_School.jsp" name="view">View: <input value="<%=s.getName()%>" type=hidden name=schoolName></input>
		<input
		name="view" type="submit"></input></form>
		</td>
		</tr>
		<%
	}


%>
</body>
</html>