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

.heading-block{
    font-size: 20px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;
<<<<<<< HEAD
	background-color: #66A7C5;
	width:100%;
	padding-top: 10px;
	padding-left:30px;
	padding-right:30px;
	padding-bottom:0px;
	float: left;
=======
	text-decoration: underline;
>>>>>>> branch 'master' of https://github.com/yogurtparfait/CMC_Web_Project.git
}
/*.header{
font-size: 15px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;
	padding: 15px 30px;
	float: right;
}*/

.menuButton{
	background-color: #66A7C5;
	border: none;
	color: #F0ECEB;
	padding: 15px 30px;
	width: 30%;
	text-align: center;
	font-weight: bold; 
	margin: 5px;
}

.header-button{
	background-color: #565B5D;
	border: none;
	color: #F0ECEB;
	padding: 5px 10px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
}

.header-item{
	float:right;
	
}

.header{
	position: relative;
	top: -20px;
	margin-right:50px;
	
}

body{
background-color: #CEEBFB;
padding:0px;
border:0px;
margin:0px;
}

.options{
    font-size: 30px; 
	font-weight: bold;
 	text-align: center;
	color: #565B5D;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Menu</title>
</head>
<body>
	<div class="heading-block">

		<div class = "title">Admin Menu</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>

	<div class="options">
		<a href = "manage_universities.jsp"><button class = "menuButton" >Manage Universities</button></a>
		<a href = "manage_people.jsp"><button class = "menuButton">Manage People</button></a>
	</div>

</body>
</html>
<%}%>