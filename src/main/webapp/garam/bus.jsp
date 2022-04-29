<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("sessid")==null){	
	response.sendRedirect("login.jsp");
}

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM g_member WHERE uid = ? ");
String sql = qry.toString();

String route = "";
String boardingPlace = "";
String schoolName = "";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt =  conn.prepareStatement(sql);
	
	stmt.setString(1, (String)session.getAttribute("sessid"));
	
	rs = stmt.executeQuery();
	
	if(rs.next()){		
		route = rs.getString("route");
		boardingPlace = rs.getString("boardingplace");
		schoolName = rs.getString("schoolname");
	}
}catch(Exception e){
	e.getLocalizedMessage();
}finally{
	if(rs!=null)rs.close();
	if(conn!=null)conn.close();
	if(stmt!=null)stmt.close();
}   
%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>버스탑승</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page03">
        <div class="c01 pd16">
            <div class="tC title"><h2>버스탑승</h2></div>
            <ul class="ulFl school">
                <li class="on" id="backSchool">등교</li>
                <li id="goSchool">하교</li>
            </ul>
        </div>

        <div class="pd16 pdb">
            

            <div class=" select" id="backFinish">
                
                 <img src="./img/img04.png" >출발지
                <div class="fR">
                    <select name="start">
                        <option value="">우방비치타운</option>
                        <option value="">포항동부초등학교</option>
                        <option value="">노인복지회관</option>
                    </select>
                    <img src="./img/ico05.png">
                </div>
            </div>
            <div class="select" id="backStart">
               <img src="./img/img04.png">도착지
                <span class="fR"><%=schoolName %></span><!--등교 도착지는 학교로 고정-->
            </div>
			<!--등교 -->
			
			<div class="select" id="goFinish" style="display:none;">
               <img src="./img/img04.png">출발지
                <span class="fR"><%=schoolName %></span><!--등교 도착지는 학교로 고정-->
            </div>
            
			<div class="select" id="goStart" style="display:none;">
			 <img src="./img/img04.png">도착지
                <div class="fR">
                    <select name="start">
                        <option value="">우방비치타운</option>
                        <option value="">포항동부초등학교</option>
                        <option value="">노인복지회관</option>
                    </select>
                    <img src="./img/ico05.png">
                </div>
                
            </div>
            
            
            
            <button class="mX mt40" onclick="location.href='qrcode.jsp'">QR Code 실행</button>
        </div>
        
    <div class="FAB">
        <ul class="ulFl">
            <li><a href="mypage.jsp"><img src="./img/ico01.png"><p>내정보</p></a></li>
            <li class="on"><a href="bus.jsp"><img src="./img/ico02_on.png"><p>버스탑승</p></a></li>
            <li><a href="list.jsp"><img src="./img/ico03.png"><p>이용내역</p></a></li>
        </ul>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#goSchool").click(function(){
		
		$("#backSchool").addClass("on");
		$("#goSchool").removeClass("on");
		
		$("#goStart").hide();
		$("#goFinish").hide();
		
		$("#backStart").show();
		$("#backFinish").show();
		
	});
	
	$("#backSchool").click(function(){
		
		$("#goSchool").addClass("on");
		$("#backSchool").removeClass("on");		
		
		$("#backStart").hide();
		$("#backFinish").hide();
		
		$("#goStart").show();
		$("#goFinish").show();
	});
	
	
});
</script>
</html>
