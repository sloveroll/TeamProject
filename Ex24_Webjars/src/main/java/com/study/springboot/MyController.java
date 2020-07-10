package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


//스프링부트에서 제이쿼리 , 부트스트랩 적용방법
//1.CDN으로 링크-네크워크에 문제가 생기면 웹화면이 이상해짐
//2.직접파일 배포-버전관리가 안됨
//3.WebJars로 배포 ( Gradle로 버전관리가됨)-위두가지 방법의 절충안 
//https://www.webjars.org/ 해당 사이트 

@Controller
public class MyController {

    @RequestMapping("/")
    public String root() throws Exception{
        return "index";
    }

}
