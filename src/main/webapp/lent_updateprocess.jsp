<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
 	PreparedStatement pstmt=null;
	String lentno=request.getParameter("lentno");
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
/* 	String bookname=request.getParameter("bookname"); */
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String clas=request.getParameter("class");
	
	try{
		String sql="update reservation1031 set custname=?,bookno=?,outdate=?,indate=?,status=?,class=? where lentno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,custname);
		pstmt.setString(2,bookno);
		pstmt.setString(3,outdate);
		pstmt.setString(4,indate);
		pstmt.setString(5,status);
		pstmt.setString(6,clas);
		pstmt.setString(7,lentno);
		pstmt.executeUpdate();
		
		%>
		<script>
		alert("수정이 완료되었습니다.");
		location.href="lent_select.jsp";
		</script>
	<%
	} catch(Exception e){
		System.out.println("저장 실패");	
		e.printStackTrace();
	}%>
 
	
	</body>
</html>