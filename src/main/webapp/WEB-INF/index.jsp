<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ninja Gold Game</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container text-center">
		<div class="jumbotron m-3" style="background-color:lightgray">
			<h1>Welcome to Ninja Gold</h1>
				<div class="d-flex justify-content-around col p-2">
					<h4>Your gold: ${player.gold} </h4>
				</div>
		</div>
		
		<div class="col-12 d-flex justify-content-around">
			<form action="/action/farm"  method="post">
				<div class="card">
					<h4 class="card-title">Farm</h4>
					<p class="card-text">(earns 0-30 gold)</p>
					<button type="submit" class="btn btn-sm btn-secondary">Find Gold!</button>
				</div>
			</form>
			<form action="/action/programming" method="post">
				<div class="card">
					<h4 class="card-title">Programming</h4>
					<p class="card-text">(earns 0-800 gold)</p>
					<button type="submit" class="btn btn-sm btn-secondary">Find Gold!</button>
				</div>
			</form>
			<form action="/action/house" method="post">
				<div class="card">
					<h4 class="card-title">House</h4>
					<p class="card-text">(earns 0-10 gold)</p>
					<button type="submit" class="btn btn-sm btn-secondary">Find Gold!</button>
				</div>
			</form>
			<form action="/action/casino" method="post">
				<div class="card">
					<h4 class="card-title">Casino</h4>
					<p class="card-text">(costs 10/gamble, returns??)</p>
					<button type="submit" class="btn btn-sm btn-secondary">Find Gold!</button>
				</div>
			</form>
		</div>
		<div class="col">			
			<h4 class="float-left ">Activities: </h4>		
		</div>
		<div class="col" id="overflow">
			<c:forEach items="${player.tasks}" var="task" varStatus="loop">
		           <p>${task}</p>
		    </c:forEach>
		</div>
			
	</div>
</body>
</html>