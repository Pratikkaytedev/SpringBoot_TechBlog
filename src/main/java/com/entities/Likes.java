package com.entities;

public class Likes {
	
	private int lId;
	private int pId;
	private int uId;
	
	public Likes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Likes(int lId, int pId, int uId) {
		super();
		this.lId = lId;
		this.pId = pId;
		this.uId = uId;
	}
	
	
	
	public Likes(int pId, int uId) {
		super();
		this.pId = pId;
		this.uId = uId;
	}
	
	public Likes(int pId) {
		super();
		this.pId = pId;
		
	}
	
	

	public int getlId() {
		return lId;
	}

	public void setlId(int lId) {
		this.lId = lId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "Likes [lId=" + lId + ", pId=" + pId + ", uId=" + uId + "]";
	}
	
	

}
