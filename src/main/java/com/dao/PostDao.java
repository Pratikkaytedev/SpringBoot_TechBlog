package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.entities.Category;
import com.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	/* Get all posts by Categories */
	public ArrayList<Category> getAllCategories() {

		ArrayList<Category> list = new ArrayList<>();

		try {
			String sql = "select * from categories";

			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");

				Category c = new Category(cid, name, description);

				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/* Save the post */
	public boolean savePost(Post p) {
		boolean f = false;

		try {

			String sql = "insert into posts (title,content,code,catId,userid) values (?,?,?,?,?)";

			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, p.getpTitle());
			pst.setString(2, p.getpContent());
			pst.setString(3, p.getpCode());
			pst.setInt(4, p.getCatId());
			pst.setInt(5, p.getUserId());

			int i = pst.executeUpdate();

			if (i > 0) {

				f = true;
			} else {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	/* Get All the Posts */
	public List<Post> getAllPosts(){
		
		List<Post> list = new ArrayList<>();
		
		try {
			
			String sql = "select * from posts order by pid desc ";
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String title = rs.getString("title");
				String contenet = rs.getString("content");
				String code = rs.getString("code");
				Timestamp date = rs.getTimestamp("date");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userid");
				
				Post p = new Post(pid, title, contenet, code, null, catId, userId);
				
				list.add(p);
				
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	/* Get Post By CatId */
	
	public List<Post> getPostByCatId(int catId){
		
		List<Post> list = new ArrayList<>();
		
		
		try {
			
			String sql = "select * from posts where catId= ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setInt(1, catId);
			 
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String title = rs.getString("title");
				String contenet = rs.getString("content");
				String code = rs.getString("code");
				String date = rs.getString("date");
				
				Post p = new Post(title, contenet, code, null, catId, pid);
				
				list.add(p);
				
				
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	
	
	
	
/* Get Post By CatId */
	
/*
 * public List<Post> getPostByPostId(int pId){
 * 
 * List<Post> list = new ArrayList<>();
 * 
 * 
 * try {
 * 
 * String sql = "select * from posts where pid= ?";
 * 
 * PreparedStatement pst = con.prepareStatement(sql);
 * 
 * pst.setInt(1, pId);
 * 
 * 
 * ResultSet rs = pst.executeQuery();
 * 
 * while(rs.next()) {
 * 
 * int catId = rs.getInt("catId"); String title = rs.getString("title"); String
 * contenet = rs.getString("content"); String code = rs.getString("code");
 * Timestamp pdate = rs.getTimestamp("date");
 * 
 * Post p = new Post(title, contenet, code, pdate, pId, catId);
 * 
 * list.add(p);
 * 
 * }
 * 
 * }catch(Exception e) { e.printStackTrace(); }
 * 
 * return list; }
 */
	
	
	
	
	
	public Post getPostByPostId(int postId){
		
		Post p = null;
		
		try {
			String sql = "SELECT * from posts where pid=?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, postId);
			
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				Timestamp date = rs.getTimestamp("date");
				int cid = rs.getInt("catId");
				int userid = rs.getInt("userid");
				
			
				 p = new Post(pid, title, content, code, date, cid, userid);
				
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		
		return p;
	}
	
	
}
