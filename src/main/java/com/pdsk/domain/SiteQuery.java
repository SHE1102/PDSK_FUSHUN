package com.pdsk.domain;

/*
 * 站点管理
 */
public class SiteQuery {
	private String id;
	private String name;// 测站
	private String originalsDx;// 编号
	private String originalsDy;
	private String originalsDh;
	private String originalsKx;
	private String originalsKy;
	private String mid;
	private StationTobrows stationTobrows;

	public SiteQuery() {

	}

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

	public String getOriginalsDx() {
		return originalsDx;
	}

	public void setOriginalsDx(String originalsDx) {
		this.originalsDx = originalsDx;
	}

	public String getOriginalsDy() {
		return originalsDy;
	}

	public void setOriginalsDy(String originalsDy) {
		this.originalsDy = originalsDy;
	}

	public String getOriginalsDh() {
		return originalsDh;
	}

	public void setOriginalsDh(String originalsDh) {
		this.originalsDh = originalsDh;
	}

	public String getOriginalsKx() {
		return originalsKx;
	}

	public void setOriginalsKx(String originalsKx) {
		this.originalsKx = originalsKx;
	}

	public String getOriginalsKy() {
		return originalsKy;
	}

	public void setOriginalsKy(String originalsKy) {
		this.originalsKy = originalsKy;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public StationTobrows getStationTobrows() {
		return stationTobrows;
	}

	public void setStationTobrows(StationTobrows stationTobrows) {
		this.stationTobrows = stationTobrows;
	}
	

}
