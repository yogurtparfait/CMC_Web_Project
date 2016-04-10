<%@page language="java" import="controllers.*, entities.*, interfaces.*"%>

<%
	PersonUI pui = new PersonUI();

	try{
		PersonUI newUI = pui.logOn(request.getParameter("Username"),request.getParameter("Password"), Boolean.parseBoolean(request.getParameter("Steal")));
		
		if(newUI instanceof UserUI){
			session.setAttribute("userUI", (UserUI) newUI);
			session.setAttribute("isAdmin", false);
			response.sendRedirect("./user/user_menu.jsp");
		}
		else if (newUI instanceof AdminUI){
			session.setAttribute("adminUI", (AdminUI) newUI);
			session.setAttribute("isAdmin", true);
			response.sendRedirect("./admin/admin_menu.jsp");
		}
	}
	catch(IllegalArgumentException e) //
	{
		response.sendRedirect("login.jsp"); //add error here somehow for when invalid login
		
	}
%>