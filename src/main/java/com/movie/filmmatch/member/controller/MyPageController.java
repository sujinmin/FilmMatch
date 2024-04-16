package com.movie.filmmatch.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.filmmatch.goods.service.GoodsService;
import com.movie.filmmatch.member.dao.MemberDao;
import com.movie.filmmatch.member.dao.MyInfoDao;
import com.movie.filmmatch.member.vo.MemberVo;
import com.movie.filmmatch.member.vo.MyInfoVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


	

@Controller
public class MyPageController{

 	@Autowired
    GoodsService goods_service;
	    
	@Autowired
	MemberDao member_dao;
	
	@Autowired
	MyInfoDao myinfo_dao;

    @Autowired
    ServletContext application;

	@Autowired
    HttpServletRequest request;

	@Autowired
    HttpServletResponse response;

	@Autowired
	HttpSession session;
	
	

	/**
	 * 마이페이지
	 * @return
	 */
	@RequestMapping("/mypage_form.do")
	public String mypage() {

		return "member/mypage_form";

	}

	/**
	 * 나의정보 페이지 (회원정보&주소목록) 띄우기
	 * @return
	 */
	@RequestMapping("/mypage_myinfo.do")
	public String mypage_myinfo(MyInfoVo info_vo,
								Model model) {

		MemberVo vo = (MemberVo) request.getSession().getAttribute("user");
		// System.out.println(vo);

			if (vo != null) {
				// 사용자 정보가 존재하면 해당 정보의 mem_idx를 주소 정보에 설정
				vo.setMem_idx(vo.getMem_idx());
			} else {
				// 세션에 사용자 정보가 없을 경우
				return "redirect:/member/login_form.do";
			}
		
		//회원정보의 주소 가져오기
		List<MyInfoVo> myinfo = myinfo_dao.selectList(vo.getMem_idx());				
		//System.out.println(list);
		

			if (vo == null) {
				return "redirect:../member/login_form.do?reason=session_timeout";
				// session_timeout: 세션만료(로그아웃상태)
			}
		
		model.addAttribute("vo", vo);
		model.addAttribute("myinfo", myinfo);
		//request.
		//System.out.println(list);

		return "member/mypage_myinfo";
	}

	/**
	 * 회원정보 수정
	 * @param vo
	 * @param model
	 * @return
	 */
    @RequestMapping("myinfo_modify.do")
    public String modify(MemberVo vo,
                         Model model) {
                            
							 
		String mem_ip = request.getRemoteAddr();
        vo.setMem_ip(mem_ip);
        
		member_dao.update(vo);
		
        // 업데이트된 회원 정보를 다시 조회
        MemberVo updatedMember = member_dao.selectOneFromIdx(vo.getMem_idx());
		
		
        // Model에 업데이트된 회원 정보 바인딩
        model.addAttribute("vo", updatedMember);
		
        return "member/mypage_myinfo";
    }


	/**
	 * 주소 등록 insert
	 * @return
	 */
	@RequestMapping("addr_insert.do")
	public String addr_insert(	MyInfoVo vo,
								Model model) {
		//System.out.println("여기가 addr_insert 임");
		//System.out.println(vo);
		//System.out.println(model);
		// 로그인 확인 세션
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user != null) {
			// 사용자 정보가 존재하면 해당 정보의 mem_idx를 주소 정보에 설정
			vo.setMem_idx(user.getMem_idx());
		} else {
			// 세션에 사용자 정보가 없을 경우
			return "redirect:/member/login_form.do";
		}
	
		try {
			
			myinfo_dao.insert(vo);
			
			// 마이페이지로 리다이렉트
			return "redirect:mypage_myinfo.do";
		} catch (DataIntegrityViolationException e) {
			// 데이터베이스 제약 조건 위반이 발생한 경우
			e.printStackTrace();
			
			// 오류 메시지 추가
			model.addAttribute("error", "Address information is invalid");
			
			// 오류 페이지로 이동
			return "error";
		}

		// String mem_idx = (int) session.getAttribute("user");
		// System.out.println(mem_idx);
		
		// myinfo_dao.insert(vo);
		
		// System.out.println(vo);
		
		
		// model.addAttribute("user", mem_idx);
		// model.addAttribute("vo", vo);
		
		// return "redirect:member/mypage_myinfo.do";
	}
	

	/**
	 * 주소수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("addr_update.do")
	public String addr_update(MyInfoVo vo,
								int addr_idx) {
		
		//System.out.println("수정컨트롤러 : " + vo);

		myinfo_dao.update(vo);

		return "redirect:mypage_myinfo.do";
	}
	
	/**
	 * 주소삭제
	 * @param addr_idx
	 * @return
	 */
	@RequestMapping("addr_delete.do")
	public String addr_delete(int addr_idx) {

		request.getSession().getAttribute("user");

		myinfo_dao.delete(addr_idx);

		return "redirect:mypage_myinfo.do";
	}

	@RequestMapping("test_modal.do")
	public String test_modal() {

		return "member/modal";
	}
	
	


}
