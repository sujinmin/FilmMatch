package com.movie.filmmatch.support.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.filmmatch.member.dao.MemberDao;
import com.movie.filmmatch.member.vo.MemberVo;
import com.movie.filmmatch.support.dao.CommentsDao;
import com.movie.filmmatch.support.dao.FaqDao;
import com.movie.filmmatch.support.dao.NoticeDao;
import com.movie.filmmatch.support.dao.ReviewerDao;
import com.movie.filmmatch.support.dao.SupportDao;
import com.movie.filmmatch.support.vo.CommentsVo;
import com.movie.filmmatch.support.vo.FaqVo;
import com.movie.filmmatch.support.vo.NoticeVo;
import com.movie.filmmatch.support.vo.ReviewerVo;
import com.movie.filmmatch.support.vo.SupportVo;
import com.movie.filmmatch.supportconstant.SupportConstant;
import com.movie.filmmatch.util.Support_Paging;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller // 스프링부트가 실행 될 때, 이 자바 클래스가 컨트롤러임을 인식시킴
@RequiredArgsConstructor
@RequestMapping("/support/")
public class SupportController {

	@Autowired
	SupportDao support_dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	MemberDao member_dao;

	@Autowired
	ReviewerDao reviewer_dao;

	@Autowired
	CommentsDao comments_dao;

	@Autowired
	NoticeDao notice_dao;

	@Autowired
	FaqDao faq_dao;

	@RequestMapping("home.do") // ~9090:support/home.do 고객센터 메인
	public String home(Model model) {

		List<FaqVo> faq_list = faq_dao.selectList(5);
		// System.out.println(faq_list.size());
		List<NoticeVo> notice_list = notice_dao.selectList(5);

		// System.out.println(list.size());
		model.addAttribute("faq_list", faq_list);
		model.addAttribute("notice_list", notice_list);

		return "support/support_home";

	}

