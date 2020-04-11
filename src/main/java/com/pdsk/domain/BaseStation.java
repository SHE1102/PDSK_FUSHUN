package com.pdsk.domain;

public class BaseStation {
	private String id;
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BaseStation(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public BaseStation() {
		super();
	}

}
