<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
//This page is not working correctly because active/deactivated attribute is not fully and consistently implemented


	if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))	
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}
	else
	{

		AdminUI aui = (AdminUI) session.getAttribute("UI");   
		Person person = new Person();
		try{
			person = aui.getPersonByUsername(request.getParameter("usernameForDeactivate"));
			try {
				aui.changeStatus(person);
				response.sendRedirect("manage_people.jsp");
			}
			catch(IllegalArgumentException e) //cannot deactivate or activate yourself
			{
				response.sendRedirect("manage_people.jsp?Error=attemptedSelfStatusChange");
			}
		}
		catch(Exception e) //person does not exist
		{
			e.printStackTrace();
			response.sendRedirect("manage_people.jsp?Error=notAPerson");
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Updating...</title>
</head>
<body>

</body>
</html>