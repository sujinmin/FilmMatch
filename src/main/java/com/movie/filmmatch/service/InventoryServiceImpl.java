package com.movie.filmmatch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.filmmatch.dao.inventory.Inventory_In_Dao;
import com.movie.filmmatch.dao.inventory.Inventory_Out_Dao;
import com.movie.filmmatch.dao.inventory.Inventory_Remain_Dao;
import com.movie.filmmatch.vo.InventoryVo;

@Service
public class InventoryServiceImpl implements InventoryService {

	//@aAutowire를 사용하는것보다 수동으로 연결해주는 것이 좋다.
	//constroctor Injection을사용하는것이 좋다.
	@Autowired
	Inventory_In_Dao inventory_in_dao;

	@Autowired
	Inventory_Out_Dao inventory_out_dao;

	@Autowired
	Inventory_Remain_Dao inventory_remain_dao;
	

	@Override
	public Map<String, List<InventoryVo>> selectList() {
		
		Map<String, List<InventoryVo>> map = new HashMap<String, List<InventoryVo>>();
		
		//List<ProductVo> in_List = inventory_in_dao.selectList(); //변수를 사용하지 않고 바로적어주었다.
		map.put("in_list", inventory_in_dao.selectList()); //입고목록
		map.put("out_list", inventory_out_dao.selectList()); //출고목록
		map.put("remain_list", inventory_remain_dao.selectList()); //재고목록
		
		return map;
	}

	@Override
	public int insert_in(InventoryVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		//1.입고등록
		int res = inventory_in_dao.insert(vo);
		//2.현재입고상품정보를 재고테이블에서 구한다,
		InventoryVo remainVo = inventory_remain_dao.selectOneFromName(vo.getName());
		
		if(remainVo==null) { //재고목록에 없으면 등록(insert)
			res = inventory_remain_dao.insert(vo);
		}else {
			//재고수량 = 재고수량 + 입고수량
			int cnt = remainVo.getCnt() + vo.getCnt();
			remainVo.setCnt(cnt);
			
			res = inventory_remain_dao.update(remainVo);
		}
		
		//인위적 예외
//		if(true) throw new Exception("일부러");
		
		return res;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insert_out(InventoryVo vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("실행!");
		//1.출고등록
		int res = inventory_out_dao.insert(vo);
		//재고 상황을 체크하지 않아도 된다.
		//2.재고목록에 출고상품이 있는지 얻어온다.
		InventoryVo remainVo = inventory_remain_dao.selectOneFromName(vo.getName());
		
		if(remainVo==null){
	
			throw new Exception("remain_not"); //재고테이블에 해당삼품이 없는경우
		
		}
		//출고수량 > 재고수량
		if(vo.getCnt() > remainVo.getCnt()) {
			
			throw new Exception("remain_lack"); //재고수량이 부족한 경우 /list.do?error=remain_lack			
		}
		
		// 재고수량 = 재고수량 - 출고수량
		int cnt = remainVo.getCnt() - vo.getCnt();
		if(cnt>0) {   //재고가 남은 경우
			remainVo.setCnt(cnt);
			res=inventory_remain_dao.update(remainVo);
			}
			else {  //재고가 0이 되는 경우
			res=inventory_remain_dao.delete(remainVo.getIdx());	
			}
		
		return res;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int delete_in(int idx) throws Exception { //입고취소
		int res=0;
		//System.out.println("입고취소");
		//입고목록 idx
		InventoryVo inVo=inventory_in_dao.selectOneFromIdx(idx);
		
		
		res=inventory_in_dao.delete(idx);
		
		//재고 상품명 조회
		InventoryVo remainVo= inventory_remain_dao.selectOneFromName(inVo.getName());
		
		// 재고 목록에 상품이 존재하지 않는 경우
		if(remainVo==null) {
			throw new Exception("remain_empty");	
		}
		
		
		// 재고 목록 - 입고목록
		int cnt=remainVo.getCnt()-inVo.getCnt();
		remainVo.setCnt(cnt);
		System.out.println(cnt);
		
		if(cnt<0) { //제거할 입고 목록 수-감소시킬 재고 목록 수가 마이너스 인 경우
			throw new Exception("remain_minus");
		}
		
		// 재고 수가 남은 경우
		if(cnt>0)	{res= inventory_remain_dao.update(remainVo);
		System.out.println("0보다 큼");
		}
		else  {//재고 수가 0이되는 경우
		//해당 idx를 삭제	
		System.out.println("0이다");
		res= inventory_remain_dao.delete(remainVo.getIdx());
		}
		
		return res;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int delete_out(int idx) throws Exception { //출고취소
		int res=0;
		
		//출고목록 idx
		InventoryVo outVo=inventory_out_dao.selectOneFromIdx(idx);
		
		
		res=inventory_out_dao.delete(idx);
		
		//재고 상품명 조회
		InventoryVo remainVo=inventory_remain_dao.selectOneFromName(outVo.getName());
		
		//재고목록에 해당 상품이 없을 경우(상품 재 생성)
		if(remainVo==null) {
			//재 등록할 출고목록의 정보를 재고목록 vo에게 재 전송
			remainVo=outVo;
			// 재고목록에 상품 재등록
			res=inventory_remain_dao.insert(remainVo);
		}
		
		else  //재고 목록에 상품이 존재하여 값을 추가시켜야 할 경우
		{
		// 재고 목록 + 입고목록
		int cnt=remainVo.getCnt()+outVo.getCnt();
		remainVo.setCnt(cnt);
		res=inventory_remain_dao.update(remainVo);
		}
		
		return res;
	}

}
