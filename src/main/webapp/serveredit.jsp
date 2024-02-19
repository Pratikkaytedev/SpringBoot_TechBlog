<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%

String editName = request.getParameter("editName");
String editEmail = request.getParameter("editEmail");
String editPassword = request.getParameter("editPassword");
String editAbout = request.getParameter("editAbout");

Part part = request.getPart("editProfile");

String imageName = part.getSubmittedFileName();

/* Get the user from the session */


User user =	(User)session.getAttribute("user");

user.setName(editName);
user.setEmail(editEmail);
user.setPassword(editPassword);
user.setAbout(editAbout);
user.setProfile(imageName);

UserDao ud = new UserDao(ConnectionProvider.getConnection());

boolean ans = ud.updateUser(user);

if(ans) {
	out.println("updated to db");
}else {
	out.println("updated failed");
}






%>