<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>!Login!</title>

<%@include file="/WEB-INF/resource/component/all_link.jsp" %>

</head>
<body>

	<%@include file="/WEB-INF/resource/component/navbar.jsp" %>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h2>Login Page</h2>
						<c:if test="${not empty msg}">
							<p class="fs-3 fw-bold text-danger">${msg}</p>
							<c:remove var="msg"/>
						</c:if>
					</div>
					
					<div class="card-body">
						<form action="loginUser" method="post">
							
							<div class="mb-3">
								<label>Enter Email</label>
								<input type="text" name="email" class="form-control">
							</div>
							
							<div class="mb-3">
								<label>Enter Password</label>
								<input type="text" name="password" class="form-control">
							</div>
							
							<button class="btn btn-primary col-md-12">Login</button>
							
						</form>
					</div>
					
					<div class="card-footer text-center">
						<p class="fs-6">
							don't have an account <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">register</a>
						</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>