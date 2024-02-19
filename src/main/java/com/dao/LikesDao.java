package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

public class LikesDao extends HttpServlet {

	private Connection con;

	public LikesDao(Connection con) {
		this.con = con;
	}

	/* Method to insert into database */

	public boolean insertLikes(int pid, int uid) {

		boolean f = false;
		try {

			String sql = "insert into likes (pid,uid) values(?,?)";
			PreparedStatement pst = this.con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);

			pst.executeUpdate();

			f = true;

			pst.setString(uid, sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public int countLikesOnPost(int pid) {

		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM `likes` WHERE pid=?";
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, pid);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);

			} else {

			}

		} catch (Exception e) {

		}

		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {

		boolean f = false;
		try {
			String sql = "select * from like where pid=? AND uid=?";
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, pid);
			pst.setInt(2, uid);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	public boolean delteLiked(int pid, int uid) {

		boolean f = false;
		try {
			String sql = "delete * from like where pid=? AND uid=?";
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, pid);
			pst.setInt(2, uid);

			int rs = pst.executeUpdate();
			f = true;
		} catch (Exception e) {

		}

		return f;
	}

}
