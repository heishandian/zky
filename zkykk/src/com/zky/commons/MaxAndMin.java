package com.zky.commons;

public class MaxAndMin {
	private int max;
	private int min;

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	@Override
	public String toString() {
		return "MaxAndMin [max=" + max + ", min=" + min + "]";
	}

	public MaxAndMin(int min, int max) {
		super();
		this.max = max;
		this.min = min;
	}

	public MaxAndMin() {
		super();
	}
	
	

}
