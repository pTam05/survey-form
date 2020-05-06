/* @author: parnavit
This file provides javascript code for the surveyform.html page.
 */

window.onload = function() {

	/* Function to Validate Forms Fields */
	var validateFormElements = function() {

		var errorMessage = ''
		var emailRegEx = /^[a-zA-Z0-9.+/=!'*?^#$%&_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,25}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,20}[a-zA-Z0-9])?)*$/

		if ($('input[name="favorite"]:checked').length < 2) {
			errorMessage += "Select atleast 2 things you liked about the campus. \n";
		}

		if ($('input[name="source"]:checked').length < 1) {
			errorMessage += "Choose how you heard about GMU. \n";
		}

		var email = $("#emailId").val()
		if (!(emailRegEx.test(email))) {
			errorMessage += "Invalid email id entered. \n";
			$('#emailId').val("");
		}

		var fname = $("#fname").val()
		if (!(/^[a-zA-Z- ]*$/.test(fname))) {
			$('#fname').val('');
			errorMessage += 'First name should contain alphabets only.\n';
		}

		var lname = $("#lname").val()
		if (!(/^[a-zA-Z- ]*$/.test(lname))) {
			$('#lname').val("");
			errorMessage += 'Last name should contain alphabets only.\n';
		}

		var addr = $("#streetAddress").val()
		if (!(/^[a-zA-Z0-9 ]*$/.test(addr))) {
			$('#streetAddress').val("");
			errorMessage += 'Street Address should contain alphanumeric characters only. \n';
		}

		if (errorMessage != '') {
			alert(errorMessage)
			return false;
		}
		
		return true;
	}

	/* Javascript functions to calculate average and maximum */
	function sumN(total, value, index, array) {
		return parseInt(total) + parseInt(value);
	}

	var average = function(numArray) {
		/* calculate sum of array elemnts */
		var sum = numArray.reduce(sumN);
		return (sum / numArray.length);
	}

	var maxNum = function(numArray) {
		/* sort array in ascending order */
		numArray.sort(function(a, b) {
			return b - a
		})
		return numArray[0]
	}

	/* Javascript funciton to return greeting according to time of day */
	var getGreeting = function() {
		var greeting = ''
		var timeStamp = new Date().getHours();
		if (timeStamp >= 0 && timeStamp < 12) {
			greeting = 'Good Morning ';
		} else if (timeStamp >= 12 && timeStamp < 17) {
			greeting = 'Good Afternoon ';
		} else if (timeStamp >= 17 && timeStamp < 24) {
			greeting = 'Good Evening ';
		}

		return greeting;
	}

	/* Dialog box to enter name for cookie */
	dialog = $("#dialog-form").dialog({
		autoOpen : false,
		height : 400,
		width : 350,
		modal : true,
		buttons : {
			"Submit" : function() {
				var name = $("#modal-name").val()
				var greet = getGreeting()
				$('#userName').text(greet + name + '!!!!')
				$.cookie('sweepnamecookies', name, {
					expires : 7,
					path : '/'
				})
				dialog.dialog("close");
			},
			Cancel : function() {
				dialog.dialog("close");
			}
		},
		close : function() {
			/* form[0].reset();
			allFields.removeClass("ui-state-error"); */
			dialog.dialog("close");
		}
	});

	/* $.cookie('name', 'Parnavi', {
	 expires: 7,
	 path: '/'
	 })
	 $.removeCookie('name')*/

	/* Set Cookie if none exists */
	var name = $.cookie('sweepnamecookies')
	if (typeof name === "undefined") {
		dialog.dialog("open")
	} else {
		var grt = getGreeting()
		$('#userName').text(grt + name + ' !!!!')
	}

	/* Cookie Reset Link Code */
	$('#cookieResetLink').on('click', function() {
		dialog.dialog("open");
	});

	/* Data field code begins */
	$('#datafield').on("change", function() {
		var arrayNum = $(this).val().split(',')
		if (arrayNum.length >= 10) {
			/* clear error message and display avg and max values */
			$('#dataError').text('')
			$("#submitBtn").attr('disabled', false)
		} else {
			/* Show error message */
			$('#average').text('')
			$('#maximum').text('')
			$('#dataError').text('You need to enter atleast 10 numbers!')
			$("#submitBtn").attr('disabled', true)
		}
	});

	var appendHiddenInputs = function() {
		var cityName = $("#city").text();
		var stateName = $("#state").text();
		
		$('<input>').attr({
		    type: 'hidden',
		    id: 'city',
		    name: 'city',
		    value: cityName
		}).appendTo('form');
		
		$('<input>').attr({
		    type: 'hidden',
		    id: 'state',
		    name: 'state',
		    value: stateName
		}).appendTo('form');
	}
		
	$("#submitBtn").on("click", function() {
		var result = validateFormElements();
		if (!result) {
			return false;
		}
	});

	$('#resetBtn').on("click", function() {
		$('#average').text('')
		$('#maximum').text('')
		$('#city').text('')
		$('#state').text('')
		$('#dataError').text('')
		$("#submitBtn").attr('disabled', false)
	});

}

/* AJAX */
function populateCityState() {
	var xhrequest = new XMLHttpRequest();
	var jsondata;
	var found = false;

	xhrequest.onreadystatechange = function() {
		if (xhrequest.readyState == 4 && xhrequest.status == 200) {
			jsondata = JSON.parse(xhrequest.responseText);
			$(jsondata.zipcodes).each(function(key, val) {
				if ($('#zipcode').val() == val.zip) {
					found = true;
					$('#city').text(val.city);
					$('#state').text(val.state);
				}
			})

			if (!found) {
				$('#zipcode').val("");
				alert("Please Enter a valid zip code.");
				$('#city').text('');
				$('#state').text('');
			}
		}
	}

	xhrequest.open('GET', 'zipcodes.json', true);
	xhrequest.send();
}