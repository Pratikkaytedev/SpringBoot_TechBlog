<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
	String check = request.getParameter("check");

	if (check == null) {
		session.setAttribute("checkbox", "Please Agree terms and conditions before submit ");
		response.sendRedirect("register.jsp");

	} else {
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");

		/* Create user object and set all data to that object. */

		User user = new User(name, email, password, gender, about);

		/* Create  userdao object */
		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (dao.saveUser(user)) {
			session.setAttribute("registrationsuccess", "Registration Successfully into database");

			response.sendRedirect("login.jsp");

		} else {
			session.setAttribute("registrationfailed", "Registration Failed ");

			response.sendRedirect("register.jsp");
		}

	}
	%>


</body>
</html>