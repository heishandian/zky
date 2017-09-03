package com.zky.util;

public class SearchCondition {
	
	private int pointer;
	private int items;
	private String name;
	private String countycode;
	public int getPointer() {
		return pointer;
	}
	public void setPointer(int pointer) {
		this.pointer = pointer;
	}
	public int getItems() {
		return items;
	}
	public void setItems(int items) {
		this.items = items;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountycode() {
		return countycode;
	}
	public void setCountycode(String countycode) {
		this.countycode = countycode;
	}
	public SearchCondition(int pointer, int items, String name, String countycode) {
		super();
		this.pointer = pointer;
		this.items = items;
		this.name = name;
		this.countycode = countycode;
	}
	public SearchCondition() {
		super();
	}
	
	
	
}
