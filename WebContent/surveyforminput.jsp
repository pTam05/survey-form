<!-- @author: parnavit
This file contains the html code for the student survey form. It uses the studentsurvey.css for styling and studentsurvey.js for javascript code. -->
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
	<form class="myform" method="post" action="StudentSurveyServlet"
		autocomplete="on">
		<h1>Student Survey</h1>
		<h5>*Required Fields</h5>

		<label id="userName"></label> <a id="cookieResetLink" href="#d"
			data-toggle="modal">New User? Click Here</a> <br />

		<div class="w3-row-padding">
			*G Number: 
			<input type="text" id="studentID" name="studentID"
				class="w3-input w3-border w3-round" required autofocus
				placeholder="G Followed by 8 digits" />
				<br /><br /> 
				*First Name: 
				<input
				type="text" id="fname" name="fname"
				class="w3-input w3-border w3-round" required
				placeholder="First name" />
				<br /> <br />
				*Last Name: 
				<input type="text"
				id="lname" name="lname" class="w3-input w3-border w3-round" required
				placeholder="Last Name" />
				<br /><br /> 
				*Street Address: 
				<input
				type="text" id="streetAddress" name="streetAddress"
				class="w3-input w3-border w3-round" required
				placeholder="Street Address" />
				<br /><br /> 
				*Zipcode:
				<input
				type="number" id="zipcode" name="zipcode"
				class="w3-input w3-border w3-round" 
				required placeholder="Zip Code" pattern="[0-9]{5}" />
				<br /> <br />
				*City: 
				<input type="text" id="city" name="city" class="w3-input w3-border w3-round" required
				placeholder="City" />
<!-- 				<label id="city" name="city"></label>  -->
				<br /> <br /> 
				*State: 
<!-- 				<label -->
<!-- 				id="state" name="state"></label> -->
				<input type="text" id="state" name="state" class="w3-input w3-border w3-round" required placeholder="State"/>
				<br /> <br /> 
				*Phone No: 
				<input type="number" id="phone"
				name="phone" class="w3-input w3-border w3-round" required
				placeholder="Phone Number" />
				<br /><br /> 
				*Email: <input type="email"
				id="emailId" name="emailId" class="w3-input w3-border w3-round"
				required placeholder="Email" />
				<br /> <br />
				*URL: <input type="url"
				name="url" class="w3-input w3-border w3-round" required
				placeholder="URL" />
				<br /> <br />
				*Date of Survey:<br /> <input
				type="date" name="dateOfSurvey" class="w3-input w3-border w3-round"
				required placeholder="YYYY-MM-DD" /><br> What you liked most
			about campus:<br /> <label><input type="checkbox"
				name="favorite" value="students" /> Students</label><br /> <label><input
				type="checkbox" name="favorite" value="Atmosphere" /> Atmosphere</label><br />
			<label><input type="checkbox" name="favorite"
				value="Location" /> Location</label><br /> <label><input
				type="checkbox" name="favorite" value="dormrooms" /> Dorm rooms </label><br />
			<label><input type="checkbox" name="favorite" value="Campus" />
				Campus</label><br /> <label><input type="checkbox" name="favorite"
				value="sports" /> Sports</label><br /> <br /> How did you hear about the
			university? <br /> <label><input type="radio" name="source"
				value="friends" /> Friends</label><br /> <label><input
				type="radio" name="source" value="internet" /> Internet </label><br /> <label><input
				type="radio" name="source" value="television" /> Television</label><br />
			<label><input type="radio" name="source" value="other" />
				Other</label><br /> <br />
		</div>
		<div class="w3-row-padding">
			*Date of Graduation:<br />
			<div class="w3-half">
				<input type="text" class="w3-input w3-border w3-round" list="months"
					name="dateofgraduation" placeholder="Month" />
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
				</datalist>
			</div>

			<div class="w3-half">
				<input type="text" name="yearofgraduation"
					class="w3-input w3-border w3-round" required placeholder="Year" />
			</div>
		</div>

		<br />
		<div class="w3-row-padding">
			Likelihood of Recommendation:<br /> <select
				class="w3-input w3-border w3-round" name="recommendation">
				<option value="very">Very Likely</option>
				<option value="likely">Likely</option>
				<option value="unlikely">Unlikely</option>
			</select><br /> <br />Additional Comments:<br />
			<textarea name="comments" class="w3-input w3-border w3-round"></textarea>
			<br /> <br /> Data:<br />
			<textarea id="datafield" name="raffle"
				class="w3-input w3-border w3-round" pattern="^\d+(,\d+)*$"></textarea>
			<br /> <label id="dataError" class="error-label"></label> <label
				id="average"></label> <br /> <label id="maximum"></label> <br /> <br />
		</div>

		<input type="submit" id="submitBtn"
			class="w3-button w3-block w3-round-large button-primary"
			value="Submit" /> <input id="cancelBtn"
			class="w3-button w3-block w3-round-large button-primary" type="reset"
			value="Cancel" /> <input id="resetBtn"
			class="w3-button w3-block w3-round-large button-primary" type="reset"
			value="Reset" />

	</form>



	<div id="gmulink">
		<label id="author">created by Parnavi, Pranjali, Aditya and Ishwar</label> <br /> <a
			href="https://volgenau.gmu.edu/"> <img border="0"
			alt="George Mason University" src="GMURGB.jpg" width="100"
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
