package com.pdsk.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
public class StationQueryInfo {
    private String pageModel;
    private String model;//查询模式
    private String threshold;//阈值
    private String thresholdUse;//使用阈值
    private String X;
    private String Y;
    private String H;
    private String dateModel;
    private String timeStart;
    private String timeEnd;
    private String baseStationName;//基准站
    private String monitorStationName;//监测站
    private String pairName;
    private String currPageNum;//接受jsp页面，设置为String
    private String stateNoise; //状态噪声
    private String obsNoise;//观测噪声
    private int pageStart;
    private int pageSize;
    private List<Integer> conditionList = new ArrayList<>();

    public StationQueryInfo(){
    }

    public StationQueryInfo(String model, String threshold, String x, String y, String h, String dateModel,
                            String timeStart, String timeEnd, String baseStationName,String monitorStationName,
                            String currPageNum) {
        this.model = model;
        this.threshold = threshold;
        X = x;
        Y = y;
        H = h;
        this.dateModel = dateModel;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.baseStationName = baseStationName;
        this.monitorStationName = monitorStationName;
        this.currPageNum = currPageNum;
    }

    /*public StationQueryInfo(String model, String threshold, String x, String y, String h,
                            String timeStart, String timeEnd, String baseStationName,String pairName) {
        this.model = model;
        this.threshold = threshold;
        X = x;
        Y = y;
        H = h;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.baseStationName = baseStationName;
        this.pairName = pairName;

        conditionList.add(Integer.parseInt(X));
        conditionList.add(Integer.parseInt(Y));
        conditionList.add(Integer.parseInt(H));
    }*/

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getMonitorStationName() {
        return monitorStationName;
    }

    public void setMonitorStationName(String monitorStationName) {
        this.monitorStationName = monitorStationName;
    }

    public String getBaseStationName() {
        return baseStationName;
    }

    public void setBaseStationName(String baseStationName) {
        this.baseStationName = baseStationName;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getDateModel() {
        return dateModel;
    }

    public void setDateModel(String dateModel) {
        this.dateModel = dateModel;
    }

    public String getThreshold() {
        return threshold;
    }

    public void setThreshold(String threshold) {
        this.threshold = threshold;
    }

    public String getThresholdUse() {
        return thresholdUse;
    }

    public void setThresholdUse(String thresholdUse) {
        this.thresholdUse = thresholdUse;
    }

    public String getX() {
        return X;
    }

    public void setX(String x) {
        X = x;
    }

    public String getY() {
        return Y;
    }

    public void setY(String y) {
        Y = y;
    }

    public String getH() {
        return H;
    }

    public void setH(String h) {
        H = h;
    }

    public String getCurrPageNum() {
        return currPageNum;
    }

    public void setCurrPageNum(String currPageNum) {
        this.currPageNum = currPageNum;
    }

    public int getPageStart() {
        return pageStart;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getPageModel() {
        return pageModel;
    }

    public void setPageModel(String pageModel) {
        this.pageModel = pageModel;
    }

    public String getPairName() {
        return pairName;
    }

    public void setPairName(String pairName) {
        this.pairName = pairName;
    }

    public void setConditionList() {
        conditionList.add(Integer.parseInt(X));
        conditionList.add(Integer.parseInt(Y));
        conditionList.add(Integer.parseInt(H));
    }

    public String getStateNoise() {
        return stateNoise;
    }

    public void setStateNoise(String stateNoise) {
        this.stateNoise = stateNoise;
    }

    public String getObsNoise() {
        return obsNoise;
    }

    public void setObsNoise(String obsNoise) {
        this.obsNoise = obsNoise;
    }
}
