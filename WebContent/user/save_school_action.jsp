<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Saving School</title>
</head>
<body>
<%@ include file="../person/header.jsp" %> 

<%
UserUI ui =(UserUI) session.getAttribute("UI");
String schoolName = request.getParameter("schoolName");
School currentSchool = ui.getSchoolByName(schoolName);
ui.saveSchool(currentSchool);
out.print(" School saved   <P>Return to<A HREF=\"search_results.jsp\"> search results </A>");
%>
</body>
</html>