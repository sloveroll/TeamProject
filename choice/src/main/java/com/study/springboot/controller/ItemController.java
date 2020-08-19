package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.service.ICartService;
import com.study.springboot.service.IitemService;

@Controller
public class ItemController {

	// 쿠폰 및 상품관련
	@Autowired
	IitemService itemService;
	@Autowired
	ICartService cartService;
	///////////////////////////////////////////

	// 제품메뉴상세
	@RequestMapping("/itemDetail")
	public String itemDetail(HttpServletRequest req, Model model) throws Exception {
		// index.jsp에서 상품메뉴상세를 누르고 이동했을 때 item_idx를 받아서 해당상품 정보를 가져온다
		String item_idx = req.getParameter("item_idx");// 해당상품번호 불러온다.

		Map<String, String> map = new HashMap<String, String>();
		map.put("item_idx", item_idx);

		// 해당 상품에 대한 정보를 i로 등록한다
		model.addAttribute("i", itemService.itemDetail(item_idx));

		return "item/itemDetail";
	}

	// 제품구매
	@RequestMapping("/itemBuy")
	public String itemBuy(HttpServletRequest req, HttpSession session, Model model) throws Exception {

		if (req.getParameter("cart").equals("true")) {
			if (session.getAttribute("login") != null && session.getAttribute("login") != "") {
				String user_id = (String) session.getAttribute("login");

				// 유저 정보를 order로 모델 등록
				model.addAttribute("order", itemService.orderinfo(user_id));

				// 해당 유저에게 쿠폰이 있는지 확인
				int cpCount = itemService.CpCount(user_id);
				// 있으면 쿠폰 목록을 뿌려줌
				if (cpCount > 0) {

					model.addAttribute("cp", itemService.couponList(user_id));
				}
				// 장바구니에서 보내준 cartidx 설정
				Map<String, String> map = new HashMap<String, String>();
				map.put("cart_idx1", "0");
				map.put("cart_idx2", "0");
				map.put("cart_idx3", "0");
				map.put("user_id", user_id);

				if (req.getParameter("cart").equals("true")) {
					model.addAttribute("msg", "true");
					int j = 1;
					for (int i = 1; i < 100; i++) {

						if (req.getParameter("cart_idx" + i) != null) {

							map.put("cart_idx" + j++, String.valueOf(i));
							// 설정끝
						}
					}
				}
				// 장바구니에서 바로구매버튼 클릭시 리스트 불러옴
				model.addAttribute("cartlist", cartService.cartBuy(map));

			}

			return "item/itemBuy2";
		} else if (req.getParameter("cart").equals("false")) {

			String item_idx = req.getParameter("item_idx");
			model.addAttribute("i", itemService.itemDetail(item_idx));

			// 세션에 아디가 있는지 확인
			if (session.getAttribute("login") != null && session.getAttribute("login") != "") {
				// 있으면 login을 user_id에 넣어줌
				String user_id = (String) session.getAttribute("login");

				// 유저 정보를 order로 모델 등록
				model.addAttribute("order", itemService.orderinfo(user_id));

				// 해당 유저에게 쿠폰이 있는지 확인
				int nResult = itemService.CpCount(user_id);
				// 있으면 쿠폰 목록을 뿌려줌
				if (nResult > 0) {

					model.addAttribute("cp", itemService.couponList(user_id));
				}
			}

			return "item/itemBuy";
		}
		return null;
	}

	// 검색시
	@RequestMapping("/search")
	public String searchResult(HttpServletRequest req, Model model) {

		// itemDao.xml 오라클 전용 sql 검색 like문
		String word = req.getParameter("searchWord");

		// 해당 검색어에 맞는 상품의 갯수를 구함
		if (itemService.searchCount(word) > 0) {
			// 검색결과 갯수를 모델로 등록함
			model.addAttribute("searchCount", itemService.searchCount(word));
			// 검색결과에 맞는 아이템 리스트를 등록함
			model.addAttribute("searchResult", itemService.search(word));

		} else {
			// 검색결과 없으면 msg를 등록함
			model.addAttribute("msg", "none");
		}

		// 유저가 검색한 검색어값을 등록함
		model.addAttribute("searchWord", req.getParameter("searchWord"));
		// search.jsp에 넣어줌
		return "item/search";
	}

	// 쿠폰 리스트
	@RequestMapping("/coupon")
	public String coupon(HttpSession session, Model model) throws Exception {
		// 세션에서 아이디 불러옴

		String user_id = (String) session.getAttribute("login");
		if (user_id != "" && user_id != null) {

			// 해당 유저가 가지고 있는 쿠폰 테이블을 불러온다.
			int cpCount = itemService.CpCount(user_id);
			if (cpCount > 0) {
				model.addAttribute("coupon", itemService.couponList(user_id));
			}
			model.addAttribute("cpCount", cpCount);
		}
		return "mypage/coupon";
	}

	// 슬라이드 배너를 눌렀을 때 쿠폰을 추가함
	@RequestMapping("/takeCoupon")
	public String takeCoupon(HttpSession session, HttpServletRequest req, Model model,
			RedirectAttributes redirectAttributes) throws Exception {
		// RedirectAttributes 파라미터값 들고오기 위해 사용해야함 .
		// 아이디 있는지
		if (session.getAttribute("login") != null) {
			String user_id = (String) session.getAttribute("login");
			String cp_idx = req.getParameter("cp_idx");
			String cp_name = req.getParameter("cp_name");
			String cp_saleprice = req.getParameter("cp_saleprice");

			// 해당 유저에게 쿠폰이 있는지 체크
			int result = itemService.cpCheck(user_id, cp_idx);
			if (result < 1) {
				// 없으면 추가 후 쿠폰페이지로
				Map<String, String> insertCp = new HashMap<String, String>();
				insertCp.put("user_id", user_id);
				insertCp.put("cp_idx", cp_idx);
				insertCp.put("cp_name", cp_name);
				insertCp.put("cp_saleprice", cp_saleprice);

				itemService.cpInsert(insertCp);
				// 쿠폰 페이지로 리턴
				return "redirect:/coupon";

			} else {
				// 있으면 alert을 띄우고 홈피로
				redirectAttributes.addAttribute("fail", "coupon");
				return "redirect:/";
			}

			// 아디가 없으면 로그인 폼으로 이동
		} else {
			return "redirect:/loginForm";
		}

	}

	// 아이템종류 "메인"
	@RequestMapping("/sort1")
	public String itemSort1(HttpServletRequest req, Model model) throws Exception {

		String sItem_sort = "메인";
		model.addAttribute("item", itemService.SortList(sItem_sort));

		return "sort/sort1";
	}

	// 아이템종류 "반찬"
	@RequestMapping("/sort2")
	public String itemSort2(HttpServletRequest req, Model model) throws Exception {

		String sItem_sort = "반찬";
		model.addAttribute("item", itemService.SortList(sItem_sort));

		return "sort/sort2";
	}

	// 아이템종류 "김치&샐러드"
	@RequestMapping("/sort3")
	public String itemSort3(HttpServletRequest req, Model model) throws Exception {

		String sItem_sort = "김치&샐러드";
		model.addAttribute("item", itemService.SortList(sItem_sort));

		return "sort/sort3";
	}

	// 아이템종류 "정육&양념육"
	@RequestMapping("/sort4")
	public String itemSort4(HttpServletRequest req, Model model) throws Exception {

		String sItem_sort = "정육&양념육";
		model.addAttribute("item", itemService.SortList(sItem_sort));

		return "sort/sort4";
	}
}