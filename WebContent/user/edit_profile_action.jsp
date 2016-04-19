<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
    <% 
	if((Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
	}
    
	UserUI uui = (UserUI) session.getAttribute("UI");   
	
	try{
		User user = uui.getUser();
		String firstname = user.getFirstName();
		String lastname = user.getLastName();
		String password = user.getPassword();
		uui.UpdateUser(firstname,lastname,password);
		response.sendRedirect("manage_profile.jsp");
	}
	catch(Exception e) //person does not exist //need to also take care of update exceptions
	{
		response.sendRedirect("manage_people.jsp?Error=notAUser");
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