	@RequestMapping("notice.do") // ~9090:support/home.do 고객센터 공지사항
	public String notice(Model model) {

		// 남아있는 조회수정보 삭제하고 목록보기 들어가면 조회수 증가됨
		session.removeAttribute("show");

		int nowPage = 1;

		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");

		if (search == null || search.isEmpty())
			search = "all";

		// page가 null이 아니거나 비어있지 않다면 //!=not
		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		// start시작페이지 / end 끝페이지 계산
		int start = (nowPage - 1) * SupportConstant.Notice.BLOCK_LIST + 1;
		int end = start + SupportConstant.Notice.BLOCK_LIST - 1;

		// 검색조건에 대한 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색 정보
		if (search.equals("name_subject_content")) {
			// 제목 + 내용으로 검색
			map.put("name", search_text);
			map.put("subject", search_text);
			map.put("content", search_text);

		} else if (search.equals("name")) {
			// 이름으로 검색
			map.put("name", search_text);

		} else if (search.equals("subject")) {
			// 제목으로 검색
			map.put("subject", search_text);

		} else if (search.equals("content")) {
			// 내용으로 검색
			map.put("content", search_text);
		}

		List<NoticeVo> list = notice_dao.selectConditionList(map);

		System.out.println("notice-size : " + list.size());
		// Page메뉴생성:조건별 전체게시물수
		int rowTotal = notice_dao.selectConditionRowTotal(map);

		// Page메뉴생성
		String search_filter = String.format("&search=%s&search_text=%s", search, search_text);
		String pageMenu = Support_Paging.getPaging("notice.do", search_filter, nowPage, rowTotal,
				SupportConstant.Notice.BLOCK_LIST,
				SupportConstant.Notice.BLOCK_PAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "support/support_notice";
	}

	@RequestMapping("faq.do") // ~9090:support/home.do 고객센터 자주찾는질문
	public String faq_list(Model model) {

		// 남아있는 조회수정보 삭제하고 목록보기 들어가면 조회수 증가됨
		session.removeAttribute("show");

		int nowPage = 1;

		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");

		if (search == null || search.isEmpty())
			search = "all";

		// page가 null이 아니거나 비어있지 않다면 //!=not
		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		// start시작페이지 / end 끝페이지 계산
		int start = (nowPage - 1) * SupportConstant.Faq.BLOCK_LIST + 1;
		int end = start + SupportConstant.Faq.BLOCK_LIST - 1;

		// 검색조건에 대한 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색 정보
		if (search.equals("name_subject_content")) {
			// 제목 + 내용으로 검색
			map.put("name", search_text);
			map.put("subject", search_text);
			map.put("content", search_text);

		} else if (search.equals("name")) {
			// 이름으로 검색
			map.put("name", search_text);

		} else if (search.equals("subject")) {
			// 제목으로 검색
			map.put("subject", search_text);

		} else if (search.equals("content")) {
			// 내용으로 검색
			map.put("content", search_text);
		}

		List<FaqVo> list = faq_dao.selectConditionList(map);

		// Page메뉴생성:조건별 전체게시물수
		int rowTotal = faq_dao.selectConditionRowTotal(map);
		// PageMenu생성하기
		String search_filter = String.format("&search=%s&search_text=%s", search, search_text);
		String pageMenu = Support_Paging.getPaging("faq.do", search_filter, nowPage, rowTotal,
				SupportConstant.Faq.BLOCK_LIST,
				SupportConstant.Faq.BLOCK_PAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "support/support_faq";

	}

	@RequestMapping("qna.do") // ~9090:support/qna.do 1:1문의 게시판
	public String qna_list(Model model) {

		// 남아있는 조회수정보 삭제하고 목록보기 들어가면 조회수 증가됨
		session.removeAttribute("show");

		int nowPage = 1;

		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");

		if (search == null || search.isEmpty())
			search = "all";

		// page가 null이 아니거나 비어있지 않다면 //!=not
		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		// start시작페이지 / end 끝페이지 계산
		int start = (nowPage - 1) * SupportConstant.Qna.BLOCK_LIST + 1;
		int end = start + SupportConstant.Qna.BLOCK_LIST - 1;

		// 검색조건에 대한 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색 정보
		if (search.equals("name_subject_content")) {
			// 제목 + 내용으로 검색
			map.put("name", search_text);
			map.put("subject", search_text);
			map.put("content", search_text);

		} else if (search.equals("name")) {
			// 이름으로 검색
			map.put("name", search_text);

		} else if (search.equals("subject")) {
			// 제목으로 검색
			map.put("subject", search_text);

		} else if (search.equals("content")) {
			// 내용으로 검색
			map.put("content", search_text);
		}

		List<SupportVo> list = support_dao.selectConditionList(map);

		// Page메뉴생성:조건별 전체게시물수
		int rowTotal = support_dao.selectConditionRowTotal(map);

		// Page메뉴생성
		String search_filter = String.format("&search=%s&search_text=%s", search, search_text);
		String pageMenu = Support_Paging.getPaging("qna.do", search_filter, nowPage, rowTotal,
				SupportConstant.Qna.BLOCK_LIST,
				SupportConstant.Qna.BLOCK_PAGE);

		// System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "support/support_qna";
	}

	/**
	 * ~9090:support/reviewer.do 고객센터 평론가
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer.do") // ~9090:support/home.do 고객센터 평론가
	public String reviewer_list(Model model) {

		// 로그인폼에서 로그인을하면 서버에서 Session이라는곳에 "user"라고 저장을 해놓음
		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)
		}

		// 남아있는 조회수정보 삭제하고 목록보기 들어가면 조회수 증가됨
		session.removeAttribute("show");

		int nowPage = 1;

		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");

		if (search == null || search.isEmpty())
			search = "all";

		// page가 null이 아니거나 비어있지 않다면 //!=not
		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		// start시작페이지 / end 끝페이지 계산
		int start = (nowPage - 1) * SupportConstant.Reviewer.BLOCK_LIST + 1;
		int end = start + SupportConstant.Reviewer.BLOCK_LIST - 1;

		// 검색조건에 대한 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색 정보
		if (search.equals("name_subject_content")) {
			// 제목 + 내용으로 검색
			map.put("name", search_text);
			map.put("subject", search_text);
			map.put("content", search_text);

		} else if (search.equals("name")) {
			// 이름으로 검색
			map.put("name", search_text);

		} else if (search.equals("subject")) {
			// 제목으로 검색
			map.put("subject", search_text);

		} else if (search.equals("content")) {
			// 내용으로 검색
			map.put("content", search_text);
		}

		List<ReviewerVo> list = reviewer_dao.selectConditionList(map);

		int rowTotal = reviewer_dao.selectConditionRowTotal(map);
		// PageMenu생성하기
		String search_filter = String.format("&search=%s&search_text=%s", search, search_text);
		String pageMenu = Support_Paging.getPaging("reviewer.do", search_filter, nowPage, rowTotal,
				SupportConstant.Reviewer.BLOCK_LIST,
				SupportConstant.Reviewer.BLOCK_PAGE);

		// System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("member", member);
		// model.addAttribute("mem_grade", );
		return "support/support_reviewer";

	}

	/**
	 * 1:1 문의하기 폼 띄우기
	 * 
	 * @return
	 */
	@RequestMapping("qna_insertform.do")
	public String qna_insertform(String mem_id, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		// System.out.println(mem_id);

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// MemberVo vo = member_dao.selectOneFromId(mem_id);
		// // System.out.println(vo.getMem_name());
		// model.addAttribute("vo", vo);

		return "support/support_qna_insertform";
	}

	/**
	 * 1:1문의 게시판 문의하기(글쓰기)
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("qna_insert.do")
	public String insert(SupportVo vo) {

		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		String b_ip = request.getRemoteAddr();

		vo.setB_ip(b_ip);

		// 추가
		support_dao.insert(vo);

		// 현재 추가된 b_idx구하기
		int b_idx = support_dao.selectMaxB_idx();

		// 현재 b_idx -> b_ref에 넣는다
		vo.setB_idx(b_idx);
		vo.setB_ref(b_idx);
		support_dao.update_b_ref(vo);

		return "redirect:qna.do";

	}

	/**
	 * 평론가 글남기기 폼
	 * 
	 * @param mem_id
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer_insertform.do")
	public String reviewer_insertform(String mem_id, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}
		System.err.println("이곳");
		return "support/support_reviewer_insertform";

	}// end:reviewer_form

	/**
	 * 평론가 글남기기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("reviewer_insert.do")
	public String reviewer_insert(ReviewerVo vo) {
		// System.err.println("111");
		String r_content = vo.getR_content().replaceAll("\n", "<br>");
		vo.setR_content(r_content);

		String r_ip = request.getRemoteAddr();
		vo.setR_ip(r_ip);

		reviewer_dao.insert(vo);

		return "redirect:reviewer.do";

	}

	/**
	 * 평론가 게시판 수정 폼
	 * 
	 * @param r_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer_modifyform.do")
	public String review_modifyform(int r_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		ReviewerVo vo = reviewer_dao.selectOne(r_idx);

		// content => <br> -> \n
		String r_content = vo.getR_content().replaceAll("<br>", "\n");
		vo.setR_content(r_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_reviewer_modifyform";

	}// end: reviewer_modifyform

	/**
	 * 평론가 게시판 수정
	 * 
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer_modify.do")
	public String reviewer_modify(ReviewerVo vo, Model model) {

		// \r\n -> <br>변경
		String r_content = vo.getR_content().replaceAll("\n", "<br>");
		vo.setR_content(r_content);

		// 3.IP구하기
		String r_ip = request.getRemoteAddr();
		vo.setR_ip(r_ip);

		// 5.DB update
		reviewer_dao.update(vo);

		model.addAttribute("vo", vo);

		// 반환정보->DS에게 전달
		// -> 접두어 redirect이면 그이후 명령(qna.do)으로
		// sendRedirect("reviwer.do") 시킨다
		return "redirect:reviewer.do";

	}// end: reviwer_modify

	/**
	 * 평론가 게시물 삭제
	 * 
	 * @param b_idx
	 * @return
	 */
	@RequestMapping("reviewer_delete.do")
	public String reviewer_delete(int b_idx) {

		reviewer_dao.delete(b_idx);

		return "redirect:reviewer.do";

	}

	/**
	 * 1:1문의 게시물 삭제
	 * 
	 * @param b_idx
	 * @return
	 */
	@RequestMapping("qna_delete.do")
	public String qna_delete(int b_idx) {

		support_dao.delete(b_idx);

		return "redirect:qna.do";

	}

	/**
	 * 1:1문의 게시글 보기
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_view.do")
	public String view(int b_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);
		// 세션에서 게시물을 봤는지에 대한 체크(새로고침으로 부정조회수 방지위함)
		// qna.do에 남아있는조회수 정보 삭제 코드 추가해야함
		if (session.getAttribute("show") == null) {
			// 조회수 증가
			int res = support_dao.update_readhit(b_idx);
			session.setAttribute("show", true);
		}

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_view";
	}

	/**
	 * 평론가 게시글 보기
	 * 
	 * @param r_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer_view.do")
	public String reviewer_view(int r_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		ReviewerVo vo = reviewer_dao.selectOne(r_idx);
		if (session.getAttribute("show") == null) {
			// 조회수 증가
			int res = reviewer_dao.update_readhit(r_idx);
			session.setAttribute("show", true);
		}

		// content => <br> -> \n
		String r_content = vo.getR_content().replaceAll("<br>", "\n");
		vo.setR_content(r_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_reviewer_view";
	}

	/**
	 * 1:1문의 수정 폼
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_modifyform.do")
	public String modify_form(int b_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_modifyform";

	}// end:modify_form

	/**
	 * 1:1문의 수정하기
	 * 
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_modify.do")
	public String modify(SupportVo vo, Model model) {

		// \r\n -> <br>변경
		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		// 3.IP구하기
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);

		// 5.DB update
		support_dao.update(vo);

		model.addAttribute("vo", vo);

		// 반환정보->DS에게 전달
		// -> 접두어 redirect이면 그이후 명령(qna.do)으로
		// sendRedirect("qna.do") 시킨다
		return "redirect:qna.do";

	}// end: modify

	@RequestMapping("comments_list.do") // 댓글 목록
	public String comments_list(int b_idx, Model model) {

		List<CommentsVo> list = comments_dao.selectList(b_idx);
		System.out.println(list.size());
		model.addAttribute("list", list);

		return "support/support_comments_list";
	}

	@RequestMapping("comments_insert.do") // 댓글 입력하기
	@ResponseBody
	public Map<String, Boolean> comments_insert(CommentsVo vo) {

		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);

		String cmt_ip = request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);

		int res = comments_dao.insert(vo);

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", res == 1);

		return map;

	}

	/**
	 * 댓글삭제
	 * 
	 * @param cmt_idx
	 * @return
	 */
	@RequestMapping("comments_delete.do")
	@ResponseBody
	public Map<String, Boolean> comments_delete(int cmt_idx) {

		int res = comments_dao.delete(cmt_idx);

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", (res == 1));

		return map;

	}

	/**
	 * 댓글 수정
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("comments_update.do")
	@ResponseBody
	public Map<String, Boolean> comments_update(CommentsVo vo) {

		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);

		// 3.ip구하기
		String cmt_ip = request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);

		int res = comments_dao.update(vo);

		// 결과 반환 : {"result" : true}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", (res == 1));

		return map;
	}

	/**
	 * 답글쓰기 폼 (관리자만가능)
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_replyform.do")
	public String reply_form(int b_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_replyform";

	}// end:modify_form

	/**
	 * 답글쓰기 (관리자만가능)
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("qna_reply.do")
	public String reply(SupportVo vo) {

		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);

		int b_idx = vo.getB_idx();
		SupportVo baseVo = support_dao.selectOne(b_idx);

		// 기준글 이후의 step을 뒤로 밀기
		support_dao.update_step(baseVo);

		// 댓글정보셋팅(답글에 들어갈 b_ref b_step b_depth 계산)
		vo.setB_ref(baseVo.getB_ref());
		vo.setB_step(baseVo.getB_step() + 1);
		vo.setB_depth(baseVo.getB_depth() + 1);

		support_dao.reply(vo);

		return "redirect:qna.do";

	}

	/**
	 * 공지사항 글남기기 폼 띄우기
	 * 
	 * @return
	 */
	@RequestMapping("notice_insertform.do")
	public String notice_insertform(String mem_id, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		// System.out.println(mem_id);

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// MemberVo vo = member_dao.selectOneFromId(mem_id);
		// // System.out.println(vo.getMem_name());
		// model.addAttribute("vo", vo);

		return "support/support_notice_insertform";
	}

	/**
	 * 공지사항 글남기기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("notice_insert.do")
	public String notice_insert(NoticeVo vo) {

		String n_content = vo.getN_content().replaceAll("\n", "<br>");
		vo.setN_content(n_content);

		String n_ip = request.getRemoteAddr();
		vo.setN_ip(n_ip);

		notice_dao.insert(vo);

		return "redirect:notice.do";

	}

	/**
	 * 공지사항 보기
	 * 
	 * @param n_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("notice_view.do")
	public String notice_view(int n_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		NoticeVo vo = notice_dao.selectOne(n_idx);
		// 세션에서 게시물을 봤는지에 대한 체크(새로고침으로 부정조회수 방지위함)
		if (session.getAttribute("show") == null) {
			// 조회수 증가
			int res = notice_dao.update_readhit(n_idx);
			session.setAttribute("show", true);
		}

		// content => <br> -> \n
		String n_content = vo.getN_content().replaceAll("<br>", "\n");
		vo.setN_content(n_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_notice_view";
	}

	/**
	 * 공지사항 삭제
	 * 
	 * @param n_idx
	 * @return
	 */
	@RequestMapping("notice_delete.do")
	public String notice_delete(int n_idx) {

		notice_dao.delete(n_idx);

		return "redirect:notice.do";

	}

	/**
	 * 공지사항 수정 폼
	 * 
	 * @param n_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("notice_modifyform.do")
	public String notice_modifyform(int n_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		NoticeVo vo = notice_dao.selectOne(n_idx);

		// content => <br> -> \n
		String n_content = vo.getN_content().replaceAll("<br>", "\n");
		vo.setN_content(n_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_notice_modifyform";

	}// end:notice_modifyform

	/**
	 * 공지사항 수정
	 * 
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("notice_modify.do")
	public String notice_modify(NoticeVo vo, Model model) {

		// \r\n -> <br>변경
		String n_content = vo.getN_content().replaceAll("\n", "<br>");
		vo.setN_content(n_content);

		// 3.IP구하기
		String n_ip = request.getRemoteAddr();
		vo.setN_ip(n_ip);

		// 5.DB update
		notice_dao.update(vo);

		model.addAttribute("vo", vo);

		// 반환정보->DS에게 전달
		// -> 접두어 redirect이면 그이후 명령(qna.do)으로
		// sendRedirect("notice.do") 시킨다
		return "redirect:notice.do";

	}// end: notice_modify

	/**
	 * 자찾문올리기 폼
	 * 
	 * @param mem_id
	 * @param model
	 * @return
	 */
	@RequestMapping("faq_insertform.do")
	public String faq_insertform(String mem_id, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}
		System.err.println("이곳");
		return "support/support_faq_insertform";

	}// end:faq_insertform

	/**
	 * 자찾문올리기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("faq_insert.do")
	public String faq_insert(FaqVo vo) {
		// System.err.println("111");
		String f_content = vo.getF_content().replaceAll("\n", "<br>");
		vo.setF_content(f_content);

		String f_ip = request.getRemoteAddr();
		vo.setF_ip(f_ip);

		faq_dao.insert(vo);

		return "redirect:faq.do";

	}

	/**
	 * 자찾문 삭제
	 * 
	 * @param n_idx
	 * @return
	 */
	@RequestMapping("faq_delete.do")
	public String faq_delete(int f_idx) {

		faq_dao.delete(f_idx);

		return "redirect:faq.do";

	}

	/**
	 * 자찾문 보기
	 * 
	 * @param f_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("faq_view.do")
	public String faq_view(int f_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		FaqVo vo = faq_dao.selectOne(f_idx);
		// 세션에서 게시물을 봤는지에 대한 체크(새로고침으로 부정조회수 방지위함)
		if (session.getAttribute("show") == null) {
			// 조회수 증가
			int res = faq_dao.update_readhit(f_idx);
			session.setAttribute("show", true);
		}

		// content => <br> -> \n
		String f_content = vo.getF_content().replaceAll("<br>", "\n");
		vo.setF_content(f_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_faq_view";
	}

	@RequestMapping("faq_modifyform.do")
	public String faq_modifyform(int f_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		FaqVo vo = faq_dao.selectOne(f_idx);

		// content => <br> -> \n
		String f_content = vo.getF_content().replaceAll("<br>", "\n");
		vo.setF_content(f_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_faq_modifyform";

	}// end:faq_modifyform

	@RequestMapping("faq_modify.do")
	public String faq_modify(FaqVo vo, Model model) {

		// \r\n -> <br>변경
		String f_content = vo.getF_content().replaceAll("\n", "<br>");
		vo.setF_content(f_content);

		// 3.IP구하기
		String f_ip = request.getRemoteAddr();
		vo.setF_ip(f_ip);

		// 5.DB update
		faq_dao.update(vo);

		model.addAttribute("vo", vo);

		// 반환정보->DS에게 전달
		// -> 접두어 redirect이면 그이후 명령(qna.do)으로
		// sendRedirect("faq.do") 시킨다
		return "redirect:faq.do";

	}// end: faq_modify

}
