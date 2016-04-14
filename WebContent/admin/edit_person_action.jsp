<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	AdminUI aui = (AdminUI) session.getAttribute("adminUI");   
	
	try{
		Person person = aui.getPersonByUsername(request.getParameter("username"));
		aui.updatePerson(person, request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("password"), Boolean.parseBoolean(request.getParameter("isAdmin")), person.getIsActive());
		response.sendRedirect("manage_people.jsp");
	}
	catch(Exception e) //person does not exist //need to also take care of update exceptions
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