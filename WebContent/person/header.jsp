<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<%

	PersonUI pui = (PersonUI) session.getAttribute("UI");
	String username = (String) session.getAttribute("currentUsername");
	
%>
<div class = "menu-bar-status header-item">
	<%=username%>
</div>
<div class = header-item>
	<a href="../person/logout_action.jsp"><button class = "header-button">Log out</button></a>
</div>
<div class = header-item>
	<a href="
		<%
			if((Boolean)session.getAttribute("isAdmin"))
			{
				out.println("admin_menu.jsp");
			}
			else{
				out.println("user_menu.jsp");
			}
		%>
	">
		<button class = "header-button">Menu</button>
	</a>
</div>

<!--  <style>
	input{
	border:none;
	}
	input[disabled=true] {
    background-color: #CEEBFB;
}
</style>-->