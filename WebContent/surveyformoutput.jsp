<!-- @author: parnavit
This file contains the html code for the student survey form. It uses the studentsurvey.css for styling and studentsurvey.js for javascript code. -->
<!-- <%@page import="com.mason.assignment.*"%> -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<!--<link rel="stylesheet" type="text/css" href="/css/result-light.css"> -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="studentsurvey.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="studentsurvey.js"></script>


</head>
<body>
	<%
  	Object obj = session.getAttribute("studentBeanObj");
    assignment.three.StudentBean sBean = (assignment.three.StudentBean)obj;
  %>
	<form class="myform" autocomplete="on">
		<h1>Student Survey</h1>
		<h5>*Required Fields</h5>

		<label id="userName"></label> <a id="cookieResetLink" href="#d"
			data-toggle="modal">New User? Click Here</a> <br />

		<div class="w3-row-padding">
			*First Name:
			<th><output><%=sBean.getFirstName()%></output></th>
			<!-- <input type="text" id="fname" class="w3-input w3-border w3-round" required autofocus placeholder="First name"/><br/> -->
			*Last Name:
			<th><output><%=sBean.getLastName()%></output></th>
			<!-- <input type="text" id="lname" class="w3-input w3-border w3-round" required placeholder="Last Name"/><br/> -->
			*Street Address:
			<th><output><%=sBean.getAddress()%></output></th>
			<!-- <input type="text" id="streetAddress" class="w3-input w3-border w3-round" required placeholder="Street Address"/><br/> -->
			*Zipcode:
			<th><output><%=sBean.getZip()%></output></th>
			<!-- <input type="number" id="zipcode" class="w3-input w3-border w3-round" onblur="populateCityState()" required placeholder="Zip Code" pattern="[0-9]{5}"/><br/> -->
			<br /> *City:
			<th><output><%=sBean.getCity()%></output></th>
			<!-- <input type="text" id="city" class="w3-input w3-border w3-round" required placeholder="City"/>-->
			<!-- <label id="city"></label> -->
			<br /> <br /> *State:
			<th><output><%=sBean.getState()%></output></th>

			<!-- <label id="state"></label> -->
			<!-- <input type="text" id="state" class="w3-input w3-border w3-round" required placeholder="State"/>-->
			<br /> <br /> *Phone No:
			<th><output><%=sBean.getTel()%></output></th>
			<!-- <input type="number" id="phone" class="w3-input w3-border w3-round" required placeholder="Phone Number"/><br/> -->
			*Email:
			<th><output><%=sBean.getEmail()%></output></th>
			<!-- <input type="email" id ="emailId" class="w3-input w3-border w3-round" required placeholder="Email"/><br/> -->
			*URL:
			<th><output><%=sBean.getUrl()%></output></th>
			<!-- <input type="url" class="w3-input w3-border w3-round" required placeholder="URL"/><br/> -->
			*Date of Survey:<br />
			<th><output><%=sBean.getDateOfSurvey()%></output></th>
			<!-- <input type="date" class="w3-input w3-border w3-round" required placeholder="MM/DD/YYYY"/><br> -->

			What you liked most about campus:<br />
			<!-- <label><input type="checkbox" name="favorite" value="students"/> Students</label><br />
    <label><input type="checkbox" name="favorite" value="Atmosphere"/> Atmosphere</label><br />
    <label><input type="checkbox" name="favorite" value="Location"/> Location</label><br />
    <label><input type="checkbox" name="favorite" value="dormrooms"/> Dorm rooms </label><br />
    <label><input type="checkbox" name="favorite" value="Campus"/> Campus</label><br />
    <label><input type="checkbox" name="favorite" value="sports"/> Sports</label><br /> -->
			<th><output><%=sBean.getInterest()%></output></th> <br /> How did
			you hear about the university? <br />
			<!-- <label><input type="radio" name="source" value="friends"/> Friends</label><br/>
    <label><input type="radio" name="source" value="internet"/> Internet </label><br/>
    <label><input type="radio" name="source" value="television"/> Television</label><br/>
    <label><input type="radio" name="source" value="other"/> Other</label><br/> -->
			<th><output><%=sBean.getInfo()%></output></th> <br />

		</div>
		<div class="w3-row-padding">
			*Date of Graduation:<br />
			<div class="w3-half">
				<th><output><%=sBean.getGradMonth()%></output></th>
				<!-- <input type="text" class="w3-input w3-border w3-round" list="months" name="dateofgraduation" placeholder="Month"/>
      <datalist>
        <option value="Jan">
        <option value="Feb">
        <option value="Mar">
        <option value="Apr">
        <option value="May">
        <option value="June">
        <option value="July">
        <option value="Aug">
        <option value="Sep">
        <option value="Oct">
        <option value="Nov">
        <option value="Dec">
      </datalist> -->
			</div>

			<div class="w3-half">
				<th><output><%=sBean.getGradYear()%></output></th>
			</div>
		</div>

		<br />
		<div class="w3-row-padding">
			Likelihood of Recommendation:<br />
			<th><output><%=sBean.getRecommendation()%></output></th>
			<!-- <select class="w3-input w3-border w3-round" name="recommendation">
      <option value="very">Very Likely</option>
      <option value="likely">Likely</option>
      <option value="unlikely">Unlikely</option>
    </select><br/> -->

			Additional Comments:<br />
			<th><output><%=sBean.getComments()%></output></th>
			<!-- <textarea class="w3-input w3-border w3-round"></textarea><br /><br /> -->
			Data:<br />
			<th><output><%=sBean.getRaffle()%></output></th>
			<!-- <textarea id="datafield" class="w3-input w3-border w3-round" pattern="^\d+(,\d+)*$"></textarea><br /> -->
			<!-- <label id="dataError" class="error-label"></label>
    <label id="average"></label>
    <br />
    <label id="maximum"></label>
    <br/> <br/> -->
		</div>

<!-- 		<input type="submit" id="submitBtn"
			class="w3-button w3-block w3-round-large button-primary"
			value="Submit" /> <input id="cancelBtn"
			class="w3-button w3-block w3-round-large button-primary" type="reset"
			value="Cancel" /> <input id="resetBtn"
			class="w3-button w3-block w3-round-large button-primary" type="reset"
			value="Reset" /> -->

	</form>



	<div id="gmulink">
		<label id="author">created by Parnavi, Pranjali, Adityaraj and
			Ishwar</label> <br /> <a href="https://volgenau.gmu.edu/"> <img
			border="0" alt="George Mason University" src="GMURGB.jpg" width="100"
			height="100"></a>
	</div>


	<!-- MODAL BEGINS -->
	<div id="dialog-form" class="modal" title="Enter Your Name">
		<p class="validateTips">All form fields are required.</p>

		<form>
			<fieldset>
				<label for="modal-name">Name</label> <input type="text" name="name"
					id="modal-name" value="Jane Smith"
					class="text ui-widget-content ui-corner-all"> <input
					type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>


</body>
</html>
