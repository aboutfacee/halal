<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 
<jsp:useBean id="dao" class="my.util.adminHOTELDao"/>
<jsp:useBean id="vo" class="my.util.adminVo"/>
 <jsp:setProperty property="*" name="vo"/>

<% 

	
 request.setCharacterEncoding("utf-8");
         
        String title = request.getParameter("title");
        String address = request.getParameter("address");
        int rst = dao.insertHotel(title,address);
        
       if(rst>0){
       %>
       <script type="text/javascript">
       location.href="admin-hotel.jsp"
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
