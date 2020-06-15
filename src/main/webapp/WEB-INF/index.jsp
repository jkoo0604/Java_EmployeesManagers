<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees and Managers</title>
<link href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="row">
					<div class="col">
						<h3>All Employees (findAll)</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table">
						    <thead class="thead-dark">
						    <tr>
						        <th>Employee Name</th>
						        <th>Manager Name</th>
						    </tr>
						    </thead>
						    <tbody>
						        <c:forEach var="e1" items="${employees}">                
						        <tr>
						            <td><a href="/employees/${e1.id}/edit">${e1.firstName} ${e1.lastName }</a></td>
						            <td>${e1.manager.firstName} ${e1.manager.lastName }</td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col">
						<h3>All Employees (SQL Join)</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table">
						    <thead class="thead-dark">
						    <tr>
						        <th>Employee Name</th>
						        <th>Manager Name</th>
						    </tr>
						    </thead>
						    <tbody>
						        <c:forEach var="e2" items="${employeesmanager}">                
						        <tr>
						            <td>${e2[0]} ${e2[1]}</td>
						            <td>${e2[2]} ${e2[3]}</td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col">
				<h3>All Managers (SQL Names Only)</h3>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table class="table">
				    <thead class="thead-dark">
				    <tr>
				        <th>Manager Name</th>
				    </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="e3" items="${managerNames}">                
				        <tr>
				            <td>${e3[0]} ${e3[1]}</td>
				        </tr>
				        </c:forEach>
				    </tbody>
				</table>
			</div>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col-6">
				<div class="row">
					<div class="col">
						<h3>All Managers (JPQL)</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table">
						    <thead class="thead-dark">
						    <tr>
						        <th>Manager Name</th>
						        <th># of Employees</th>
						    </tr>
						    </thead>
						    <tbody>
						        <c:forEach var="e4" items="${managersSQL}">                
						        <tr>
						            <td>${e4.firstName} ${e4.lastName }</td>
						            <td>${fn:length(e4.employees)}</td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col">
						<h3>All Managers (CRUDRepo)</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table">
						    <thead class="thead-dark">
						    <tr>
						        <th>Manager Name</th>
						        <th># of Employees</th>
						    </tr>
						    </thead>
						    <tbody>
						        <c:forEach var="e5" items="${managersCRUD}">                
						        <tr>
						            <td>${e5.firstName} ${e5.lastName }</td>
						            <td>${fn:length(e5.employees)}</td>
						        </tr>
						        </c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row padding"></div>
		<div class="row">
			<div class="col text-center">
				<a href="/employees" class="btn btn-dark btn-sm" role="button">New Employee</a>
			</div>
		</div>
	</div>
<script src="/webjars/jquery/3.5.1/jquery.min.js "></script>
<script src="/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>  
</body>
</html>