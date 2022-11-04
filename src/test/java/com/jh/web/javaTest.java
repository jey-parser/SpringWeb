package com.jh.web;

public class javaTest {

	public static void main(String[] args) {
		double pageNum = (double)30/10.0;
		System.out.println(pageNum);
		if(pageNum%10>0) {
			pageNum = Math.ceil(pageNum);
		}
		System.out.println(pageNum);
		
		
		
	}

}
