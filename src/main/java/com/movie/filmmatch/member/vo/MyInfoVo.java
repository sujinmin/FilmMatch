package com.movie.filmmatch.member.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("myinfo")
public class MyInfoVo {
	
	int no;
	int addr_idx;
	int mem_idx;
	int zipcode;
	String addr_street;
	String addr_detail;

	

	
	
		
	

	
}
