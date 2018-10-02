<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
<title>Show Notes Page</title>
<style>
table {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<h1 align="center">Notes List</h1>
		<form:form action="/note/showHome" modelAttribute="${role}" method="get">

		<input align="right" type="submit" value="Home Page" />
	</form:form>	
	<c:choose>
		<c:when test="${noteList.size()>0 }">

			<h2>Available Notes</h2>

			<table class="table table-hover table-dark table-striped">
				<thead>
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Creator</th>
						<th>Creation Date</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="itm" items="${noteList }">
						<tr>
							<td>${itm.title }</td>
							<td>${itm.description }</td>
							<td>${itm.creator }</td>
							<td>${itm.creation }</td>

						</tr>
					</c:forEach>

				</tbody>

			</table>
		</c:when>
		<c:otherwise>
			<h3>No notes were found</h3>
		</c:otherwise>
	</c:choose>
	<form:form action="${pageContext.request.contextPath }/logout"
						method="POST">
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<input type="submit" value="Logout">
							</div>
						</div>
					</form:form>
	
</body>
</html>