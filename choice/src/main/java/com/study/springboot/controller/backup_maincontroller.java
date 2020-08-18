package com.study.springboot.controller;
/*
 * package com.study.springboot;
 * 
 * import java.util.HashMap; import java.util.Map;
 * 
 * import javax.servlet.ServletContext; import
 * javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import org.springframework.util.ResourceUtils;
 * import org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.multipart.commons.CommonsMultipartResolver;
 * 
 * import com.study.springboot.dao.IHomeDao; import
 * com.study.springboot.dao.IitemDao; import com.study.springboot.dto.MemberDto;
 * import com.study.springboot.dto.PagingDto; import
 * com.study.springboot.service.ICscenterService; import
 * com.study.springboot.service.IMemberService; import
 * com.study.springboot.service.INoticeService; import
 * com.study.springboot.service.IReviewService;
 * 
 * @Controller public class MainController { // 고객센터
 * 
 * @Autowired ICscenterService Cscenterservice; // 공지사항
 * 
 * @Autowired INoticeService noticeservice; // 회원가입,로그인
 * 
 * @Autowired IMemberService memberservice; // 파일업로드
 * 
 * @Autowired IReviewService ReviewService; // 파일업로드 경로 서블릿
 * 
 * @Autowired private ServletContext context; // 쿠폰 및 상품관련
 * 
 * @Autowired IitemDao itemService; // 메인홈페이지 반찬리스트 8개
 * 
 * @Autowired IHomeDao homeService; ///////////////////////////////////////////
 * 
 * // 메인페이지
 * 
 * @RequestMapping("/") public String index(Model model) throws Exception {
 * 
 * // 메인화면에 상품목록 들고올꺼 item8개 등록 model.addAttribute("item",
 * homeService.itemListDao());
 * 
 * return "index"; }
 * 
 * // 부트스트랩 기본 폼
 * 
 * @RequestMapping("/normal") public String normal() throws Exception {
 * 
 * return "normal"; }
 * 
 * // 고객센터페이지
 * 
 * @RequestMapping("/csList")
 * 
 * public String csList(PagingDto dto, Model model, @RequestParam(value =
 * "nowPage", required = false) String nowPage,
 * 
 * @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
 * 
 * int total = Cscenterservice.CscentercountBoard(); if (nowPage == null &&
 * cntPerPage == null) { nowPage = "1"; cntPerPage = "10"; } else if (nowPage ==
 * null) { nowPage = "1"; } else if (cntPerPage == null) { cntPerPage = "10"; }
 * dto = new PagingDto(total, Integer.parseInt(nowPage),
 * Integer.parseInt(cntPerPage)); model.addAttribute("paging", dto);
 * model.addAttribute("viewAll", Cscenterservice.CscenterPaging(dto)); return
 * "cscenter/csList"; }
 * 
 * // 고객센터 뷰
 * 
 * @RequestMapping("/csView") public String csView(HttpServletRequest request,
 * Model model) { String sIdx = request.getParameter("cs_idx");
 * model.addAttribute("dto", Cscenterservice.Cscenterview(sIdx));
 * 
 * return "cscenter/csView"; // noticeview.jsp 호출하면서 list객체를 넘겨줌 }
 * 
 * // 고객센터상담글작성게시판페이지
 * 
 * @RequestMapping("/csWrite")
 * 
 * public String csWrite(Model model) throws Exception {
 * model.addAttribute("Cscenterlist", Cscenterservice.Cscenterlist()); return
 * "cscenter/csWrite"; }
 * 
 * // 회원가입 폼
 * 
 * @RequestMapping("/joinForm") public String joinForm() throws Exception {
 * 
 * return "member/joinForm"; }
 * 
 * // 아이디 중복확인
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/idCheck", method = RequestMethod.POST) public int
 * postIdCheck(HttpServletRequest req) throws Exception {
 * 
 * String user_id = req.getParameter("id"); int nResult =
 * memberservice.count(user_id); int result = 0; if (nResult > 0) { result = 1;
 * } return result; }
 * 
 * // 회원가입 체크
 * 
 * @RequestMapping("/join_ok") public String join(HttpServletRequest req, Model
 * model) { String user_id = req.getParameter("id"); String user_pw =
 * req.getParameter("pw"); String user_name = req.getParameter("name"); String
 * user_email = req.getParameter("email");
 * 
 * Map<String, String> map = new HashMap<String, String>(); map.put("user_id",
 * user_id); map.put("user_pw", user_pw); map.put("user_name", user_name);
 * map.put("user_email", user_email);
 * 
 * int nResult = memberservice.join(map); if (nResult < 1) {
 * System.out.println("회원가입에 실패했습니다"); return "redirect:joinForm"; } else {
 * System.out.println("회원가입에 성공했습니다."); return "redirect:/"; }
 * 
 * }
 * 
 * // 로그인페이지
 * 
 * @RequestMapping("/loginForm") public String loginForm() throws Exception {
 * 
 * return "member/loginForm"; }
 * 
 * // 로그인체크
 * 
 * @RequestMapping("/login_ok") // loginForm에서 넘긴 값 가지고 오기 public String
 * loginPost(MemberDto mem, Model model, HttpServletRequest req, HttpSession
 * session) {
 * 
 * if (memberservice.login(mem) != null) { mem = memberservice.login(mem);
 * String user_id = mem.getUser_id(); session.setAttribute("login", user_id);
 * 
 * return "redirect:/"; } else { model.addAttribute("fail", "실패");
 * 
 * return "forward:loginForm"; }
 * 
 * }
 * 
 * // 로그아웃
 * 
 * @RequestMapping("/logout") public String logout(HttpSession session) throws
 * Exception { session.invalidate(); return "redirect:/"; }
 * 
 * // 회원정보 진입전 비밀번호입력
 * 
 * @RequestMapping("/modifyPass") public String modifyPass() throws Exception {
 * 
 * return "member/modifyPass"; }
 * 
 * // 회원정보 불러옴
 * 
 * @RequestMapping("/modifyForm") public String modify(MemberDto mem,
 * HttpSession session, Model model, HttpServletRequest req) {
 * 
 * String user_id = (String) session.getAttribute("login"); // user_id가 세션에 없으면
 * 메인으로( 비정상적 접속 ) if (user_id == null || user_id == "") { return "redirect:/";
 * }
 * 
 * String user_pw = (String) req.getParameter("user_pw");
 * 
 * if (memberservice.modifyForm(user_id, user_pw) != null) {
 * 
 * mem = memberservice.modifyForm(user_id, user_pw);
 * model.addAttribute("modify", mem); return "member/modifyForm";
 * 
 * } else { model.addAttribute("fail", "실패"); return "forward:modifyPass";
 * 
 * } }
 * 
 * // 회원정보 수정
 * 
 * @RequestMapping("/modifyUpdate") public String modifyUpdate(HttpSession
 * session, HttpServletRequest req, Model model) { String user_id = (String)
 * session.getAttribute("login"); String user_pw = req.getParameter("user_pw");
 * String user_name = req.getParameter("user_name"); String user_email =
 * req.getParameter("user_email"); Map<String, String> map = new HashMap<String,
 * String>(); map.put("user_id", user_id); map.put("user_pw", user_pw);
 * map.put("user_name", user_name); map.put("user_email", user_email);
 * 
 * int nResult = memberservice.modifyUpdate(map); if (nResult < 1) {
 * model.addAttribute("updateMsg", "실패"); return "member/modifyUpdate"; } else {
 * model.addAttribute("updateMsg", "성공"); session.invalidate(); // 세션정보 초기화
 * return "member/modifyUpdate"; } }
 * 
 * // 회원탈퇴
 * 
 * @RequestMapping("/leave") public String leave(HttpServletRequest req, Model
 * model, HttpSession session) { String user_id = (String)
 * session.getAttribute("login"); String user_pw = req.getParameter("user_pw");
 * 
 * int nResult = memberservice.leave(user_id, user_pw);
 * 
 * if (nResult < 1) {
 * 
 * model.addAttribute("deleteMsg", "실패"); return "member/modifyUpdate";
 * 
 * } else { model.addAttribute("deleteMsg", "성공"); return "member/modifyUpdate";
 * } }
 * 
 * @RequestMapping("/cartList") public String cartList(Model model) throws
 * Exception {
 * 
 * Map<String, String> map = new HashMap<String, String>(); map.put("price",
 * "1000"); map.put("thumbnail", "123"); map.put("name", "test");
 * map.put("totalsum", "123"); map.put("count", "3"); model.addAttribute("cart",
 * map); model.addAttribute("car", 1);
 * 
 * return "mypage/cartList";
 * 
 * }
 * 
 * @RequestMapping("/coupon") public String coupon(HttpSession session, Model
 * model) throws Exception { // 세션에서 아이디 불러옴
 * 
 * String user_id = (String) session.getAttribute("login"); if (user_id != "" &&
 * user_id != null) {
 * 
 * // 해당 유저가 가지고 있는 쿠폰 테이블을 불러온다. int cpCount = itemService.CpCountDao(user_id);
 * if (cpCount > 0) { model.addAttribute("coupon",
 * itemService.couponListDao(user_id)); } model.addAttribute("cpCount",
 * cpCount); } return "mypage/coupon"; }
 * 
 * // 마이페이지 -회원탈퇴 페이지
 * 
 * @RequestMapping("/deleteMember") public String deleteMember() throws
 * Exception {
 * 
 * return "mypage/deleteMember"; }
 * 
 * // 마이페이지 -회원탈퇴db처리
 * 
 * @RequestMapping("/deleteMember2") public String
 * deleteMember2(HttpServletRequest req, Model model, HttpSession session) {
 * String user_id = (String) session.getAttribute("login"); String user_pw =
 * req.getParameter("user_pw");
 * 
 * int nResult = memberservice.leave(user_id, user_pw);
 * 
 * if (nResult < 1) {
 * 
 * model.addAttribute("deleteMsg", "실패"); return "mypage/deleteMember";
 * 
 * } else { model.addAttribute("deleteMsg", "성공"); return "mypage/deleteMember";
 * } }
 * 
 * // 마이페이지 회원정보수정
 * 
 * @RequestMapping("/memberModify") public String memberModify() throws
 * Exception {
 * 
 * return "mypage/memberModify"; }
 * 
 * // 마이페이지 주문리스트
 * 
 * @RequestMapping("/orderList") public String orderList() throws Exception {
 * 
 * return "mypage/orderList"; }
 * 
 * // 마이페이지 주문품목 상세정보
 * 
 * @RequestMapping("/orderDetail") public String orderDetail() throws Exception
 * {
 * 
 * return "mypage/orderDetail"; }
 * 
 * // 페이징처리 공지사항 리스트
 * 
 * @RequestMapping("/noticelist") public String boardList(PagingDto dto, Model
 * model,
 * 
 * @RequestParam(value = "nowPage", required = false) String nowPage,
 * 
 * @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
 * 
 * int total = noticeservice.countBoard(); if (nowPage == null && cntPerPage ==
 * null) { nowPage = "1"; cntPerPage = "10"; } else if (nowPage == null) {
 * nowPage = "1"; } else if (cntPerPage == null) { cntPerPage = "10"; } dto =
 * new PagingDto(total, Integer.parseInt(nowPage),
 * Integer.parseInt(cntPerPage)); model.addAttribute("paging", dto);
 * model.addAttribute("viewAll", noticeservice.NoticePaging(dto)); return
 * "notice/noticelist"; }
 * 
 * // 공지사항 글목록
 * 
 * @RequestMapping("/noticeview") public String noticeview(HttpServletRequest
 * request, Model model) { String sIdx = request.getParameter("notice_idx");
 * model.addAttribute("dto", noticeservice.Noticeview(sIdx));
 * 
 * return "notice/noticeview"; // noticeview.jsp 호출하면서 list객체를 넘겨줌 }
 * 
 * // 제품 리뷰 뷰 게시판
 * 
 * @RequestMapping("/reviewview") public String reviewview(HttpServletRequest
 * request, Model model) { String sIdx = request.getParameter("review_idx");
 * model.addAttribute("dto", ReviewService.review(sIdx));
 * 
 * return "review/reviewview"; }
 * 
 * // 공지사항 글쓰기 폼으로 가기
 * 
 * @RequestMapping("/noticewriteForm") public String noticewrite(Model model)
 * throws Exception { model.addAttribute("list", noticeservice.Noticelist());
 * return "notice/noticewriteForm"; // noticelist.jsp }
 * 
 * // 고객센터 글쓰기 폼으로 가기
 * 
 * @RequestMapping("/cswriteForm") public String cswriteForm(Model model) throws
 * Exception { model.addAttribute("list", Cscenterservice.Cscenterlist());
 * return "cscenter/cswriteForm"; // noticelist.jsp }
 * 
 * // 제품리뷰 글쓰기 폼으로 가기
 * 
 * @RequestMapping("/reviewwrite") public String reviewwrite(Model model) throws
 * Exception { model.addAttribute("list", ReviewService.Reviewlist()); return
 * "review/reviewwrite"; // noticelist.jsp }
 * 
 * // 공지사항 글쓰기ok
 * 
 * @RequestMapping("/noticewrite_ok") public String noticewrite_ok(HttpSession
 * session, HttpServletRequest request, Model model) {
 * 
 * String sTitle = request.getParameter("notice_title"); String sContent =
 * request.getParameter("notice_content"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>();
 * map.put("notice_title", sTitle); map.put("notice_content", sContent);
 * map.put("notice_writer", sWriter);
 * 
 * int nResult = noticeservice.Noticewrite(map); if (nResult < 1) {
 * System.out.println("쓰기를 실패했습니다."); return "redirect:noticewrite"; } else {
 * System.out.println("쓰기를 성공했습니다."); return "redirect:noticelist"; } }
 * 
 * // 고객센터 상담 글쓰기ok
 * 
 * @RequestMapping("/Cscenterwrite_ok") public String
 * Cscenterwrite_ok(HttpSession session, HttpServletRequest request, Model
 * model) {
 * 
 * String sTitle = request.getParameter("cs_title"); String sContent =
 * request.getParameter("cs_content"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>(); map.put("cs_title",
 * sTitle); map.put("cs_content", sContent); map.put("cs_writer", sWriter);
 * 
 * int nResult = Cscenterservice.Cscenterwrite(map); if (nResult < 1) {
 * System.out.println("쓰기를 실패했습니다."); return "redirect:csWrite"; } else {
 * System.out.println("쓰기를 성공했습니다."); return "redirect:csList"; } }
 * 
 * // 리뷰 글쓰기ok
 * 
 * @RequestMapping("/reviewWrite_ok") public String reviewWrite_ok(HttpSession
 * session, HttpServletRequest request, Model model) {
 * 
 * String sTitle = request.getParameter("review_title"); String sContent =
 * request.getParameter("review_content"); // String sThumbnail =
 * request.getParameter("review_thumbnail"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>();
 * map.put("review_title", sTitle); map.put("review_content", sContent); //
 * map.put("review_thumbnail", sThumbnail); map.put("review_writer", sWriter);
 * 
 * int nResult = ReviewService.reviewWrite(map); if (nResult < 1) {
 * System.out.println("리뷰쓰기를 실패했습니다."); return "redirect:reviewwrite"; } else {
 * System.out.println("리뷰쓰기를 성공했습니다."); return "redirect:reviewlist"; } }
 * 
 * // 공지사항 글수정 폼으로 가기
 * 
 * @RequestMapping("/noticemodifyForm") public String noticemodify(HttpSession
 * session, HttpServletRequest request, Model model) {
 * 
 * String user_id = (String) session.getAttribute("login"); // user_id가 admin이
 * 아니면 메인으로( 비정상적 접속 ) if (user_id.equals("admin")) {
 * 
 * String sIdx = request.getParameter("notice_idx"); model.addAttribute("dto",
 * noticeservice.Noticeview(sIdx)); return "notice/noticemodifyForm"; } else {
 * return "redirect:/"; }
 * 
 * }
 * 
 * // 고객센터 글수정 폼으로 가기
 * 
 * @RequestMapping("/csmodifyForm") public String csmodifyForm(HttpSession
 * session, HttpServletRequest request, Model model) {
 * 
 * String user_id = (String) session.getAttribute("login"); // user_id가 admin이
 * 아니면 메인으로( 비정상적 접속 ) if (user_id.equals("admin")) {
 * 
 * String sIdx = request.getParameter("cs_idx"); model.addAttribute("dto",
 * Cscenterservice.Cscenterview(sIdx)); return "cscenter/csmodifyForm"; } else {
 * return "redirect:/"; }
 * 
 * }
 * 
 * // 리뷰게시판 글수정 폼으로 가기
 * 
 * @RequestMapping("/reviewModifyForm") public String
 * reviewModifyForm(HttpSession session, HttpServletRequest request, Model
 * model) {
 * 
 * String user_id = (String) session.getAttribute("login"); // user_id가 admin이
 * 아니면 메인으로( 비정상적 접속 ) if (user_id.equals("admin")) {
 * 
 * String sIdx = request.getParameter("review_idx"); model.addAttribute("dto",
 * ReviewService.review(sIdx)); return "review/reviewModifyForm"; } else {
 * return "redirect:/"; }
 * 
 * }
 * 
 * // 공지사항 글수정ok
 * 
 * @RequestMapping("/noticemodify_ok") public String modify_ok(HttpSession
 * session, HttpServletRequest request, Model model) { String sIdx =
 * request.getParameter("notice_idx"); String sTitle =
 * request.getParameter("notice_title"); String sContent =
 * request.getParameter("notice_content"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>();
 * map.put("notice_title", sTitle); map.put("notice_content", sContent);
 * map.put("notice_writer", sWriter); map.put("notice_idx", sIdx);
 * 
 * int nResult = noticeservice.Noticemodify(map); if (nResult < 1) {
 * System.out.println("쓰기를 실패했습니다."); return "redirect:noticemodifyForm"; } else
 * { System.out.println("쓰기를 성공했습니다."); return "redirect:noticeview?notice_idx="
 * + sIdx; } }
 * 
 * // 고객센터 상담글수정ok
 * 
 * @RequestMapping("/Cscentermodify_ok") public String
 * Cscentermodify_ok(HttpSession session, HttpServletRequest request, Model
 * model) { String sIdx = request.getParameter("cs_idx"); String sTitle =
 * request.getParameter("cs_title"); String sContent =
 * request.getParameter("cs_content"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>(); map.put("cs_title",
 * sTitle); map.put("cs_content", sContent); map.put("cs_writer", sWriter);
 * map.put("cs_idx", sIdx);
 * 
 * int nResult = Cscenterservice.Cscentermodify(map); if (nResult < 1) {
 * System.out.println("상담글쓰기를 실패했습니다."); return "redirect:csmodifyForm"; } else
 * { System.out.println("상담쓰글기를 성공했습니다."); return "redirect:csView?cs_idx=" +
 * sIdx; } }
 * 
 * // 리뷰게시판 글수정ok
 * 
 * @RequestMapping("/reviewModify_ok") public String reviewModify_ok(HttpSession
 * session, HttpServletRequest request, Model model) { String sIdx =
 * request.getParameter("review_idx"); String sTitle =
 * request.getParameter("review_title"); String sContent =
 * request.getParameter("review_content"); String sWriter = (String)
 * session.getAttribute("login");
 * 
 * Map<String, String> map = new HashMap<String, String>();
 * 
 * map.put("review_idx", sIdx); map.put("review_title", sTitle);
 * map.put("review_content", sContent); map.put("review_writer", sWriter);
 * 
 * int nResult = ReviewService.reviewModify(map); if (nResult < 1) {
 * System.out.println("리뷰글수정 실패했습니다."); return "redirect:reviewModifyForm"; }
 * else { System.out.println("리뷰글수정 성공했습니다."); return
 * "redirect:reviewview?review_idx=" + sIdx; } }
 * 
 * // 공지사항 글삭제
 * 
 * @RequestMapping("/noticedelete_ok") public String delete(HttpServletRequest
 * request, Model model) { String sIdx = request.getParameter("notice_idx"); int
 * nResult = noticeservice.Noticedelete(sIdx); if (nResult < 1) {
 * System.out.println("삭제를 실패했습니다."); return "redirect:noticemodifyForm"; } else
 * { System.out.println("삭제를 성공했습니다."); return "redirect:noticelist"; }
 * 
 * }
 * 
 * // 고객센터 상담글삭제
 * 
 * @RequestMapping("/Cscenterdelete_ok") public String
 * Cscenterdelete_ok(HttpServletRequest request, Model model) { String sIdx =
 * request.getParameter("cs_idx"); int nResult =
 * Cscenterservice.Cscenterdelete(sIdx); if (nResult < 1) {
 * System.out.println("삭제를 실패했습니다."); return "redirect:csmodifyForm"; } else {
 * System.out.println("삭제를 성공했습니다."); return "redirect:csList"; }
 * 
 * }
 * 
 * // 리뷰글삭제
 * 
 * @RequestMapping("/reviewDelete_ok") public String
 * reviewDelete_ok(HttpServletRequest request, Model model) { String sIdx =
 * request.getParameter("review_idx"); int nResult =
 * ReviewService.reviewDelete(sIdx); if (nResult < 1) {
 * System.out.println("리뷰글삭제를 실패했습니다."); return "redirect:reviewModifyForm"; }
 * else { System.out.println("리뷰글삭제를 성공했습니다."); return "redirect:reviewlist"; }
 * 
 * }
 * 
 * // 제품리뷰 게시판 // 파일업로드 관련 reviewlist, reviewwrite.jsp
 * 
 * @RequestMapping("/reviewlist") public String reviewlist(PagingDto dto, Model
 * model,
 * 
 * @RequestParam(value = "nowPage", required = false) String nowPage,
 * 
 * @RequestParam(value = "cntPerPage", required = false) String cntPerPage)
 * throws Exception {
 * 
 * int total = ReviewService.ReviewcountBoard(); if (nowPage == null &&
 * cntPerPage == null) { nowPage = "1"; cntPerPage = "10"; } else if (nowPage ==
 * null) { nowPage = "1"; } else if (cntPerPage == null) { cntPerPage = "10"; }
 * 
 * dto = new PagingDto(total, Integer.parseInt(nowPage),
 * Integer.parseInt(cntPerPage)); model.addAttribute("paging", dto);
 * model.addAttribute("viewAll", ReviewService.ReviewPaging(dto));
 * 
 * System.out.println("path:" + context.getRealPath("/"));
 * System.out.println("path:" + context.getContextPath()); String path =
 * ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
 * System.out.println("path:" + path);
 * 
 * return "review/reviewlist";
 * 
 * }
 * 
 * // 파일업로드란
 * 
 * 
 * 위 코드는 실제 리뷰게시판 사진이 들어올 자리인 , reviewlist 이미지 자리가있는 페이지에 들어와야 한다.
 * 
 * @RequestMapping("/uploadForm") public String uploadForm() {
 * 
 * return "FileUpload/fileForm"; }
 * 
 * 
 * @Bean(name = "multipartResolver") public CommonsMultipartResolver
 * multipartResolver() { CommonsMultipartResolver multipartResolver = new
 * CommonsMultipartResolver(); multipartResolver.setMaxUploadSize(200000000);
 * multipartResolver.setMaxInMemorySize(200000000);
 * multipartResolver.setDefaultEncoding("utf-8"); return multipartResolver; }
 * 
 * // 파일업로드 성공후 .
 * 
 * @RequestMapping(value = "/uploadOk", method = RequestMethod.POST)
 * public @ResponseBody String uploadOk(Model model, // 아이디 비번란 삭제 , 파일명만 업로드
 * 가능하게
 * 
 * @RequestParam("filename") MultipartFile file) {
 * 
 * String url = ReviewService.restore(file); System.out.println("url:" + url);
 * model.addAttribute("url", url); return "result";// 파일 업로드 완성이후, 성공시 들어올 문구
 * 
 * }
 * 
 * 
 * // 제품상세
 * 
 * @RequestMapping("/itemDetail") public String itemDetail(HttpServletRequest
 * req, Model model) throws Exception { // index에서 상품을 누르고 이동했을 때 item_idx를 받아서
 * 해당상품 정보를 가져온다 String item_idx = req.getParameter("item_idx"); // 해당 상품에 대한
 * 정보를 i로 등록한다 model.addAttribute("i", itemService.itemDetailDao(item_idx));
 * 
 * return "item/itemDetail"; }
 * 
 * // 제품구매
 * 
 * @RequestMapping("/itemBuy") public String itemBuy(HttpServletRequest req,
 * HttpSession session, Model model) throws Exception { // 바로구매로 이동했을 때 페이지의
 * url에서 item_idx를 가져온다 String item_idx = req.getParameter("item_idx");
 * model.addAttribute("i", itemService.itemDetailDao(item_idx));
 * 
 * // 세션에 아디가 있는지 확인 if (session.getAttribute("login") != null &&
 * session.getAttribute("login") != "") { // 있으면 login을 user_id에 넣어줌 String
 * user_id = (String) session.getAttribute("login");
 * 
 * // 유저 정보를 order로 모델 등록 model.addAttribute("order",
 * itemService.orderinfoDao(user_id));
 * 
 * // 해당 유저에게 쿠폰이 있는지 확인 int nResult = itemService.CpCountDao(user_id); // 있으면
 * 쿠폰 목록을 뿌려줌 if (nResult > 0) {
 * 
 * model.addAttribute("cp", itemService.couponListDao(user_id)); } }
 * 
 * return "item/itemBuy"; }
 * 
 * // 제품주문완료
 * 
 * @RequestMapping("/itemEnd") public String itemEnd() throws Exception {
 * 
 * return "item/itemEnd"; }
 * 
 * }
 */