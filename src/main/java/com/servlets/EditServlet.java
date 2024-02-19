package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.entities.User;
import com.helper.ConnectionProvider;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		/* Fetch all Data */

		String editName = request.getParameter("editName");
		String editEmail = request.getParameter("editEmail");
		String editPassword = request.getParameter("editPassword");
		String editAbout = request.getParameter("editAbout");

		/* Get the user from the session */

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		user.setName(editName);
		user.setEmail(editEmail);
		user.setPassword(editPassword);
		user.setAbout(editAbout);

		UserDao ud = new UserDao(ConnectionProvider.getConnection());

		boolean ans = ud.updateUser(user);

		if (ans) {
			session.setAttribute("updated", "updated successfully to db");
		
			response.sendRedirect("profile.jsp");
		} else {
			out.println("updated failed");
		}

	}

}
