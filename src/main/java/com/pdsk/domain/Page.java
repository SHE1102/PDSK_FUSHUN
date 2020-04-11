package com.pdsk.domain;

import java.util.ArrayList;
import java.util.List;


public class Page {
	// 分页类
	private int allRecordNO;// 总记录数
	private int perPageNO = 15;// 每页显示记录数
	private int allPageNO;// 总页数(总记录数/每页显示记录数)
	private int currPageNO = 1;// 显示的当前页号
	private List<StationTobrows> userList = new ArrayList<StationTobrows>();// 当前页的所有信息
	private List<User> userList1 = new ArrayList<User>();// 当前页的所有信息
	private List<SiteQuery> siteQuerylist = new ArrayList<SiteQuery>();// 站点管理信息

	public List<User> getUserList1() {
		return userList1;
	}

	public void setUserList1(List<User> userList1) {
		this.userList1 = userList1;
	}

	public Page() {
	}

	public int getAllRecordNO() {
		return allRecordNO;
	}

	public void setAllRecordNO(int allRecordNO) {
		this.allRecordNO = allRecordNO;
		if (this.allRecordNO % this.perPageNO == 0) {
			this.allPageNO = this.allRecordNO / this.perPageNO;
		} else {
			this.allPageNO = this.allRecordNO / this.perPageNO + 1;
		}
	}

	public int getPerPageNO() {
		return perPageNO;
	}

	public void setPerPageNO(int perPageNO) {
		this.perPageNO = perPageNO;
	}

	public int getAllPageNO() {
		return allPageNO;
	}

	public void setAllPageNO(int allPageNO) {
		this.allPageNO = allPageNO;
	}

	public int getCurrPageNO() {
		return currPageNO;
	}

	public void setCurrPageNO(int currPageNO) {
		this.currPageNO = currPageNO;
	}

	public List<StationTobrows> getUserList() {
		return userList;
	}

	public void setUserList(List<StationTobrows> userList) {
		this.userList = userList;
	}

	public List<SiteQuery> getSiteQuerylist() {
		return siteQuerylist;
	}

	public void setSiteQuerylist(List<SiteQuery> siteQuerylist) {
		this.siteQuerylist = siteQuerylist;
	}

}
