<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

StringBuffer qry = new StringBuffer();
qry.append(" SELECT coupon FROM g_member WHERE uid = ? ");
String sql = qry.toString();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt =  conn.prepareStatement(sql);
	
	stmt.setString(1, (String)session.getAttribute("sessid"));
	
	rs = stmt.executeQuery();
	
	if(rs.next()){
		out.print(rs.getString("coupon"));		
	}
}catch(Exception e){
	e.getLocalizedMessage();
}finally{
	if(rs!=null)rs.close();
	if(conn!=null)conn.close();
	if(stmt!=null)stmt.close();
}
%>