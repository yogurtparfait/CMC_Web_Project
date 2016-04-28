<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
		table {
   		 border-collapse: collapse;
  		  width: 100%;
			}

		th, td {
  		  text-align: left;
  		  padding: 8px;
		}
		
			body{
		background-color: #CEEBFB;
		}
		
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
		
		.save_button{
  		background-color: #32EE93;
 		 border: 2px solid #66A7C5;
 		 font-size: 20px;
		}

		.view_button{
 		 background-color: #EE3233;
 		 border: 2px solid #66A7C5;
 		 font-size: 20px;
		}		

		tr:nth-child(){background-color: #f2f2f2}
		
.heading-block{
    font-size: 20px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;

	background-color: #66A7C5;
	width:100%;
	padding-top: 10px;
	padding-left:30px;
	padding-right:30px;
	padding-bottom:0px;
	float: left;

	//text-decoration: underline;

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

.heading-block{
    font-size: 20px; 
	font-weight: bold;
 	text-align: left;
	color: #565B5D;

	background-color: #66A7C5;
	width:100%;
	padding-top: 10px;
	padding-left:30px;
	padding-right:30px;
	padding-bottom:0px;
	float: left;

	//text-decoration: underline;

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
		</head>
		<body>

<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Search Results</title>
</head>
<body>


<%if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{ %>
<div class="heading-block">

		<div class = "title">Search Results</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>

<%
	List<School> schools = new ArrayList<School>() ;
	schools = (List<School>)session.getAttribute("schoolsFound");
			
	
	
	if(schools==null)
		out.print(" No results found:   <P>Return to<A HREF=\"search.jsp\"> search </A>");
	else{
		
		out.print("<P>Return to<A HREF=\"search.jsp\"> search </A>");
	%>
	</div>
	<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
			cellspacing="2">
			<tbody><%
		for(School s:schools){
		%>
		<tr>
		<td style="vertical-align: top;">
			<form action="save_school_action.jsp" name="saveSchool">&nbsp;&nbsp;&nbsp; 
				<input value="<%=s.getName()%>" type=hidden name=schoolName></input> 
				<input name="save" value = "save" type="submit" class="save_button" ></input>
			</form>
		</td>
		<td style="vertical-align: top;"><%out.println(s.getName()); %><br>
		</td>
		<td style="vertical-align: top;">
			<form action="view_school_with_recommendations.jsp" name="view"> 
				<input value="<%=s.getName()%>" type=hidden name=schoolName></input>
				<input name="view" value = "view" type="submit" class="view_button"></input>
			</form>
		</td>
		</tr>
		<%
		}
%>
</tbody>
</table> <%

	}
}
%>

<form action="save_school_action" name="save" ></form>
&nbsp; <br>


<br>
</body>
</html>