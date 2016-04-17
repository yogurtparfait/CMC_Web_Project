<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%UserUI ui = ??? ;

String schoolName = request.getParameter("schoolName");
String location = request.getParameter("location");
String state = request.getParameter("state");
String location = request.getParameter("location");

int numberOfStudents = Integer.parseInt(request.getParameter("numberOfStudentsTop"));
int numberOfStudents = Integer.parseInt(request.getParameter("numberOfStudentsBot"));

int academicsScaleTop = Integer.parseInt(request.getParameter("academicsScaleTop"));
int academicsScaleBottom = Integer.parseInt(request.getParameter("academicsScaleBottom"));

int socialScaleTop = Integer.parseInt(request.getParameter("socialScaleTop"));
int socialScaleBottom = Integer.parseInt(request.getParameter("socialScaleBottom"));

int qualityOfLifeScaleTop = Integer.parseInt(request.getParameter("qualityOfLifeScaleTop"));
int qualityOfLifeScaleBottom = Integer.parseInt(request.getParameter("qualityOfLifeScaleBottom"));



%>
</body>
</html>