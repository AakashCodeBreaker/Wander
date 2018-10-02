<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">

<head>

<title>Notes Input Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link type="text/css" rel="Stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" />
<script type="text/javascript">
    $(function () {
        Date.prototype.ddmmyyyy = function () {
            var dd = this.getDate().toString();
            var mm = (this.getMonth() + 1).toString();
            var yyyy = this.getFullYear().toString();
            return (dd[1] ? dd : "0" + dd[0]) + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + yyyy;
        };
        $("#creation").datepicker({ dateFormat: "dd-mm-yy" });
        $("#creation").on('change', function () {
            var selectedDate = $(this).val();
            var todaysDate = new Date().ddmmyyyy();
            if (selectedDate < todaysDate | selectedDate < todaysDate) {
                alert('Selected date should not be greater than today date');
                $(this).val('');
            }
        });
    });            
</script>

</head>

<body>

	<div>
		
		

		<div id="loginbox" style="margin-top: 50px"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Add a Note</div>
					<div>
						<form:form action="/note/showHome" modelAttribute="${role}" method="get">
							<input type="submit" value="Home Page" />
						</form:form>						
					</div>					
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form method="POST" modelAttribute="note"
						action="${pageContext.request.contextPath }/note/addNoteValues"
						class="form-horizontal">

						<!-- note text field -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="title" required placeholder="enter note's title" required
								class="form-control">
						</div>
						<!-- note description text field -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="description" required placeholder="enter note description"
								class="form-control" required>
						</div>
						<!-- note creator field -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="creator" id="creator" value="${pageContext.request.userPrincipal.name}"
								class="form-control" required >
						</div>
						<!-- note creation date field -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="date"
								name="creation" id ="creation" placeholder="enter creation date"
								class="form-control" required>
						</div>
						<!-- note submit button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Add Note</button>
							</div>
						</div>
					</form:form>
					<form:form action="${pageContext.request.contextPath }/logout"
						method="POST">
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<input type="submit" value="Logout">
							</div>
						</div>
					</form:form>


				</div>

			</div>

		</div>

	</div>

</body>
</html>