<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Company home page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h2>Company home page - yahooooo still working</h2>
	<hr>
	</div>

	
	<p>Welcome to Companies Home Page</p>
	<hr>
		<!-- dislplay username and role -->
		<p>
			User : <security:authentication property="principal.username" />
			<br><br>
			Role(s) : <security:authentication property="principal.authorities" />
		</p>
	
	<security:authorize access="hasRole('MANAGER')">
		<hr>	
				<!-- add a link to point to leaders -->
			<p>
				<a href= "${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
				(only for managers)
			</p>
	</security:authorize>
			
		
	
	<security:authorize access="hasRole('ADMIN')">
		<hr>
				<!-- add a link to point to Admins -->
			<p>
				<a href= "${pageContext.request.contextPath}/systems">IT systems Meeting</a>
				(only for Admin people)
			</p>
	</security:authorize>
		
	<hr>

	<form:form action="${pageContext.request.contextPath }/logout" method ="POST">
		<input type="submit" value="Logout">
	</form:form>
</body>
</html>