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
/* System.out.println("custno : "+custno);
System.out.println("salenol: "+salenol); */

try{
	String sql="delete from reservation1031 where lentno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, lentno);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제 되었습니다!");
	location.href="select.jsp";
	</script>
	<% 
	}catch(Exception e){
		System.out.println("데이터베이스오류");
		e.printStackTrace();
	}
			

%>

</body>
</html>