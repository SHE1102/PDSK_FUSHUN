package com.pdsk.domain;

public class TIMEs {
	private int id ;
	private String time;

	public TIMEs(int id, String time) {
		super();
		this.id = id;
		this.time = time;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}


}
