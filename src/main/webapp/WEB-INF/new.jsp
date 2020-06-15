<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Employee</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h3>Add Employee</h3>
			</div>
		</div>
		<div class="row">
			<h3>Registration</h3>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<p class="err"><form:errors path="employee.*"/></p>
		</div>
		<div class="row">
			<form:form action="/employees" method="post" modelAttribute="employee">
				<div class="col-sm-12">
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="firstName">First Name:</form:label>
						</div>
						<div class="col-sm-8">
			        		<form:input path="firstName"  class="form-control" type="text"/>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="lastName">Last Name:</form:label>
						</div>
						<div class="col-sm-8">
			        		<form:input path="lastName"  class="form-control" type="text"/>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-4">
							<form:label path="manager">Manager:</form:label>
						</div>
						<div class="col-sm-8">
					        <form:select path="manager.id">
					        	<c:forEach items="${employees}" var="m">
					        	<form:option value="${m.id}"><c:out value="${m.firstName} ${m.lastName}"/></form:option>
					        	</c:forEach>
					        </form:select>
						</div>
					</div>
					<div class="row form-group">
						<div class="col text-center">
							<input type="submit" value="Create" class="btn btn-dark"/>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

<script src="/webjars/jquery/3.5.1/jquery.min.js "></script>
<script src="/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
</body>
</html>