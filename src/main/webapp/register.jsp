<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

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

<!-- <main class="d-flex align-items-center primary-background banner-background" > -->

<main class="primary-background p-5 banner-background "> 
<div class="container">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-header text-white text-center " style="background-color: #26a69a;">
<span class="fa fa-3x fa-user-circle"></span>
<p>Register Here</p>
</div>
<div class="card-body">


<%

String checkbox = (String)session.getAttribute("checkbox");

if(checkbox!=null){
	
	%>
	<script>
	alert("<%= checkbox %>");
	
	</script>
	
	<% session.setAttribute("checkbox",null);
	
}

%>

<%

String registrationfailed = (String)session.getAttribute("registrationfailed");

if(registrationfailed!=null){
	
	%>
	<script>
	alert("<%= registrationfailed %>");
	
	</script>
	
	<% session.setAttribute("registrationfailed",null);
	
}

%>


<form id="reg-form" action="RegisterServlet" method="post">

  <div class="form-group">
    <label for="user_name">User Name</label>
    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
    </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  <div class="form-group">
    <label for="gender">Select Gender </label><br>
    <input type="radio"  name="gender" value="male" >Male
    <input type="radio"  name="gender" value="female">Female
  </div>
  
  <div class="form-ground">
  
  <textarea name="about" class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>
  
  </div>
  
  
  <div class="form-check">
    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
  
  <br>
  
 
  <button type="submit" class="btn btn-primary" style="display: block; margin: 0 auto;">Submit</button>

</form>


</div>
</div>
</div>
</div>


</main>





<!-- JavaScript -->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="JS/myjs.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<!-- <script>
  $(document).ready(function () {
    console.log("loaded....");

    $('#reg-form').on('submit', function (event) {
      event.preventDefault();

      let form = new FormData(this);

      /* send register servlet; */
      $.ajax({
        url: "RegisterServlet",
        type: 'POST',
        data: form,
        success: function (data, textStatus, jqXHR) {
          console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
          console.log(jqXHR);
        },
        processData: false,
        contentType: false
      });
    });
  });
</script> -->




</body>
</html>