<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>!Add_Notes!</title>

<%@include file="/WEB-INF/resource/component/all_link.jsp" %>

</head>
<body style="background: #f0f0f0;">

	<%@include file="/WEB-INF/resource/component/navbar.jsp" %>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header text-center">
						<h2>Add Your Notes</h2>
						<c:if test="${not empty msg}">
							<p class="fs-3 fw-bold text-success">${msg}</p>
							<c:remove var="msg"/>
						</c:if>
					</div>
					
					<div class="card-body">
						<form action="saveNotes" method="post">
							<div class="mb-3">
								<label>Enter Title</label>
								<input type="text" name="title" class="form-control">
							</div>
							
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="4" cols="" class="form-control" name="description"></textarea>
							</div>
							
							<button class="btn btn-primary mt-4">Save</button>
							
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>