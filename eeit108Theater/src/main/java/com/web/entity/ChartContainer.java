package com.web.entity;

public class ChartContainer {

	String chartKey;
	Integer chartValue;
	Integer count = 0;

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count += count;
	}

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
