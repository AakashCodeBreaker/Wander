<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>

<title>Home Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>

	<div>
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">
						Welcome..!!
						<security:authentication property="principal.username" />
						to Notes Home Page
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form method="POST" class="form-horizontal"
						modelAttribute="${role}">

						<!-- view all notes Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success"
									formaction="${pageContext.request.contextPath }/note/showAllNotes">List
									of Notes</button>
							</div>
						</div>

						<!-- adding a new note Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success"
									formaction="${pageContext.request.contextPath }/note/addNote">Add
									new Note</button>
							</div>
						</div>


						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success"
									formaction="${pageContext.request.contextPath }/note/linkNote">Delete
									a note</button>
							</div>
						</div>

						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success"
									formaction="${pageContext.request.contextPath }/note/linkNote">Update
									a note</button>
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