<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}																				// may need else because response redirect in if and later
	AdminUI aui = (AdminUI) session.getAttribute("UI");   
	Person person = new Person();
	try{
		person = aui.getPersonByUsername(request.getParameter("username"));
		aui.addPerson(request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("password"), request.getParameter("username"), 
				Boolean.parseBoolean(request.getParameter("isAdmin"))); 
		response.sendRedirect("manage_people.jsp");
	}
	catch(Exception e) //person does not exist //also need to catch addperson exceptions
	{
		response.sendRedirect("manage_people.jsp?Error=notAPerson");
	}
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Saving</title>
</head>
<body>

</body>
</html>