<!-- 
@author parnavit

JSP to display acknowledgement message. Also displays list of student GIDs
 -->

<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acknowledgement</title>
<style>
p {
	color: red;
}

b {
	color: blue;
}
</style>
</head>
<body>
	<jsp:useBean id="statData" type="assignment.three.DataBean"
		scope="session"></jsp:useBean>
	<p>Mean: ${statData.mean}</p>
	<p>Standard Deviation: ${statData.stdDev}</p>
	<br>
	<b>Thank you for filling the form</b>
	<br>
	<b>The information entered on the form was successfully saved to a
		database table</b>

	<p>List of Students with the Student-Id's:</p>
	<ul>
		<%
			//ArrayList<Object> list = new ArrayList<Object>();
			Object list = session.getAttribute("studentIDList");
			String str = list.toString();
			str = str.replace("[", "");
			str = str.replace("]", "");
			String[] sArr = str.split(",");

			for (int i = 0; i < sArr.length; i++) {
		%>
		<li><a href="StudentSurveyServlet?findStudentID=<%=sArr[i]%>"><%=sArr[i]%></a></li>
		<%
			}
		%>

	</ul>
</body>
</html>