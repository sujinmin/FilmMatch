package com.movie.filmmatch.admin.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("inventory")
public class InventoryVo {

	
	int idx;
	String name;
	int cnt;
	String regdate;

}
