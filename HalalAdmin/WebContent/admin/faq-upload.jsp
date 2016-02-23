<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 
<jsp:useBean id="dao" class="my.util.adminFAQDao"/>
<jsp:useBean id="vo" class="my.util.adminVo"/>
 <jsp:setProperty property="*" name="vo"/>

<% 

	
 request.setCharacterEncoding("utf-8");
         
        String question = request.getParameter("question");
        String priority = request.getParameter("priority");
        String answer	= request.getParameter("answer");
        int rst;
        String pre_priority=(String)session.getAttribute("pre_priority"); 
        String faqNo=(String)session.getAttribute("faqNo"); 
    	String res=(String)session.getAttribute("en_mo");			
    	session.removeAttribute("pre_priority");
    	session.removeAttribute("faqNo");
    	session.removeAttribute("en_mo");
    	
        if(res.equals("en")){			//등록 과정인지 수정 과정인지 구분
        	rst = dao.insertFaq(question,priority,answer);
        }else{
        	
	    	rst = dao.updateFaq(pre_priority, faqNo, question, priority, answer);
        }
        
       if(rst>0){
       %>
       <script type="text/javascript">
       location.href="admin-faq.jsp"
       </script>
       <%}else{ %>
       <script type="text/javascript">
       alert("업로드에 실패 하였습니다.");
       history.go(-1);
       </script>
       <%
       }
       %>
    }catch(Exception e){ 
        e.printStackTrace(new PrintWriter(out)); 
    } 
%> 
