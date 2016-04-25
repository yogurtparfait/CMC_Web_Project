<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
    <% 
    
    if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
	}
	else{
  
		UserUI uui = (UserUI) session.getAttribute("UI");   
		
		try{
			User user = uui.getUser();
			
			String firstname = user.getFirstName();
			if(!(request.getParameter("firstname")==null))
			firstname = request.getParameter("firstname");
			
			String lastname = user.getLastName();
			if(!(request.getParameter("lastname")==null))
			lastname = request.getParameter("lastname");
			
			String password = user.getPassword();
			if(!(request.getParameter("password")==null))
			password = request.getParameter("password");
			
			user.setFirstName(firstname);
			user.setLastName(lastname);
			user.setPassword(password);
			
			uui.UpdateUser(firstname,lastname,password);
			session.setAttribute("UI",new UserUI(user));
			response.sendRedirect("manage_profile.jsp");
		}
		catch(Exception e) //person does not exist //need to also take care of update exceptions
		{
			response.sendRedirect("manage_profile.jsp?Error=notAUser");
		}
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