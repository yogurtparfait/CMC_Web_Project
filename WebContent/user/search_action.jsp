<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controllers.*, entities.*, interfaces.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>search</title>
</head>
<body>
<%//UserUI ui =(UserUI) session.getAttribute("UI") ; uncomment when running from ui!!!
User u = new User();
UserUI ui = new UserUI(u);

String schoolName = "";
if(!(request.getParameter("schoolName")==null))
schoolName = request.getParameter("schoolName");
String location = "";
if(!(request.getParameter("location")==null))
location = (String)request.getParameter("location");
String state = "";
if(!(request.getParameter("state")==null))
state = request.getParameter("state");
String control = "";
if(!(request.getParameter("control")==null))
control = request.getParameter("control");

double TOPpercentFemale = -1;
if(!(request.getParameter("percentFemaleTop")==null)){
	if(!(request.getParameter("percentFemaleTop")==""))
TOPpercentFemale = Double.parseDouble(request.getParameter("percentFemaleTop"));}
double BOTpercentFemale = -1;
if(!(request.getParameter("percentFemaleBottom")==null)){
	if(!(request.getParameter("percentFemaleBottom")==""))
BOTpercentFemale = Double.parseDouble(request.getParameter("percentFemaleBottom"));}

double TOPSATVerb = -1;
if(!(request.getParameter("SATVerbalTop")==null)){
	if(!(request.getParameter("SATVerbalTop")==""))
TOPSATVerb = Double.parseDouble(request.getParameter("SATVerbalTop"));}
double BOTSATVerb = -1;
if(!(request.getParameter("SATVerbalBottom")==null)){
	if(!(request.getParameter("SATVerbalBottom")==""))
BOTSATVerb = Double.parseDouble(request.getParameter("SATVerbalBottom"));}

double TOPSATMath = -1;
if(!(request.getParameter("SATMathTop")==null)){
	if(!(request.getParameter("SATMathTop")==""))
TOPSATMath = Double.parseDouble(request.getParameter("SATMathTop"));}
double BOTSATMath = -1;
if(!(request.getParameter("SATMathBottom")==null)){
	if(!(request.getParameter("SATMathBottom")==""))
BOTSATMath = Double.parseDouble(request.getParameter("SATMathBottom"));}

double TOPexpenses = -1;
if(!(request.getParameter("expensesTop")==null)){
	if(!(request.getParameter("expensesTop")==""))
TOPexpenses = Double.parseDouble(request.getParameter("expensesTop"));}
double BOTexpenses = -1;
if(!(request.getParameter("expensesBottom")==null)){
	if(!(request.getParameter("expensesBottom")==""))
BOTexpenses = Double.parseDouble(request.getParameter("expensesBottom"));}

double TOPpercentFinancialAid = -1;
if(!(request.getParameter("financialAidTop")==null)){
	if(!(request.getParameter("financialAidTop")==""))
TOPpercentFinancialAid = Double.parseDouble(request.getParameter("financialAidTop"));}
double BOTpercentFinancialAid = -1;
if(!(request.getParameter("financialAidBottom")==null)){
	if(!(request.getParameter("financialAidBottom")==""))
BOTpercentFinancialAid = Double.parseDouble(request.getParameter("financialAidBottom"));}

int TOPnumberOfApplicants = -1;
if(!(request.getParameter("numberOfApplicantsTop")==null)){
	if(!(request.getParameter("numberOfApplicantsTop")==""))
TOPnumberOfApplicants = Integer.parseInt(request.getParameter("numberOfApplicantsTop"));}
int BOTnumberOfApplicants = -1;
if(!(request.getParameter("numberOfApplicantsBottom")==null)){
	if(!(request.getParameter("numberOfApplicantsBottom")==""))
BOTnumberOfApplicants = Integer.parseInt(request.getParameter("numberOfApplicantsBottom"));}

double TOPpercentAdmitted = -1;
if(!(request.getParameter("percentAdmittedTop")==null)){
	if(!(request.getParameter("percentAdmittedTop")==""))
TOPpercentAdmitted = Double.parseDouble(request.getParameter("percentAdmittedTop"));}
double BOTpercentAdmitted = -1;
if(!(request.getParameter("percentAdmittedBottom")==null)){
	if(!(request.getParameter("percentAdmittedBottom")==""))
BOTpercentAdmitted = Double.parseDouble(request.getParameter("percentAdmittedBottom"));}

