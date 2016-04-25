<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
    
    <% 
	if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
	}
	else{
		//UserUI uui = (UserUI) session.getAttribute("UI");   
		//Person person = new Person();

	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Menu</title>
</head>
<body>
<%@ include file="../person/header.jsp" %>
<a href = "search.jsp">Search for Schools</a>
<br>
<a href = "manage_saved_schools.jsp">Manage My Saved Schools</a>
<br>
<a href = "manage_profile.jsp">Manage My Profile</a>
</body>
</html>
<% } %>