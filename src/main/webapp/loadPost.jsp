<%@page import="com.entities.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.LikesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<div class="row">
	<%
	PostDao pd = new PostDao(ConnectionProvider.getConnection());

	int catId = Integer.parseInt(request.getParameter("cid"));
	out.println(catId);

	List<Post> list = null;
	if (catId == 0) {
		list = pd.getAllPosts();
	} else {

		list = pd.getPostByCatId(catId);
	}

	if (list.size() == 0) {
		out.println("<h3 class='display-3 text-centre'>No posts in this category</h3>");
		return;
	}

	for (Post p : list) {
	%>

	<div class="col-md-12 mt-4">

		<div class="card">

			<div class="card-body">

				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>

				<%
				LikesDao ld = new LikesDao(ConnectionProvider.getConnection());
				UserDao ud = new UserDao(ConnectionProvider.getConnection());

				User userid = ud.getUserById(p.getUserId());
				%>

			</div>
			<div class="card-footer bg-primary text-center">
				<a href="#!"
					onclick="doLike(<%=p.getPid()%>,<%=userid.getId()%>)"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikesOnPost(p.getPid())%></span></a>
				<a href="showblogpage.jsp?pId=<%=p.getPid()%> "
					class="btn btn-outline-light btn-sm">Read More...</a> <a href="#!"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o">20</i></a>

			</div>


			

		</div>

	</div>

	<%
	}
	%>
</div>