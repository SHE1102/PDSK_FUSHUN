package com.pdsk.domain;

import java.util.List;

//测站浏览
public class OnLineMonitoring {
	private String name;// 流动站名
	private String originalSKx;// 水库坐标系x坐标
	private String originalSKY;// 水库坐标系y坐标
	private String originalSDz;// 深圳坐标系z坐标
	private String timeperiod;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOriginalSKx() {
		return originalSKx;
	}

	public void setOriginalSKx(String originalSKx) {
		this.originalSKx = originalSKx;
	}

	public String getOriginalSKY() {
		return originalSKY;
	}

	public void setOriginalSKY(String originalSKY) {
		this.originalSKY = originalSKY;
	}

	public String getOriginalSDz() {
		return originalSDz;
	}

	public void setOriginalSDz(String originalSDz) {
		this.originalSDz = originalSDz;
	}

	public String getTimeperiod() {
		return timeperiod;
	}

	public void setTimeperiod(String timeperiod) {
		this.timeperiod = timeperiod;
	}

	public OnLineMonitoring() {
		super();
	}

}
