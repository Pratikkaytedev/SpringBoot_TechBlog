<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" type="text/css" href="CSS/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>

.banner-background{
clip-path: polygon(51% 0, 100% 0, 100% 100%, 75% 90%, 50% 100%, 25% 90%, 0 100%, 0 0);
}

</style>

</head>
<body>


<!-- NavBar -->

<%@include file="navbar.jsp" %>


<main class="d-flex align-items-center primary-background banner-background" style="height:70vh">
<div class="container ">
<div class="row">
<div class="col-md-4 offset-md-4"> 
<div class="card">
<div class="card-header text-white text-center" style="background-color: #26a69a;">
<span class="fa fa-user-plus fa-3x"></span>
<p>Login Here</p>
</div>
<div class="card-body">

<%

String registrationsuccess = (String)session.getAttribute("registrationsuccess");

if(registrationsuccess!=null){
	
	%>
	<script>
	alert("<%= registrationsuccess %>");
	
	</script>
	
	<% session.removeAttribute("registrationsuccess");
	
}

%>

<%

Message msg = (Message)session.getAttribute("msg");

if(msg!=null){
	%>
	
	<div class="alert <%= msg.getCssClass() %> " role="alert">
  
  <%= msg.getContent() %>
</div>
	
	<%
	session.removeAttribute("msg");
	
}

%>

<form action="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  <button type="submit" class="btn btn-primary" style="display: block; margin: 0 auto;">Submit</button>
</form>

</div>

</div>
</div>
</div>/
</div>


</main>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="JS/myjs.js" type="text/javascript"></script>

</body>
</html>