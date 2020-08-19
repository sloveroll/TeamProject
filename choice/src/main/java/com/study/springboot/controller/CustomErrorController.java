package com.study.springboot.controller;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
//에러 로그호출때 쓰는거
//logging
//프로그램 개발 중이나 완료 후 발생할 수 있는 오류에 대해 디버깅하거나 운영 중인 프로그램 상태를 모니터링 하기 위해 필요한 정보(로그)를 기록하는 것
//Simple Logging Facade for Java=@Slf4j

@Slf4j
public class CustomErrorController implements ErrorController {
 
    private static final String ERROR_PATH = "/error";
 
    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
    
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
        log.info("httpStatus : "+httpStatus.toString());
        //에러 상황 메시지 
        model.addAttribute("code", status.toString());
        model.addAttribute("msg", httpStatus.getReasonPhrase());//getReasonPhrase응답메시지의 문자열을 확인
        model.addAttribute("timestamp", new Date());
        return "error";
    }
 
}
 