<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>

<title>Register Page</title>


<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>

	$(document).ready(function(){
		var $submitBtn = $("#form input[type='submit']");
		var $userBox = $("#username");
		var $passwordBox = $("#password");
		var $confirmBox = $("#confirmPassword");
		var $errorMsg =  $('<span id="error_msg">Passwords do not match.</span>');
		

		// This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
		$submitBtn.removeAttr("disabled");

		function checkMatchingPasswords(){
			if($confirmBox.val() != "" && $passwordBox.val != ""){
				if( $confirmBox.val() != $passwordBox.val() ){
					$submitBtn.attr("disabled", "disabled");
					$errorMsg.insertAfter($confirmBox);
				}
			}
		}
		
		
		function resetPasswordError(){
			$submitBtn.removeAttr("disabled");
			var $errorCont = $("#error_msg");
			if($errorCont.length > 0){
				$errorCont.remove();
			}  
		}


		$("#confirmPassword, #password")
		.on("keydown", function(e){
			/* only check when the tab or enter keys are pressed
			 * to prevent the method from being called needlessly  */
			if(e.keyCode == 13 || e.keyCode == 9) {
				checkMatchingPasswords();
			}
		})
		.on("blur", function(){                    
			// also check when the element looses focus (clicks somewhere else)
			checkMatchingPasswords();
		})
		.on("focus", function(){
			// reset the error message when they go to make a change
			resetPasswordError();
		})

	});
	</script>

</head>

<body>

	<div>

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Register User</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form
						action="${pageContext.request.contextPath }/addUser"
						method="POST"  modelAttribute="login" class="form-horizontal">

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="username" placeholder="username" id="username" required class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								name="password" placeholder="password" id="password" required class="form-control">
						</div>
						<!-- Confirm Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								name="confirmPassword" placeholder="confirm password"  id ="confirmPassword" required class="form-control">
						</div>
						
						
						

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Register</button>
							</div>
						</div>

					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>