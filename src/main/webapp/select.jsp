<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 도서정보목록</title>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<%@include file="DBConn.jsp"%>
<h3 class="tit"> 도서정보목록</h3>
<table border=1 id="tab2">
<tr>
<th>no</th>
<th>도서코드</th>
<th>저자</th>
<th>도서명</th>
<th>구분</th>
</tr>
<%PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;
try{
	String sql="select bookno,author,bookname from bookinfo1031";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String bookno=rs.getString(1);
		String author=rs.getString(2);
		String bookname=rs.getString(3);
		no++;
		%>
<tr>
<td class="b_no"><%=no%></td>
<td><%=bookno%></td>
<td><%=author %></td>
<td><%=bookname %></td>

<td><a href="update.jsp?bookno=<%=bookno%>" class="sj">수정</a>
/<a class="del" href="deleteprocess.jsp?bookno=<%=bookno%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a></td>

</tr>
<%
	}
}catch(Exception e){
	System.out.println("조회 실패"); 
	e.printStackTrace();
}

%>

</table>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>