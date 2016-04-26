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

tr:nth-child(even){background-color: #f2f2f2}
</style>
</head>
<body>

<h2>Striped Table</h2>
<p>For zebra-striped tables, use the nth-child() selector and add a background-color to all even (or odd) table rows:</p>


<title>Login Form</title>
</head>
<body>
<br>
Login form:<br>
<br>
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
<form method="post" action="login_action.jsp" name="login"><br>
	<table style="text-align: left; width: 266px; height: 228px;"
	border="1" cellpadding="2" cellspacing="2">
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

				<td style="vertical-align: top;"><input value="Log in"
				name="Log in" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td style="vertical-align: top;"><input value="Reset"
				name="Reset" type="reset"></td>
			</tr>
		</tbody>
	</table>
<br>
</form>
<br>
</body>
</html>