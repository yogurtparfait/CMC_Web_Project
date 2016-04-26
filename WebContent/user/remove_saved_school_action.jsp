<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remove School</title>
</head>
<body>


<% if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{
	UserUI ui =(UserUI) session.getAttribute("UI");
	String schoolName = request.getParameter("schoolName");
	School currentSchool = ui.getSchoolByName(schoolName);
	ui.removeSavedSchool(currentSchool);
	out.print("<P>Return to<A HREF=\"manage_saved_schools.jsp\"> saved schools </A>");
}
%>
</body>
</html>