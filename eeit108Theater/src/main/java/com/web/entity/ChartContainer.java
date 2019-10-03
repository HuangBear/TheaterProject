package com.web.entity;

public class ChartContainer {

	String chartKey;
	Integer chartValue;

	public void setChartMap(String chartKey, Integer chartValue) {
		this.chartKey = chartKey;
		this.chartValue = chartValue;
	}

	public String getChartKey() {
		return chartKey;
	}

	public void setChartKey(String chartKey) {
		this.chartKey = chartKey;
	}

	public Integer getChartValue() {
		return chartValue;
	}

	public void setChartValue(Integer chartValue) {
		this.chartValue = chartValue;
	}

}
