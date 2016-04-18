<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%UserUI ui =(UserUI) session.getAttribute("UI") ;

String schoolName = request.getParameter("schoolName");
String location = request.getParameter("location");
String state = request.getParameter("state");
String control = request.getParameter("control");

double TOPpercentFemale = Double.parseDouble(request.getParameter("percentFemaleTop"));
double BOTpercentFemale = Double.parseDouble(request.getParameter("percentFemaleBottom"));

double TOPSATVerb = Double.parseDouble(request.getParameter("SATVerbalTop"));
double BOTSATVerb = Double.parseDouble(request.getParameter("SATVerbalBottom"));

double TOPSATMath = Double.parseDouble(request.getParameter("SATMathTop"));
double BOTSATMath = Double.parseDouble(request.getParameter("SATMathBottom"));

double TOPexpenses = Double.parseDouble(request.getParameter("expensesTop"));
double BOTexpenses = Double.parseDouble(request.getParameter("expensesBottom"));

double TOPpercentFinancialAid = Double.parseDouble(request.getParameter("financialAidTop"));
double BOTpercentFinancialAid = Double.parseDouble(request.getParameter("financialAidBottom"));

double TOPnumberOfApplicants = Double.parseDouble(request.getParameter("numberOfApplicantsTop"));
double BOTnumberOfApplicants = Double.parseDouble(request.getParameter("numberOfApplicantsBottom"));

double TOPpercentAdmitted = Double.parseDouble(request.getParameter("percentAdmittedTop"));
double BOTpercentAdmitted = Double.parseDouble(request.getParameter("percentAdmittedBottom"));

double TOPpercentEnrolled = Double.parseDouble(request.getParameter("enrolledTop"));
double BOTpercentEnrolled = Double.parseDouble(request.getParameter("enrolledBottom"));

int TOPnumStudents = Integer.parseInt(request.getParameter("numberOfStudentsTop"));
int BOTnumStudents = Integer.parseInt(request.getParameter("numberOfStudentsBot"));

int TOPacademicsScale = Integer.parseInt(request.getParameter("academicsScaleTop"));
int BOTacademicsScale = Integer.parseInt(request.getParameter("academicsScaleBottom"));

int TOPsocialScale = Integer.parseInt(request.getParameter("socialScaleTop"));
int BOTsocialScale = Integer.parseInt(request.getParameter("socialScaleBottom"));

int TOPqualityOfLifeScale = Integer.parseInt(request.getParameter("qualityOfLifeScaleTop"));
int BOTqualityOfLifeScale = Integer.parseInt(request.getParameter("qualityOfLifeScaleBottom"));

String emphasis1 = request.getParameter("emphasis1");
String emphasis2 = request.getParameter("emphasis2");
String emphasis3 = request.getParameter("emphasis3");
String emphasis4 = request.getParameter("emphasis4");

String[] emphases;
if( !(emphasis1==null)) emphases[0] = emphasis1;
if( !(emphasis1==null)) emphases[1] = emphasis2;
if( !(emphasis1==null)) emphases[2] = emphasis3;
if( !(emphasis1==null)) emphases[3] = emphasis4;

ui.search(schoolName, state, location, control, 
		
		BOTnumStudents, BOTpercentFemale, BOTSATVerb, BOTSATMath, BOTexpenses, 
		TOPnumStudents, TOPpercentFemale, TOPSATVerb, TOPSATMath, TOPexpenses, 
		
		BOTpercentFinancialAid, BOTnumberOfApplicants, BOTpercentAdmitted, 
		TOPpercentFinancialAid, TOPnumberOfApplicants, TOPpercentAdmitted, 
		
		BOTpercentEnrolled, BOTacademicsScale, BOTsocialScale, BOTqualityOfLifeScale,
        TOPpercentEnrolled, TOPacademicsScale, TOPsocialScale, TOPqualityOfLifeScale, emphases);

%>
</body>
</html>