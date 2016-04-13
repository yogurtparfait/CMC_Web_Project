<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	AdminUI aui = (AdminUI) session.getAttribute("adminUI");   
	Person person = new Person();
	try{
		person = aui.getPersonByUsername(request.getParameter("username"));
	}
	catch(Exception e) //person does not exist
	{
		response.sendRedirect("manage_people.jsp?Error=notAPerson");
	}
	System.out.println("person is not null" + person!=null);
	System.out.println("isAdmin not null" + person.getIsAdmin()!=null);
	aui.updatePerson(person, request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("password"), "type");// Currently throwing nullPointer
	//aui.updatePerson(person, "firstname","lastname","password", "a");
	response.sendRedirect("manage_people.jsp");
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