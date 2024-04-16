package com.movie.filmmatch.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.movie.filmmatch.admin.vo.InventoryVo;

@Service
public interface InventoryService {

	Map<String, List<InventoryVo>> selectList();	  //전체조회 (입고/출고/재고 조회)
	int insert_in(InventoryVo vo) throws Exception; //입고등록
	int insert_out(InventoryVo vo) throws Exception; //출고등록
	
	int delete_in(int idx) throws Exception; //입고취소
	//int delete_out(int idx) throws Exception; 
	int delete_out(int idx) throws Exception;//출고취소
	
	
}
