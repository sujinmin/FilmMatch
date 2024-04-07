package com.movie.filmmatch.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Vedio")
public class VedioVo {

	String name;
	String key;
	
	public VedioVo(String name, String key) {
		this.name = name;
		this.key = key;
	}
	
	
}
