<!-- 
@author parnavit

JSP to display winner message. Also displays list of student GIDs
 -->

<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Winner</title>
<style>
p {
	color: red;
}

b {
	color: blue;
}

#thanks {
	color: green;
}
</style>
</head>
<body>
	<jsp:useBean id="statData" class="assignment.three.DataBean"
		scope="session"></jsp:useBean>
	<p>Mean: ${statData.mean}</p>
	<p>Standard Deviation: ${statData.stdDev}</p>
	<p id="thanks">Thank you for completing the Survey</p>
	<br>
	<br>
	<b>Congratulations ! You are the lucky winner of 2 Movie Tickets</b>
	<br>
	<b>The information entered on the form was successfully saved to a
		database table</b>

	<p>List of Students with the Student-Id's:</p>
	<ul>
		<%
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