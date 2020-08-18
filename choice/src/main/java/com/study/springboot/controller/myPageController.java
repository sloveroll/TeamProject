package com.study.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.service.IOrderListService;

@Controller
public class myPageController {
   @Autowired
   IOrderListService orderListService;
   
   // 마이페이지 주문리스트
   @RequestMapping("/orderList")
   public String orderList(HttpSession session, HttpServletRequest request, Model model) {
      
    String sUser_id = (String) session.getAttribute("login");
    
      model.addAttribute("list", orderListService.orderListView(sUser_id));
      System.out.println( "확인:" + orderListService.orderListView(sUser_id) );
      

      return "mypage/orderList";
   }

   // 마이페이지 주문품목 상세정보
   @RequestMapping("/orderDetail")
   public String orderDetail() throws Exception {

      return "mypage/orderDetail";
   }
   
   @RequestMapping("/memberModify")
   public String memberModify() throws Exception {

      return "mypage/memberModify";
   }

   

}