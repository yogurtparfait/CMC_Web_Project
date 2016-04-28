<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
}
else
{
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

.title{
    font-size: 20px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;
	text-decoration: underline;
}
.header{
font-size: 15px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;
}

body{
background-color: #CEEBFB;
}

.options{
    font-size: 30px; 
	font-weight: bold;
 	text-align: center;
	color: #565B5D;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class = "title">Admin Menu</div>

</head>
<body>

<div class="header">
<%@ include file="../person/header.jsp" %>
</div>

<div class="options">
<a href = "manage_universities.jsp">Manage Universities</a>
<br>
<a href = "manage_people.jsp">Manage People</a>
</div>

</body>
</html>
<%}%>