<html>
<head>

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
            else if (anyErrors.equals("Other")){
                out.println("Other Illegal Argument");
            }            
            else if (anyErrors.equals("OtherArgument")){
                out.println("something is badddd");
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
<td style="vertical-align: top;"><input name="Password"> </td>
</tr>
<tr>
<td style="vertical-align: top;">Steal<br>
</td>
<td style="vertical-align: top;"><input name="Steal"> </td>
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