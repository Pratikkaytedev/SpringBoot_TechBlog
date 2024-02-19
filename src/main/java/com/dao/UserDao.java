package com.dao;

import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.annotation.MultipartConfig;

import com.entities.User;

@MultipartConfig
public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	/* method to insert user to database */

	public boolean saveUser(User user) {

		boolean f = false;

		try {
			String sql = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pst = this.con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());

			pst.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	/* Login by username and password */

	public User getUserByEmailAndPassword(String email, String password) {

		User user = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				user = new User();

				String ids = rs.getString("id");
				int id = Integer.parseInt(ids);
				user.setId(id);

				String name = rs.getString("name");
				user.setName(name);

				String emails = rs.getString("email");
				user.setEmail(emails);

				String pass = rs.getString("password");
				user.setPassword(password);

				String gender = rs.getString("gender");
				user.setGender(gender);

				String about = rs.getString("about");
				user.setAbout(about);

				user.setDateTime(rs.getTimestamp("regdate"));

				user.setProfile(rs.getString("profile"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/* method to update user by ID into database */
	public Boolean updateUser(User user) {

		int id = user.getId();
		String editName = user.getName();
		String editEmail = user.getEmail();
		String editPassword = user.getPassword();
		String editGender = user.getGender();
		String editAbout = user.getAbout();

		boolean f = false;

		try {
			String sql = "update user set name=?,email=?,password=?,gender=?,about=? where id=? ";

			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, editName);
			pst.setString(2, editEmail);
			pst.setString(3, editPassword);
			pst.setString(4, user.getGender());
			pst.setString(5, editAbout);
			pst.setInt(6, id);

			pst.executeUpdate();
			f = true;

		} catch (Exception e) {

		}

		return f;

	}
	
	
	
	
	/* get users  by userid */

	public User getUserById(int userId) {

		User user = new User();

		try {
			String sql = "select * from user where id=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, userId);
			

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				

				String ids = rs.getString("id");
				int id = Integer.parseInt(ids);
				user.setId(id);

				String name = rs.getString("name");
				user.setName(name);

				String emails = rs.getString("email");
				user.setEmail(emails);

				String pass = rs.getString("password");
				user.setPassword(pass);

				String gender = rs.getString("gender");
				user.setGender(gender);

				String about = rs.getString("about");
				user.setAbout(about);

				user.setDateTime(rs.getTimestamp("regdate"));

				user.setProfile(rs.getString("profile"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}


}
