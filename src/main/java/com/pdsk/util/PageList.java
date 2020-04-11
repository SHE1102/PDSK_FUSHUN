package com.pdsk.util;

import java.util.ArrayList;
import java.util.List;

import com.pdsk.domain.StationTobrows;

public class PageList {
	private int allRecordNO;// 总记录数
	private int perPageNO = 15;// 每页显示记录数
	private int allPageNO;// 总页数(总记录数/每页显示记录数)
	private int currPageNO = 1;// 显示的当前页号
  //  private int totalRows = 0; // 总数据数
    private int pageStartRow = 0;// 每页的起始数
    private int pageEndRow = 0; // 每页显示数据的终止数
	
	private List<StationTobrows> userList = new ArrayList<StationTobrows>();// 当前页的所有信息
	public int getAllRecordNO() {
		return allRecordNO;
	}
	
	
	//总页数
	public void setAllRecordNO(int allRecordNO) {
		this.allRecordNO = allRecordNO;
		if (this.allRecordNO % this.perPageNO == 0) {
			this.allPageNO = this.allRecordNO / this.perPageNO;
		} else {
			this.allPageNO = this.allRecordNO / this.perPageNO + 1;
		}
	}
	public int getPageStartRow() {
		return pageStartRow;
	}


	public void setPageStartRow(int pageStartRow) {
		this.pageStartRow = pageStartRow;
	}


	public int getPageEndRow() {
		return pageEndRow;
	}


	public void setPageEndRow(int pageEndRow) {
		this.pageEndRow = pageEndRow;
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

}
