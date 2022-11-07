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
request.setCharacterEncoding("utf-8");
String lentno=request.getParameter("lentno");
String custname=request.getParameter("custname");
String bookno=request.getParameter("bookno");	
String bookname=request.getParameter("bookname");
String outdate=request.getParameter("outdate");
String indate=request.getParameter("indate");
String status=request.getParameter("status");
String clas=request.getParameter("class");

PreparedStatement pstmt=null;
try{
	String sql="insert into reservation1031 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,lentno);
	pstmt.setString(2,custname);
	pstmt.setString(3,bookno);
	pstmt.setString(4,outdate);
	pstmt.setString(5,indate);
	pstmt.setString(6,status);
	pstmt.setString(7,clas);
	pstmt.executeUpdate();
	
	%>
	<script>
	alert("등록이 완료되었습니다.")
	location.href="lent_select.jsp"
	</script>
	<%
}catch(Exception e){
	System.out.println("등록이 완료되지 않았습니다.");
	e.printStackTrace();
}
%>

</body>
</html>