<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 

Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hala Oppa Admin</title>
<style type="text/css">
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
#center { position:absolute; top:50%; left:50%; width:300px; height:200px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
</style>

<script type="text/javascript">
function start(){ 
    document.form.passwd.focus(); 
} 
</script>
</head>
<body onload="start()">
<form action="adminProc.jsp" method="post" name="form">
<div id="center">
Halal Oppa Admin Login
<br>
<input type="password" size="10" maxlength="15" name="passwd">&nbsp;
<input type="submit" value="Connection"/>
</form>

</div>
</body>
</html>
