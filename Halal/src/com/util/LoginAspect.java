package com.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import front.vo.MemberVO;

@Aspect
public class LoginAspect {
    public void init(){
    	//System.out.println("###################login INIT#######################");
    }
    @Around("execution(public * *..*Controller.*(..))")
    public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
 
    	//System.out.println("#### LoginAspect 시작 ####");     
        HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
        HttpServletResponse response = null;
        if(joinPoint.getArgs().length >= 2) {
          response = (HttpServletResponse)joinPoint.getArgs()[1];
        }
        
        List<String> notUrl = new ArrayList<String>();
        notUrl.add("/back/manager/login");
        notUrl.add("/back/manager/loginAction");
        notUrl.add("/back/manager/logout");
        System.out.println("ur:" + request.getRequestURI());
        
        String url = request.getRequestURI();
        if(!notUrl.contains(url)) {
        	try {
    			
    			Object obj = request.getSession(false).getAttribute("ADMININFO");
    			if(obj == null) {
    				//throw new RuntimeException("먼저 로그인을 하셔야 합니다.");
    				response.sendRedirect("/back/manager/login");
    			} else {
    				if(obj instanceof MemberVO) {
    					
    				} else {
    					//throw new RuntimeException("먼저 로그인을 하셔야 합니다.");
    					response.sendRedirect("/back/manager/login");
    				}
    			}
    		} catch (Exception e) {
    			//throw new RuntimeException("먼저 로그인을 하셔야 합니다.");
    			response.sendRedirect("/back/manager/login");
    		}
        }
        
        Object result = joinPoint.proceed();
       // System.out.println("#### LoginAspect 끝 ####");      
        return result;
    }

}
