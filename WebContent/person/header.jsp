<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<%

	PersonUI pui = (PersonUI) session.getAttribute("UI");
	String username = pui.getCurrentUsername();
	
%>
<div>
	Logged in as: <%=username%>
</div>
<div>
	<a href="../person/logout_action.jsp">Log out</a>
</div>