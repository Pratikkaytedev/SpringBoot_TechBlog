package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDao;
import com.entities.Post;
import com.entities.User;
import com.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid")); 
		
		String pTitle = request.getParameter("ptitle");
		String pContent = request.getParameter("pcontent");
		String pCode = request.getParameter("pcode");
		
		
		
		HttpSession session = request.getSession();
		
		User user =(User)session.getAttribute("user");
		
		
		
		int pid = user.getId();
		
		/* out.println(pTitle+pContent+pCode+null+cid+pid); */
		
		
		 Post p = new Post(pTitle,pContent,pCode,null,cid,pid); 
		 
		 PostDao pd = new PostDao(ConnectionProvider.getConnection());
		 
		boolean a = pd.savePost(p);
		 
		
		 if(a) {
			 out.println("data added successfully");
			 session.setAttribute("postSuccess", "post added successfully");
			 response.sendRedirect("profile.jsp");
		 } else {
			 out.println("data failed");
		 }
		 
		
		
	}

}
