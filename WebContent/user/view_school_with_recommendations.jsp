<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Viewing School</title>
</head>
<body>
<%
UserUI ui =(UserUI) session.getAttribute("UI");
String schoolName = request.getParameter("schoolName");
School currentSchool = ui.getSchoolByName(schoolName);
List<School> schools = ui.getRecommendations(currentSchool);

%>
</body>
</html>