double TOPpercentEnrolled = -1;
if(!(request.getParameter("enrolledTop")==null)){
	if(!(request.getParameter("enrolledTop")==""))
TOPpercentEnrolled = Double.parseDouble(request.getParameter("enrolledTop"));}
double BOTpercentEnrolled = -1;
if(!(request.getParameter("enrolledBottom")==null)){
	if(!(request.getParameter("enrolledBottom")==""))
BOTpercentEnrolled = Double.parseDouble(request.getParameter("enrolledBottom"));}

int TOPnumStudents = -1;
if(!(request.getParameter("numberOfStudentsTop")==null)){
	if(!(request.getParameter("numberOfStudentsTop")==""))
TOPnumStudents = Integer.parseInt(request.getParameter("numberOfStudentsTop"));}
int BOTnumStudents = -1;
if(!(request.getParameter("numberOfStudentsBot")==null)){
	if(!(request.getParameter("numberOfStudentsBot")==""))
BOTnumStudents = Integer.parseInt(request.getParameter("numberOfStudentsBot"));}

int TOPacademicsScale  = -1;
if(!(request.getParameter("academicsScaleTop")==null)){
	if(!(request.getParameter("academicsScaleTop")==""))
TOPacademicsScale = Integer.parseInt(request.getParameter("academicsScaleTop"));}
int BOTacademicsScale  = -1;
if(!(request.getParameter("academicsScaleBottom")==null)){
	if(!(request.getParameter("academicsScaleBottom")==""))
BOTacademicsScale = Integer.parseInt(request.getParameter("academicsScaleBottom"));}

int TOPsocialScale = -1;
if(!(request.getParameter("socialScaleTop")==null)){
	if(!(request.getParameter("socialScaleTop")==""))
TOPsocialScale = Integer.parseInt(request.getParameter("socialScaleTop"));}
int BOTsocialScale = -1;
if(!(request.getParameter("socialScaleBottom")==null)){
	if(!(request.getParameter("socialScaleBottom")==""))
BOTsocialScale = Integer.parseInt(request.getParameter("socialScaleBottom"));}

int TOPqualityOfLifeScale = -1;
if(!(request.getParameter("qualityOfLifeScaleTop")==null)){
	if(!(request.getParameter("qualityOfLifeScaleTop")==""))
TOPqualityOfLifeScale = Integer.parseInt(request.getParameter("qualityOfLifeScaleTop"));}
int BOTqualityOfLifeScale = -1;
if(!(request.getParameter("qualityOfLifeScaleBottom")==null)){
	if(!(request.getParameter("qualityOfLifeScaleBottom")==""))
BOTqualityOfLifeScale = Integer.parseInt(request.getParameter("qualityOfLifeScaleBottom"));}

String emphasis1 = "";
if(!(request.getParameter("emphasis1")==null)){
	if(!(request.getParameter("emphasis1")==""))
emphasis1 = request.getParameter("emphasis1");}
String emphasis2 = "";
if(!(request.getParameter("emphasis2")==null)){
	if(!(request.getParameter("emphasis2")==""))
emphasis2 = request.getParameter("emphasis2");}
String emphasis3 = "";
if(!(request.getParameter("emphasis3")==null)){
	if(!(request.getParameter("emphasis3")==""))
emphasis3 = request.getParameter("emphasis3");}
String emphasis4 = "";
if(!(request.getParameter("emphasis4")==null)){
	if(!(request.getParameter("emphasis4")==""))
emphasis4 = request.getParameter("emphasis4");}

String[] emphases = new String[4];
emphases[0] = emphasis1;
emphases[1] = emphasis2;
emphases[2] = emphasis3;
emphases[3] = emphasis4;

List<School> schoolsFound = new ArrayList<School>() ;

schoolsFound = ui.search(schoolName, state, location, control, 
		
		BOTnumStudents, BOTpercentFemale, BOTSATVerb, BOTSATMath, BOTexpenses, 
		TOPnumStudents, TOPpercentFemale, TOPSATVerb, TOPSATMath, TOPexpenses, 
		
		BOTpercentFinancialAid, BOTnumberOfApplicants, BOTpercentAdmitted, 
		TOPpercentFinancialAid, TOPnumberOfApplicants, TOPpercentAdmitted, 
		
		BOTpercentEnrolled, BOTacademicsScale, BOTsocialScale, BOTqualityOfLifeScale,
        TOPpercentEnrolled, TOPacademicsScale, TOPsocialScale, TOPqualityOfLifeScale, emphases);

if(schoolsFound.isEmpty()) {
	%> No results found:
		<P>Return to<A HREF="search.jsp"> search </A><%
}
else
	session.setAttribute("schoolsFound",schoolsFound);
	response.sendRedirect("search_results.jsp");
%>
</body>
</html>