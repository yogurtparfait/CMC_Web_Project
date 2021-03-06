<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(session.getAttribute("isAdmin")==null || (Boolean) session.getAttribute("isAdmin"))
{
	response.sendRedirect("../person/login.jsp?Error=notAuthorizedUser");
}
else{
%>
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
		
		.submit_button{
  		background-color: #A3D6F5;
 		 border: 2px solid #66A7C5;
 		 font-size: 20px;
		}

		.reset_button{
 		 background-color: #EE3233;
 		 border: 2px solid #66A7C5;
 		 font-size: 20px;
		}		

		tr:nth-child()){background-color: #f2f2f2}
		
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
<title>search</title>
</head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
</head>
<body>
	<div class="heading-block">

		<div class = "title">User Menu</div>


		<div class="header">
			<%@ include file="../person/header.jsp" %>
		</div>
	</div>

<div style="text-align: left;">
<form action="search_action.jsp" name="SEARCH_FIELD">
<div style="text-align: right;"><span
style="text-decoration: underline;"></span><br>
<div style="text-align: left;">
<table style="text-align: left; width: 100%;" border="1"
cellpadding="2" cellspacing="2">
<tbody>
<tr>
<td style="vertical-align: top;">by SCHOOL NAME<br>
</td>
<td style="vertical-align: top;">contains <input
name="schoolName"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by STATE<br>
</td>
<td style="vertical-align: top;">contains <input name="state"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by LOCATION<br>
</td>
<td style="vertical-align: top;"><input name="location">(SUBURBAN,
URBAN, SMALL-CITY or -1 for UNKNOWN)<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by CONTROL<br>
</td>
<td style="vertical-align: top;"><input name="control">(PRIVATE,
STATE, CITY or -1 for UNKNOWN)<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by NUMBER OF STUDENTS<br>
</td>
<td style="vertical-align: top;">between <input
name="numberOfStudentsBottom"> and <input name="numberOfStudentsTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by % FEMALE<br>
</td>
<td style="vertical-align: top;">between <input
name="percentFemaleBottom"> and <input name="percentFemaleTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by SAT VERBAL<br>
</td>
<td style="vertical-align: top;">between <input
name="SATVerbalBottom"> and <input name="SATVerbalTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by SAT MATH<br>
</td>
<td style="vertical-align: top;">between <input
name="SATMathBottom"> and <input name="SATMathTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by EXPENSES<br>
</td>
<td style="vertical-align: top;">between <input
name="expensesBottom"> and <input name="expensesTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by % FINANCIAL AID<br>
</td>
<td style="vertical-align: top;">between <input
name="financialAidBottom"> and <input name="financialAidTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by NUMBER OF APPLICANTS<br>
</td>
<td style="vertical-align: top;">between <input
name="numberOfApplicantsBottom"> and <input
name="numberOfApplicantsTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by % ADMITTED<br>
</td>
<td style="vertical-align: top;">between <input
name="percentAdmittedBottom"> and <input name="percentAdmittedTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by % ENROLLED<br>
</td>
<td style="vertical-align: top;">between <input
name="enrolledBottom"> and <input name="enrolledTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by ACADEMICS SCALE (1-5)<br>
</td>
<td style="vertical-align: top;">between <input
name="academicsScaleBottom"> and <input name="academicsScaleTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by SOCIAL SCALE (1-5)</td>
<td style="vertical-align: top;">between <input
name="socialScaleBottom"> and <input name="socialScaleTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by QUALITY OF LIFE SCALE (1-5)</td>
<td style="vertical-align: top;">between <input
name="qualityOfLifeScaleBottom"> and <input
name="qualityOfLifeScaleTop"><br>
</td>
</tr>
<tr>
<td style="vertical-align: top;">by EMPHASES<br>
</td>
<td style="vertical-align: top;">contains either<br>
&nbsp;<input name="emphasis1"><br>
&nbsp;<input name="emphasis2"><br>
&nbsp;<input name="emphasis3"><br>
&nbsp;<input name="emphasis4"><br>
</td>
</tr>
<tr>						
				<td style="vertical-align: top;"><input value="Search for Schools" class=submit_button
				name="search" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td style="vertical-align: top;"><input value="Reset" class="reset_button"
				name="Reset" type="reset"></td>
</tr>
</tbody>
</table>
</div>
</div>



</form>
<div style="text-align: left;">
</div>
</div>
<br>
<br>
</div>
</body>
</html>
<%}%>