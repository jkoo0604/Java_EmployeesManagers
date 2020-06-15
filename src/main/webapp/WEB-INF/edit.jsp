<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Manager</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h3>
					Update Manager for ${employee.firstName } ${employee.lastName }
				</h3>
			</div>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col">
				<form action="/employees/${employee.id}" method="post">
					<input type="hidden" name="_method" value="put">
					<div class="form-group">
					    <select class="form-control" name="mID">
					    	<option value="0" label="--- Select ---" selected disabled>
					    	<c:forEach items="${employees}" var="m">
				        	<option value="${m.id}"><c:out value="${m.firstName} ${m.lastName}"/></option>
				        	</c:forEach>
					    </select>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div>
						<input type="submit" value="Update" class="btn btn-dark btn-sm"/>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="/webjars/jquery/3.5.1/jquery.min.js "></script>
<script src="/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>