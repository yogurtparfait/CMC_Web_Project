<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
    
<% 
	if(session.getAttribute("isAdmin")==null || !(Boolean) session.getAttribute("isAdmin"))	
	{
		response.sendRedirect("../person/login.jsp?Error=notAuthorizedAdmin");
	}		// may need else because response redirect in if and later
	else
	{
		AdminUI aui = (AdminUI) session.getAttribute("UI");   
		
		try{
			School school = aui.getSchoolByName(request.getParameter("schoolName"));
			System.out.println("school is null " + school==null);
			System.out.println("school name " + school.getName());
			
			String[] emphases = {
			 		request.getParameter("emphasis0"),
			 		request.getParameter("emphasis1"),
			 		request.getParameter("emphasis2"),
			 		request.getParameter("emphasis3"),
			 		request.getParameter("emphasis4")};
			for (String emphasis:emphases)
				System.out.println("Saving " + emphasis + " as emphasis");
			
			boolean success = aui.updateSchool(school, 
					school.getName(), 			
					request.getParameter("state"), 
					request.getParameter("location"), 
					request.getParameter("control"), 
					Integer.parseInt(request.getParameter("numberOfStudents")), 
					Double.parseDouble(request.getParameter("percentFemale")), 
					Double.parseDouble(request.getParameter("SATVerbal")), 
					Double.parseDouble(request.getParameter("SATMath")), 
					Double.parseDouble(request.getParameter("expenses")), 
					Double.parseDouble(request.getParameter("percentFinancialAid")), 
					Integer.parseInt(request.getParameter("numberOfApplicants")), 
					Double.parseDouble(request.getParameter("percentAdmitted")), 
					Double.parseDouble(request.getParameter("percentEnrolled")), 
					Integer.parseInt(request.getParameter("academicsScale")), 
					Integer.parseInt(request.getParameter("socialScale")), 
					Integer.parseInt(request.getParameter("qualityOfLifeScale")), 
					new String[]{
				 		request.getParameter("emphasis0"),
				 		request.getParameter("emphasis1"),
				 		request.getParameter("emphasis2"),
				 		request.getParameter("emphasis3"),
				 		request.getParameter("emphasis4")
					});
	
			System.out.println("results: "+ success);
			response.sendRedirect("manage_universities.jsp");
		}
		catch(Exception e) //person does not exist //also need to catch addperson exceptions
		{
			response.sendRedirect("manage_universities.jsp?Error=notASchool");
		}
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