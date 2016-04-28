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
		</style>
		</head>
		<body>

<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>searchResults</title>
</head>
<body>
<div class="title"> Search Results</div>

<%if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{ %>
<div class="header">
<%@ include file="../person/header.jsp" %> 


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