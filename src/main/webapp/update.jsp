<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 화면</title>
<script>
function check(){
	{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<h3 class="tit">도서 정보 수정 화면</h3>
<%@include file="DBConn.jsp" %>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String bookno=request.getParameter("bookno");
try{String sql="select bookno,author,bookname from bookinfo1031 where bookno=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,bookno);
rs=pstmt.executeQuery();
if(rs.next()){
/* 	String bookno=rs.getString(1);  */
	String author=rs.getString(2);
	String bookname=rs.getString(3);
	%>

<form name="form" method="post" action="updateprocess.jsp">
<table border=1 id="tab1">
<tr>
<th>도서코드</th>
<td><input type="text" name="bookno" value="<%=bookno%>"></td>
</tr>
<tr>
<th>저자</th>
<td><input type="text" name="author" value="<%=author%>"></td>
</tr>
<tr>
<th>도서이름</th>
<td><input type="text" name="bookname" value="<%=bookname%>"></td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="수정" onclick="check()">
<input class="btn2" type="button" name="select" value="취소">
</th>
</tr>

<%
} 
}catch(Exception e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<%@include file="Footer.jsp" %>

</body>
</html>