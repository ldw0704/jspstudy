<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* uid: 01096251268
uname: 이동욱
schoolname: 대동
gradeclass: 1/2
upw: 1234
route: A노선
boardingplace: B장소 */
request.setCharacterEncoding("UTF-8"); //중요

String uid = request.getParameter("uid");
String uname = request.getParameter("uname");
String schoolname = request.getParameter("schoolname");
String gradeclass = request.getParameter("gradeclass");
String upw = request.getParameter("upw");
String route = request.getParameter("route");
String boardingplace = request.getParameter("boardingplace");

//jdbc프로그래밍
String url ="jdbc:mysql://localhost:3306/garam?characterEncoding=utf-8&&serverTimezone=Asia/Seoul";
String user ="root";
String password ="smart";
StringBuffer qry = new StringBuffer();
qry.append("INSERT INTO g_member (uname, schoolname, gradeclass, uid, upw, route, boardingplace, joindate) VALUES (?, ?, ?, ?, sha1(?), ?, ?,now())");

String sql = qry.toString();
Connection conn = null;
PreparedStatement stmt = null;
int res = 0;
//드라이버로드
try{
Class.forName("com.mysql.cj.jdbc.Driver");
//연결
conn = DriverManager.getConnection(url, user, password);
//SQL
stmt = conn.prepareStatement(sql);
//uname, schoolname, gradeclass, uid, upw, route, boardingplace, joindate
stmt.setString(1, uname);
stmt.setString(2, schoolname);
stmt.setString(3, gradeclass);
stmt.setString(4, uid);
stmt.setString(5, upw);
stmt.setString(6, route);
stmt.setString(7, boardingplace);

res = stmt.executeUpdate();
}catch(Exception e){
	
}finally{
//닫기
if(stmt!=null)stmt.close();
if(conn!=null)conn.close();
}

%>
<script>
<%
if(res <= 0){
%>
alert("회원가입 실패했습니다.");
history.go(-1);
<%	
}else{
%>
	location.href="join03.jsp";
<%	
}
%>
</script>

