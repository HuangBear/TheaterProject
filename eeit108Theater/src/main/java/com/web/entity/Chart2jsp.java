package com.web.entity;

import java.util.List;

public class Chart2jsp {
	List<Integer> listInteger;
	List<ChartContainer> listChartContainer;
	ChartContainer fir;
	ChartContainer sec;
	ChartContainer thi;

	public List<Integer> getListInteger() {
		return listInteger;
	}

	public void setListInteger(List<Integer> listInteger) {
		this.listInteger = listInteger;
	}

	public List<ChartContainer> getListChartContainer() {
		return listChartContainer;
	}

	public void setListChartContainer(List<ChartContainer> listChartContainer) {
		this.listChartContainer = listChartContainer;
	}

	public ChartContainer getFir() {
		return fir;
	}

	public void setFir(ChartContainer fir) {
		this.fir = fir;
	}

	public ChartContainer getSec() {
		return sec;
	}

	public void setSec(ChartContainer sec) {
		this.sec = sec;
	}

	public ChartContainer getThi() {
		return thi;
	}

	public void setThi(ChartContainer thi) {
		this.thi = thi;
	}

}
