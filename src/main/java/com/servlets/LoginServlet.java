package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;
import com.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		/* fetch Username and password from request */
		
		String useremail = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
	User user=	dao.getUserByEmailAndPassword(useremail, password);
	
	if(user==null) {
		
		HttpSession session = request.getSession();
		
		
		Message msg = new Message("Invalid Details try again later ","error","alert-danger");
		session.setAttribute("msg", msg);
		
		response.sendRedirect("login.jsp");
	}else {
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		response.sendRedirect("profile.jsp");
	}
		
	}

}
