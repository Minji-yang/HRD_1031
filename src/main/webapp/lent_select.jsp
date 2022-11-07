<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 예약정보 조회</title>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<%@include file="DBConn.jsp"%>
<%PreparedStatement pstmt=null;
ResultSet rs=null;
int cnt=0;
try{
	String sql="select count(*) from reservation1031";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(Exception e){
	System.out.println("db에러");
	e.printStackTrace();
}
%>

<h3 class="tit">도서 예약정보 조회</h3>
<p class="reserve">총<%=cnt%>권의 도서 예약 정보가 있습니다.</p>
<table border=1 id="tab3">
<tr>
<th>no</th>
<th>대출번호</th>
<th>고객성명</th>
<th>도서코드</th>
<th>도서명</th>
<th>대출일자</th>
<th>반납일자</th>
<th>대출상태</th>
<th>등급</th>
<th>관리</th>
</tr>
<%
int no=0;
try{
	String sql="select a.lentno,a.custname,a.bookno,to_char(a.outdate,'YYYY-MM-DD'),to_char(a.indate,'YYYY-MM-DD'),a.status,a.class,b.bookname from reservation1031 a,bookinfo1031 b where a.bookno=b.bookno";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String lentno=rs.getString(1);
		String custname=rs.getString(2);
		String bookno=rs.getString(3);
		String outdate=rs.getString(4);
		String indate=rs.getString(5);
		String status=rs.getString(6);
		String clas=rs.getString(7);
		String bookname=rs.getString(8);
		no++;
		
		%>
<tr>
<td class="b_no"><%=no%></td>
<td><a class="sj" href="lent_update2.jsp?lentno=<%=lentno%>"><%=lentno%></a></td>
<td><%=custname %></td>
<td><%=bookno %></td>
<td><%=bookname %></td>
<td><%=outdate %></td>
<td><%=indate%></td>
<td><%=status %></td>
<td><%=clas%></td>
<td><a class="del" href="lent_deleteprocess.jsp?lentno=<%=lentno%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a></td>


</tr>
<%
	}
}catch(Exception e){
	System.out.println("조회 실패"); 
	e.printStackTrace();
}
%>

</table>
<p class="insert"><a href="lent_insert.jsp">도서정보추가</a></p>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>