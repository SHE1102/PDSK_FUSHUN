package com.pdsk.util;

import java.util.ArrayList;
import java.util.List;

import com.pdsk.domain.SiteQuery;
import com.pdsk.domain.StationTobrows;
import com.pdsk.domain.User;

public class Page {
	// 分页类
	private int totalRecordSize;// 总记录数
	private int currPageNum = 1;// 显示的当前页号
	private int pageSize = 15;// 每页显示记录数
	private int totalPageSize;// 总页数(总记录数/每页显示记录数)

	private List<User> userList = new ArrayList<>();// 当前页的所有信息
	private List<SiteQuery> siteInfoList = new ArrayList<>();// 站点信息
	private List<StationTobrows> stationList = new ArrayList<>();// 当前页的所有信息

	public Page() {
	}

	public int getTotalRecordSize() {
		return totalRecordSize;
	}

	public void setTotalRecordSize(int totalRecordSize) {
		this.totalRecordSize = totalRecordSize;
		if (this.totalRecordSize % this.pageSize == 0) {
			this.totalPageSize = this.totalRecordSize / this.pageSize;
		} else {
			this.totalPageSize = this.totalRecordSize / this.pageSize + 1;
		}
	}

	public int getCurrPageNum() {
		return currPageNum;
	}
	public void setCurrPageNum(int currPageNum) {
		this.currPageNum = currPageNum;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPageSize() {
		return totalPageSize;
	}

	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}

	public List<SiteQuery> getSiteInfoList() {
		return siteInfoList;
	}

	public void setSiteInfoList(List<SiteQuery> siteInfoList) {
		this.siteInfoList = siteInfoList;
	}

	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<StationTobrows> getStationList() {
		return stationList;}

	public void setStationList(List<StationTobrows> stationList) {
		this.stationList = stationList;
	}



}
