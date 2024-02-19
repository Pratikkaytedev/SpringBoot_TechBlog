
<%@page import="com.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- Link to a custom CSS file for styling the "index" page -->
<link rel="stylesheet" type="text/css" href="CSS/index.css">


<!-- Link to the Font Awesome CSS, which provides scalable vector icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Link to the Bootstrap CSS framework, version 4.0.0, hosted on a CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Link to SweetAlert2 CSS -->
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>



<style>
.banner-background {
	clip-path: polygon(51% 0, 100% 0, 100% 100%, 75% 90%, 50% 100%, 25% 90%, 0 100%, 0
		0);
}




body {
    background: url(images/background.jpg);
    background-size: cover;
    background-attachment: fixed;
}

/* Set the text color with opacity */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.7); /* Adjust the alpha (opacity) value */
    z-index: -1; /* Place it behind the text */
}

/* Style the text */
p {
    color: #000; /* Set your desired text color */
    font-size: 24px; /* Adjust the font size */
    /* Other text styles as needed */
}

</style>


</head>
<body>

	<%
	String postSuccess = (String) session.getAttribute("postSuccess");

	if (postSuccess != null) {
	%>
	<script>
		swal("<%=postSuccess%>")
		</script>
	<%
	session.setAttribute("postSuccess", null);
	}
	%>



	<%
	String updated = (String) session.getAttribute("updated");

	if (updated != null) {
	%>

	<script>
		swal("<%=updated%>
			")
		</script>
	<%
	session.setAttribute("updated", null);
	}
	%>





	<!-- NavBar Start -->


	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> TechBlog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-child"></span> Learn Coding with Pratik <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structures (DSA)</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-phone-square"></span> Contact
				</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="fa fa-asterisk"></span> Do Post
				</a></li>


			</ul>

			<%
			User user = (User) session.getAttribute("user");
			%>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle"></span> <%=user.getEmail()%></a></li>

				<li class="nav-item"><a class="nav-link"
					href="serverlogout.jsp"> <span class="fa fa-user-plus "></span>
						Logout
				</a></li>

			</ul>

		</div>
	</nav>


	<!-- NavBar End -->


	<!-- Main Body Start of the Page -->

	<main>

		<div class="container">
			<!-- fir column -->
			<div class="row mt-4">
				<div class="col-md-4">

					<!-- Categories -->

					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)"
							class="c-link list-group-item list-group-item-action active">All
							Posts </a>

						<%
						PostDao postDao = new PostDao(ConnectionProvider.getConnection());

						ArrayList<Category> list1 = postDao.getAllCategories();

						for (Category c : list1) {
						%>

						<a href="#" onclick="getPosts(<%=c.getCid()%>,this)"
							class="c-link list-group-item list-group-item-action disabled"><%=c.getName()%>
						</a>


						<%
						}
						%>


					</div>

				</div>

				<!-- Second column -->


				<div class="col-md-8">

					<!-- Posts -->

					<div class="container text-center " id="loader">

						<i class="fa fa-refresh fa-3x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>

					</div>

					<div class="container-fluid" id="post-container"></div>

				</div>



			</div>

		</div>


	</main>


	<!-- Main Body End of the Page -->





	<!-- Profile modal Start -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/default.jpg" class="img-fluid"
							style="border-radius: 50%; max-width: 100px">
						<h5 class="modal=title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>


						<!-- Details -->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td><%=user.getDateTime()%></td>

									</tr>
								</tbody>
							</table>
						</div>


						<!-- Profile edit -->

						<div id="profile-edit" style="display: none">

							<h3 class="mt-2">Please Edit Carefully</h3>

							<form action="EditServlet" method="post">

								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>



									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											value="<%=user.getName()%>" name="editName"></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											value="<%=user.getEmail()%>" name="editEmail"></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											value="<%=user.getPassword()%>" name="editPassword"></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>

									<tr>
										<td>About :</td>
										<td><textarea rows="2" class="form-control"
												name="editAbout"> <%=user.getAbout()%> </textarea></td>
									</tr>




								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>

								</div>

							</form>

						</div>

						<!-- Profile edit close -->


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="editprofilebtn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Profile modal End -->


	<!-- Start of Post modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">

								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());

								ArrayList<Category> list = postd.getAllCategories();

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>">
									<%=c.getName()%></option>

								<%
								}
								%>

							</select>
						</div>


						<div class="form-group">
							<input type="text" name="ptitle" placeholder="Enter post Title"
								class="form-control">
						</div>

						<div class="form-group">
							<textarea class="form-control" name="pcontent"
								style="height: 100px;" placeholder="Enter your content"></textarea>
						</div>

						<div class="form-group">
							<textarea class="form-control" name="pcode"
								style="height: 100px;" placeholder="Enter your Program (If Any)"></textarea>
						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- Link to jQuery Library -->
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


	<!-- End of Post modal -->


	<!-- Editing Profile Details using ajax -->

	<script>
			$(document).ready(function() {
				/* alert("testing alert function") */
	
				let editStatus = false;
	
				$('#editprofilebtn').click(function() {
					/* alert("testing button clicked") */
	
					if (editStatus == false) {
						$("#profile-details").hide()
						$("#profile-edit").show()
	
						editStatus = true;
						$(this).text("Back")
					} else {
	
						$("#profile-details").show()
						$("#profile-edit").hide()
						editStatus = false;
						$(this).text("Edit")
					}
	
				});
	
			});
		</script>


	<!-- adding post using ajax -->



	<script>
		
		$(document).ready(function (e){
			/* alert("loaded") */
			
			
			$("#add-post-form").on("submit",function(event){
				
				/* This code gets called when form is submitted */
				 event.preventDefault(); 
				console.log("you have clicked on submit...")
				
				 let form = new FormData(this);  
				
				/* Now requesting to server */
				
				 $.ajax({
					url:"AddPostServlet",
					type :'POST',
					data : form,
					success: function (data, textStatus, jqXHR){
							
					},
					error : function(jqXHR, textStatus, errorThrown){
						
					},
					
					processData : false,
					contentType : false
					
				}) 	
			})		
		})
		
		
		</script>

	<!-- loading post using ajax -->


	<script type="text/javascript">
	
	function getPosts(catId,temp){
	
		$("#loader").show();
		$("#post-container").hide()
		
		$(".c-link").removeClass('active')
		
		$.ajax({
			url: "loadPost.jsp",
			data : { cid: catId }, 
			success: function(data, textStatus, jqXHR) {
			    /* console.log(data);	 */		    
			    $("#loader").hide();
			    $("#post-container").show();
			    $('#post-container').html(data);
			    $(temp).addClass('active')
			}		
		});
		
		
	}
		
	$(document).ready(function (e){
		
		let allPostRef=$('.c-link')[0]
		
		getPosts(0,allPostRef);
				
	});
	


	

	
	
		/* function.getPosts(catId){
			
			$.ajax({
				data:(cid:catId)
			}
				url: "loadPost.jsp",
				data(cid:catId)
				success: function(data, textStatus, jqXHR){
					console.log(data);
					
					$("#loader").hide();
					$('#post-container').html(data)
				}
			})
			
				$(document).ready(function (e){
			 getPosts()
			
			
		}) */
		
	</script>
	<!-- Link to Popper.js Library (Bootstrap Dependency) -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>

	<!-- Link to Bootstrap JavaScript Library (Version 4.0.0) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<!-- Link to Custom JavaScript File (myjs.js) -->
	<script src="JS/myjs.js" type="text/javascript"></script>



</body>
</html>