package com.web.jasperReports;

public class JasperContainer {

	private String date;
	private Integer count;
//	private String species;
//	private Integer speciesCount;
	private Integer total;

	public JasperContainer() {
	}

	public JasperContainer(String date, Integer count, Integer total) {
		this.date = date;
		this.count = count;
//		this.species = species;
//		this.speciesCount = speciesCount;
		this.total = total;

	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

}
