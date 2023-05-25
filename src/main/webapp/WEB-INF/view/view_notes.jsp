<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>!View_Notes!</title>

<%@include file="/WEB-INF/resource/component/all_link.jsp" %>

</head>
<body>

	<%@include file="/WEB-INF/resource/component/navbar.jsp" %>

	<div class="container-fluid p-2">
	
		<h3 class="text-center">View All Notes</h3>
				<c:if test="${not empty msg}">
						<p class="fs-5 fw-bold text-success text-center">${msg}</p>
						<c:remove var="msg"/>
				</c:if>
	
		<div class="row">
			<c:forEach items="${list}" var="n">
				<div class="col-md-10 offset-md-1 mt-2">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<img alt="notes_img" src="<c:url value="/resource/img/20230102_154456.jpg"/>" height="50px" width="50px">
							</div>
							
							<p>${n.title}</p>
							<p>${n.description}</p>
							<p>Publish Date : ${n.date}</p>
							
							<div class="text-center">
								<a href="editnotes?id=${n.id}" class="btn btn-primary btn-sm">Edit</a>
								<a href="deleteNotes?id=${n.id}" class="btn btn-danger btn-sm">Delete</a>
							</div>
							
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>