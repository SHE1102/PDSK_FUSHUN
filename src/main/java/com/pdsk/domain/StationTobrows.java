package com.pdsk.domain;

import java.util.Date;

/**
 * cbq 在线监测
 */
public class StationTobrows {
	private String id;// 序号
	private String name;// 名字
	private double deltax;// WGS84坐标系的x坐标差（坐标向量）
	private double deltay;// WGS84坐标系的y坐标差（坐标向量）
	private double deltaz;// WGS84坐标系的z坐标差（坐标向量）

	private double sDx;// 深圳坐标系的x坐标差
	private double sDy;// 深圳坐标系的y坐标差
	private double sDh;// 深圳坐标系的z坐标差

	private double sKxSingleChange;// X坐标差单次变化量*1000
	private double sKySingleChange;// Y坐标差单次变化量*1000
	private double sDhSingleChange;// 深圳坐标系（h坐标差与上次的）单次变化量*1000

	private double sDhAccChange;// 深圳坐标系下h坐标差的累积变化量*1000
	private double sKxAccChange;// X坐标差的累积变化量 *1000
	private double SKyAccChange;// Y坐标差的累积变化量*1000

	private double original_SDz;// 深圳坐标系z坐标
	private double original_SKx;// 水库坐标系x坐标
	private double original_SKY;// 水库坐标系y坐标

	private double sKx;
	private double sKy;

	private String recordTime;// 时间
	private Date recordTime1;// 时间

	public Date getRecordTime1() {
		return recordTime1;
	}

	public void setRecordTime1(Date recordTime1) {
		this.recordTime1 = recordTime1;
	}

	private double original_Scx;// 首次值
	private double original_ScY;// 首次值
	private double original_Scz;// 首次值

	public String getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

	public double getOriginal_Scx() {
		return original_Scx;
	}

	public void setOriginal_Scx(double original_Scx) {
		this.original_Scx = original_Scx;
	}

	public double getOriginal_ScY() {
		return original_ScY;
	}

	public void setOriginal_ScY(double original_ScY) {
		this.original_ScY = original_ScY;
	}

	public double getOriginal_Scz() {
		return original_Scz;
	}

	public void setOriginal_Scz(double original_Scz) {
		this.original_Scz = original_Scz;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getsKxSingleChange() {
		return sKxSingleChange;
	}

	public void setsKxSingleChange(double sKxSingleChange) {
		this.sKxSingleChange = sKxSingleChange;
	}

	public double getsKySingleChange() {
		return sKySingleChange;
	}

	public void setsKySingleChange(double sKySingleChange) {
		this.sKySingleChange = sKySingleChange;
	}

	public double getsDhSingleChange() {
		return sDhSingleChange;
	}

	public void setsDhSingleChange(double sDhSingleChange) {
		this.sDhSingleChange = sDhSingleChange;
	}

	public double getsDhAccChange() {
		return sDhAccChange;
	}

	public void setSDhAccChange(double sDhAccChange) {
		this.sDhAccChange = sDhAccChange;
	}

	public double getsKxAccChange() {
		return sKxAccChange;
	}

	public void setSKxAccChange(double sKxAccChange) {
		this.sKxAccChange = sKxAccChange;
	}

	public double getsKyAccChange() {
		return SKyAccChange;
	}

	public void setSKyAccChange(double sKyAccChange) {
		SKyAccChange = sKyAccChange;
	}

	public double getOriginal_SDz() {
		return original_SDz;
	}

	public void setOriginal_SDz(double original_SDz) {
		this.original_SDz = original_SDz;
	}

	public double getOriginal_SKx() {
		return original_SKx;
	}

	public void setOriginal_SKx(double original_SKx) {
		this.original_SKx = original_SKx;
	}

	public double getOriginal_SKY() {
		return original_SKY;
	}

	public void setOriginal_SKY(double original_SKY) {
		this.original_SKY = original_SKY;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getDeltax() {
		return deltax;
	}

	public void setDeltax(double deltax) {
		this.deltax = deltax;
	}

	public double getDeltay() {
		return deltay;
	}

	public void setDeltay(double deltay) {
		this.deltay = deltay;
	}

	public double getDeltaz() {
		return deltaz;
	}

	public void setDeltaz(double deltaz) {
		this.deltaz = deltaz;
	}

	public double getsDx() {
		return sDx;
	}

	public void setsDx(double sDx) {
		this.sDx = sDx;
	}

	public double getsDy() {
		return sDy;
	}

	public void setsDy(double sDy) {
		this.sDy = sDy;
	}

	public double getsDh() {
		return sDh;
	}

	public void setsDh(double sDh) {
		this.sDh = sDh;
	}

	public double getsKx() {
		return sKx;
	}

	public void setsKx(double sKx) {
		this.sKx = sKx;
	}

	public double getsKy() {
		return sKy;
	}

	public void setsKy(double sKy) {
		this.sKy = sKy;
	}

	public StationTobrows() {
	}

	public StationTobrows(String id, String name, double deltax, double deltay, double deltaz, double sDx, double sDy,
			double sDh, double sKxSingleChange, double sKySingleChange, double sDhSingleChange, double sDhAccChange,
			double sKxAccChange, double sKyAccChange, double original_SDz, double original_SKx, double original_SKY,
			String recordTime, double original_Scx, double original_ScY, double original_Scz) {
		super();
		this.id = id;
		this.name = name;
		this.deltax = deltax;
		this.deltay = deltay;
		this.deltaz = deltaz;
		this.sDx = sDx;
		this.sDy = sDy;
		this.sDh = sDh;
		this.sKxSingleChange = sKxSingleChange;
		this.sKySingleChange = sKySingleChange;
		this.sDhSingleChange = sDhSingleChange;
		this.sDhAccChange = sDhAccChange;
		this.sKxAccChange = sKxAccChange;
		SKyAccChange = sKyAccChange;
		this.original_SDz = original_SDz;
		this.original_SKx = original_SKx;
		this.original_SKY = original_SKY;
		this.recordTime = recordTime;
		this.original_Scx = original_Scx;
		this.original_ScY = original_ScY;
		this.original_Scz = original_Scz;
	}

	@Override
	public String toString() {
		//<span style='color: red;'>001</span>
		return "<br/>"+"站点:"+name+"<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +" x方向:" + sKxAccChange + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y方向:" + SKyAccChange + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;h方向:"+ sDhAccChange +"<br/>";
	}
	
	


}
