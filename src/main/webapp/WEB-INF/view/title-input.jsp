<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">

<head>

<title>Title Input Page</title>
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

</head>

<body>
	<c:choose>
		<c:when test="${noteList.size()>0 }">
			<h2>Available Notes</h2>
			<form:form action="/note/showHome" method="get">
				<input type="submit" value="Home Page" />
			</form:form>
			<table class="table">
				<thead>
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Creator</th>
						<th>Creation Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="itm" items="${noteList }">
						<tr class="success">
							<td>${itm.title }</td>
							<td>${itm.description}</td>
							<td>${itm.creator}</td>
							<td>${itm.creation}</td>
							<td><a href='<c:url value="/note/deleteNote/${itm.title}"/>'>Delete</a>
								<a href='<c:url value="/note/updateNote/${itm.title}"/>'>Update</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</c:when>
		<c:otherwise>
			<h3>No notes were found</h3>
		</c:otherwise>
	</c:choose>


	<div>

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-info">




				<div style="padding-top: 30px" class="panel-body">
					<c:set var="value" value="update" />
					
					<c:choose>
						<c:when test="${val==value}">
							<div class="panel-heading">
								<div class="panel-title">${val} a Note</div>
							</div>
							<!-- Title Form -->
							<form:form method="POST" modelAttribute="note"
								action="${pageContext.request.contextPath }/note/${val}"
								class="form-horizontal">

								<!-- note text field -->
								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input type="text"
										name="title" id="title" value="${note.title}"
										placeholder="enter note's title" required class="form-control">
								</div>
								<!-- note description text field -->
								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input type="text"
										name="description" id="description" value="${note.description}"
										placeholder="enter note description" required
										class="form-control">
								</div>
								<!-- note creator field -->
								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input type="text"
										name="creator" id="creator" value="${note.creator}"
										placeholder="enter upadtor's name" required
										class="form-control">
								</div>
								<!-- note creation date field -->
								
								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input type="date"
										name="creation" id="creation" value="${note.creation}"
										placeholder="enter updation date" 
										class="form-control">
								</div>

								<!-- note submit button -->
								<div style="margin-top: 10px" class="form-group">
									<div class="col-sm-6 controls">
										<button type="submit" class="btn btn-success">${val}</button>
									</div>
								</div>
							</form:form>

						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
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