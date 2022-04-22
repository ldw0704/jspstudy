<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print(request.getContextPath()+"<span style='color:red;'>V</span><br/>");
out.print(request.getLocalAddr()+"<br/>"); //ipv6
out.print(request.getLocalName()+"<br/>");
out.print(request.getLocalPort()+"<br/>"); //포트
out.print(request.getLocale()+"<br/>"); //국가
out.print(request.getMethod()+"<span style='color:red;'>V</span><br/>"); //메소드방식
out.print(request.getQueryString()+"<span style='color:red;'>V</span><br/>");
out.print(request.getParameter("name")+"<span style='color:red;'>V</span><br/>");
out.print(request.getRemoteAddr()+"<span style='color:red;'>V</span><br/>"); //클라이언트(나) 아이피주소
out.print(request.getRequestURI()+"<br/>");
out.print(request.getRequestURL()+"<br/>");
out.print(request.getHeader("referer")+"<br/>"); //이전 페이지

String referer = request.getHeader("referer");
%>
<span style='color:red;'><%=referer %></span><br>
<!--변수문법 주의  -->

<%
for(int i = 0; i< 10; i++){
%>
<%=i %><br>	
<%	
}
%>
</body>
</html>