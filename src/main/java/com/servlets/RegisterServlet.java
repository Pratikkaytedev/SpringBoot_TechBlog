package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.mysql.cj.Session;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String check = request.getParameter("check");

		if (check == null) 
		{
			out.println("box not checked");
		} 
		else 
		{
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			/* Create user object and set all data to that object. */
			
			User user = new User(name,email,password,gender,about);
			
			
			/* Create  userdao object */
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
				out.println("done");
				
				session.setAttribute("registrationsuccess", "Registration Successfully into database");

				
				response.sendRedirect("login.jsp");
				
			}else {
				out.println("failed");
				session.setAttribute("registrationfailed", "Registration Failed ");
				response.sendRedirect("register.jsp");

			}
			
		}

	}

}
