package com.qpq.pojo;

import java.util.List;

/**
 * 分页对象
 *
 * @author 极客营
 * @date 2018年10月18日
 */
public class Paging<T> {
	private int rowsCount; //总记录数
	private int pageSize;  //每页显示多少条
	private int currPage;  //当前页
	private int pageCount;  //总页数
	private List<T> data;  //分页的数据
	
	public Paging() {
	}
	
	
	public Paging(int rowsCount, int pageSize, int currPage, int pageCount, List<T> data) {
		super();
		this.rowsCount = rowsCount;
		this.pageSize = pageSize;
		this.currPage = currPage;
		this.pageCount = pageCount;
		this.data = data;
	}


	/**
	 * 常用的构造方法
	 * @param pageSize	
	 * @param currPage
	 */
	public Paging(int pageSize, int currPage) {
		super();
		this.pageSize = pageSize;
		this.currPage = currPage;
	}


	public int getRowsCount() {
		return rowsCount;
	}
	public void setRowsCount(int rowsCount) {
		this.rowsCount = rowsCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}


	@Override
	public String toString() {
		return "Paging [rowsCount=" + rowsCount + ", pageSize=" + pageSize + ", currPage=" + currPage + ", pageCount="
				+ pageCount + ", data=" + data + "]";
	}
	
}
