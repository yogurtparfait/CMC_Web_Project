<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(!(Boolean) session.getAttribute("isAdmin"))
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}																				// may need else because response redirect in if and later
	AdminUI aui = (AdminUI) session.getAttribute("UI");   
	
	try{
		School school = aui.getSchoolByName(request.getParameter("schoolName"));
		System.out.println("school is null " + school==null);
		System.out.println("school name " + school.getName());
		boolean success = aui.updateSchool(school, school.getName(), 
				request.getParameter("state"), 
				request.getParameter("location"), 
				request.getParameter("control"), 
				Integer.parseInt(request.getParameter("numberOfStudents")), 
				Integer.parseInt(request.getParameter("percentFemale")), 
				Integer.parseInt(request.getParameter("SATVerbal")), 
				Integer.parseInt(request.getParameter("SATMath")), 
				Integer.parseInt(request.getParameter("expenses")), 
				Integer.parseInt(request.getParameter("percentFinancialAid")), 
				Integer.parseInt(request.getParameter("numberOfApplicants")), 
				Integer.parseInt(request.getParameter("percentAdmitted")), 
				Integer.parseInt(request.getParameter("percentEnrolled")), 
				Integer.parseInt(request.getParameter("academicsScale")), 
				Integer.parseInt(request.getParameter("socialScale")), 
				Integer.parseInt(request.getParameter("qualityOfLifeScale")), 
				new String[5]);

		System.out.println("results: "+ success);
		response.sendRedirect("manage_universities.jsp");
	}
	catch(Exception e) //person does not exist //also need to catch addperson exceptions
	{
		response.sendRedirect("manage_universities.jsp?Error=notASchool");
	}
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Saving</title>
</head>
<body>

</body>
</html>