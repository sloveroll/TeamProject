package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.service.FileUploadService2;
import com.study.springboot.service.IAdminService;
import com.study.springboot.service.IOrderListService;

@Controller
public class adminController {
   @Autowired
   IAdminService adminservice;

   @Autowired
   IOrderListService orderlistservice;

   @Autowired
   FileUploadService2 fileUploadService2;



   // 메인페이지/ 상품관리
   @RequestMapping("/adminMain")
   public String adminMain() throws Exception {

      return "admin/adminMain";
   }

   // 상품리스트
   @RequestMapping("/product")
   public String product(Model model) throws Exception {
      model.addAttribute("viewAll", adminservice.adminItemList());
      return "admin/product";
   }

   // 상품작성폼
   @RequestMapping("/productWriteForm")
   public String productWriteForm(Model model) throws Exception {

      return "admin/productWriteForm";
   }

   @Bean(name = "multipartResolver2")
   public CommonsMultipartResolver multipartResolver() {
      CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
      multipartResolver.setMaxUploadSize(200000000);
      multipartResolver.setMaxInMemorySize(200000000);
      multipartResolver.setDefaultEncoding("utf-8");
      return multipartResolver;
   }

   // 상품작성
   @RequestMapping("/productWrite_ok")
   public String noticewrite_ok(HttpServletRequest request, Model model,
         @RequestParam("item_thumbnail") MultipartFile item_thumbnail, MultipartFile item_thumbnail2,
         MultipartFile item_thumbnail3, MultipartFile item_thumbnail4) {

      String sItem_idx = request.getParameter("item_idx");
      String sItem_name = request.getParameter("item_name");
      String sItem_price = request.getParameter("item_price");
      String sItem_sort = request.getParameter("item_sort");

      Map<String, String> map = new HashMap<String, String>();
      map.put("item_idx", sItem_idx);
      map.put("item_name", sItem_name);
      map.put("item_price", sItem_price);
      map.put("item_sort", sItem_sort);

      // 파일업로드부분.
      String url = fileUploadService2.restore(item_thumbnail);
      String url2 = fileUploadService2.restore(item_thumbnail2);
      String url3 = fileUploadService2.restore(item_thumbnail3);
      String url4 = fileUploadService2.restore(item_thumbnail4);

      map.put("item_thumbnail", url);
      map.put("item_thumbnail2", url2);
      map.put("item_thumbnail3", url3);
      map.put("item_thumbnail4", url4);

      int nResult = adminservice.adminProductWrite(map);
      if (nResult < 1) {
         System.out.println("쓰기를 실패했습니다.");
         return "redirect:history.back()";
      } else {
         System.out.println("쓰기를 성공했습니다.");
         return "redirect:product";
      }
   }

//상품수정폼
   @RequestMapping("/productModifyForm")
   public String productModifyForm(HttpServletRequest request, Model model) throws Exception {
      String sIdx = request.getParameter("item_idx");
      model.addAttribute("dto", adminservice.productView(sIdx));
      return "admin/productModifyForm";
   }

//상품수정   
   @RequestMapping("/productModify_ok")
   public String productModify_ok(HttpSession session, HttpServletRequest request, Model model,
         @RequestParam("item_thumbnail") MultipartFile item_thumbnail,MultipartFile item_thumbnail2,MultipartFile item_thumbnail3,MultipartFile item_thumbnail4) {

      String sItem_idx = request.getParameter("item_idx");
      String sItem_name = request.getParameter("item_name");
      String sItem_price = request.getParameter("item_price");
      String sItem_thumbnail = request.getParameter("item_thumbnail");
      String sItem_thumbnail2 = request.getParameter("item_thumbnail2");
      String sItem_thumbnail3 = request.getParameter("item_thumbnail3");
      String sItem_thumbnail4 = request.getParameter("item_thumbnail4");
      String sItem_sort = request.getParameter("item_sort");

      Map<String, String> map = new HashMap<String, String>();
      map.put("item_idx", sItem_idx);
      map.put("item_name", sItem_name);
      map.put("item_price", sItem_price);
      map.put("item_thumbnail", sItem_thumbnail);
      map.put("item_thumbnail2", sItem_thumbnail2);
      map.put("item_thumbnail3", sItem_thumbnail3);
      map.put("item_thumbnail4", sItem_thumbnail4);
      map.put("item_sort", sItem_sort);

      // 파일업로드부분.
      String url = fileUploadService2.restore(item_thumbnail);
      String url2 = fileUploadService2.restore(item_thumbnail2);
      String url3 = fileUploadService2.restore(item_thumbnail3);
      String url4 = fileUploadService2.restore(item_thumbnail4);

      map.put("item_thumbnail", url);
      map.put("item_thumbnail2", url2);
      map.put("item_thumbnail3", url3);
      map.put("item_thumbnail4", url4);

      int nResult = adminservice.productModify(map);
      if (nResult < 1) {
         System.out.println("쓰기를 실패했습니다.");
         return "redirect:product";
      } else {
         System.out.println("쓰기를 성공했습니다.");
         return "redirect:product";
      }
   }

   // 상품삭제
   @RequestMapping("/productDelete_ok")
   public String productDelete_ok(HttpServletRequest request, Model model) {
      String sIdx = request.getParameter("item_idx");
      int nResult = adminservice.productDelete(sIdx);
      if (nResult < 1) {
         System.out.println("삭제를 실패했습니다.");
         return "redirect:product";
      } else {
         System.out.println("삭제를 성공했습니다.");
         return "redirect:product";
      }
   }

   // 고객문의관리
   @RequestMapping("/customer")
   public String customer(Model model) throws Exception {
      model.addAttribute("viewAll", adminservice.adminCscenter());

      return "admin/customer";
   }

   // 회원관리
   @RequestMapping("/member")
   public String member(Model model) throws Exception {

      model.addAttribute("viewAll", adminservice.adminMember());
      return "admin/member";

   }

   // 회원삭제
   @RequestMapping("/adminMemberDelete_ok")
   public String adminMemberDelete(HttpServletRequest request, Model model) {
      String sIdx = request.getParameter("user_idx");
      int nResult = adminservice.adminMemberDelete(sIdx);
      if (nResult < 1) {
         System.out.println("삭제를 실패했습니다.");
         return "redirect:member";
      } else {
         System.out.println("삭제를 성공했습니다.");
         return "redirect:member";
      }
   }

   // 주문관리
   @RequestMapping("order")
   public String adminOrderList(Model model) throws Exception {
      model.addAttribute("viewAll", adminservice.adminOrderList());
      return "admin/order";
   }

   // 상품현황수정
   @RequestMapping("confirm_ok")
   public String confirm_ok(HttpServletRequest request, Model model) {
      String sIdx = request.getParameter("or_idx");
      String sConfirm = request.getParameter("or_confirm");
      System.out.println(sConfirm);
      int nResult = adminservice.confirm(sConfirm, sIdx);
      if (nResult < 1) {
         System.out.println("수정 실패했습니다.");
         return "redirect:x";
      } else {
         System.out.println("수정 성공했습니다.");
         return "redirect:order";
      }
   }

   // 상품현황뷰
   @RequestMapping("confirmModifyForm")
   public String confirmView(HttpServletRequest request, Model model) {
      String sOr_idx = request.getParameter("or_idx");
      model.addAttribute("dto", adminservice.confirmView(sOr_idx));
      return "admin/confirmModifyForm";
   }

}