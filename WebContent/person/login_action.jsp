<%@page language="java" import="controllers.*, entities.*, interfaces.*"%>

<%
	PersonUI pui = new PersonUI();

	try{
		PersonUI newUI = pui.logOn(request.getParameter("Username"),request.getParameter("Password"));
		
		if(newUI instanceof UserUI){
			session.setAttribute("UI", (UserUI) newUI);
			session.setAttribute("isAdmin", false);
			session.setAttribute("currentUsername", request.getParameter("Username"));
			response.sendRedirect("../user/user_menu.jsp");
		}
		else if (newUI instanceof AdminUI){
			session.setAttribute("UI", (AdminUI) newUI);
			session.setAttribute("isAdmin", true);
			session.setAttribute("currentUsername", request.getParameter("Username"));
			response.sendRedirect("../admin/admin_menu.jsp");
		}
	}
	catch(IllegalArgumentException e) 
	{
		if (e.getMessage().equals("Password incorrect")){
			response.sendRedirect("login.jsp?Error=Password"); 
		}
		else if (e.getMessage().equals("Username incorrect")){
			response.sendRedirect("login.jsp?Error=Username");
		}
		else if (e.getMessage().equals("Person is deactivated")){
			response.sendRedirect("login.jsp?Error=Deactivated");
		}
		else {
			response.sendRedirect("login.jsp?Error=Other");
		}
	}
	catch(Exception e)
	{
		response.sendRedirect("login.jsp?Error=OtherException");
	}
%>