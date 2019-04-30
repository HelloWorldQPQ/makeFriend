package com.qpq.pojo;

import java.util.List;

public class Page<T> {
	private int rowcount;
	private int pagecount;
	private int pagesize;
	private int currpage;
	private List<T> data;
		
	
	public int getRowcount() {
		return rowcount;
	}
	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getCurrpage() {
		return currpage;
	}
	public void setCurrpage(int currpage) {
		this.currpage = currpage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public Page() {
		super();
	}
	public Page(int pagesize, int currpage) {
		
		this.pagesize = pagesize;
		this.currpage = currpage;
	}
	@Override
	public String toString() {
		return "Page [rowcount=" + rowcount + ", pagecount=" + pagecount + ", pagesize=" + pagesize + ", currpage="
				+ currpage + ", data=" + data + "]";
	}
	
	
}
