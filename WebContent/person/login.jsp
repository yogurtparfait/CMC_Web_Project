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

.header{
	font-size: 50px; 
	font-weight: bold;
 	text-align: center;
	color: #565B5D;
	
}
.moto{
	font-size: 25px; 
	font-weight: bold;
	text-align: center;
	color: #565B5D;
	line-height: 0px;
}

.login_table{
	margin-left: auto;
	margin-right: auto;
	font-weight: bold;
	font-size: 15px; 
	text-align: center;
	color: #565B5D;
	border-style: none;
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

.errors{
    font-size: 15px; 
	text-align: center;
	color: #565B5D;
	line-height: 0px;
}

tr:nth-child(){background-color: #f2f2f2}

</style>

</head>
<body>



<title> Login Form</title>
</head>
<body>
<br>
<div class= "header"> Welcome to CSS!</div>  <br>
<div class= "moto">"You're never too cool for school!"</div>
<br>
<div class="errors">
<%
String anyErrors = request.getParameter("Error");
        if(anyErrors!=null){
            if (anyErrors.equals("Password")){
                out.println("Invalid Password");
            }
            else if (anyErrors.equals("Username")){
                out.println("Invalid Username");
            }            
            else if (anyErrors.equals("Steal")){
            	out.println("Check Steal to take existing session");
            }
            else if (anyErrors.equals("Deactivated")){
            	out.println("You are deactivated. Contact your Administrator regarding your status.");
            }
            else if (anyErrors.equals("Other")){
                out.println("Other Illegal Argument");
            }            
            else if (anyErrors.equals("OtherArgument")){
                out.println("something is badddd");
            }
            else if (anyErrors.equals("notAuthorizedAdmin")){
            	out.println("you have to log in as an Admin to do that");
            }
            else if (anyErrors.equals("notAuthorizedUser")){
            	out.println("you have to log in as a User to do that");
            }
        }
%>
</div>
<form method="post" action="login_action.jsp" name="login"><br>
	<table class ="login_table" style="text-align: left; width: 200px; height: 200x;">
		<tbody>
			<tr>
				<td style="vertical-align: top;">Username<br>
				</td>
				<td style="vertical-align: top;"><input name="Username"> </td>
			</tr>
			<tr>
				<td style="vertical-align: top;">Password<br>
				</td>
				<td style="vertical-align: top;"><input name="Password" type = "password"> </td>
			</tr>
			<tr>

				<td style="vertical-align: top;"><input value="Log in" class="submit_button"
				name="Log in" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td style="vertical-align: top;"><input value="Reset" class="reset_button"
				name="Reset" type="reset"></td>
			</tr>
		</tbody>
	</table>
<br>
</form>
<br>
</body>
</html>