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
	String bookno=request.getParameter("bookno");
	String author=request.getParameter("author");
	String bookname=request.getParameter("bookname");
	
	try{
		String sql="update bookinfo1031 set author=?, bookname=? where bookno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,author);
		pstmt.setString(2,bookname);
		pstmt.setString(3,bookno);
		pstmt.executeUpdate();
		
		%>
		<script>
		alert("수정이 완료되었습니다.");
		location.href="select.jsp";
		</script>
	<%
	} catch(Exception e){
		System.out.println("저장 실패");
		e.printStackTrace();
	}%>
 
	
	</body>
</html>