<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 대출 정보 수정 화면</title>
<script>
function check(){
	{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<h3 class="tit">도서 대출 정보 수정 화면</h3>
<%@include file="DBConn.jsp" %>
<%


PreparedStatement pstmt=null;
ResultSet rs=null;
String lentno=request.getParameter("lentno");

try{String sql="select a.custname,a.bookno,to_char(a.outdate,'YYYY-MM-DD'),to_char(a.indate,'YYYY-MM-DD'),a.status,a.class,b.bookname from reservation1031 a,bookinfo1031 b where lentno=? and a.bookno=b.bookno";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,lentno);
rs=pstmt.executeQuery();
if(rs.next()){
/* 	String bookno=rs.getString(1);  */
	String custname=rs.getString(1);
	String bookno=rs.getString(2);
	String outdate=rs.getString(3);
	String indate=rs.getString(4);
	String status=rs.getString(5);
	String clas=rs.getString(6);
	String bookname=rs.getString(7);
	%>	
<form name="form" method="post" action="lent_updateprocess.jsp">
<table border=1 id="tab1">
<tr>
<th>대출번호</th>
<td><input type="text" name="lentno" value="<%=lentno%>"></td>
<th>고객성명</th>
<td><input type="text" name="custname" value="<%=custname%>"></td>
</tr>
<tr>
<th>도서코드</th>
<td><input type="text" name="bookno" value="<%=bookno%>"></td>
<th>도서이름</th>
<td><input type="text" name="bookname"value="<%=bookname%>"></td>
</tr>
<tr>
<th>대출일자</th>
<td><input type="text" name="outdate"value="<%=outdate%>"></td>
<th>반납일자</th>
<td><input type="text" name="indate"value="<%=indate%>"></td>
</tr>   
<tr>
<th>대출상태</th>
<td class=radio>
<input type="radio" value="1"<%if(status.equals("1")){%>checked<%}%> name="status"class="opt">대출
<input type="radio" value="2"<%if(status.equals("2")){%>checked<%}%> name="status"class="opt">반납
</td>
<th>등급</th>
<td>
<select name="class" class="opt">
<option value="S"<%if(clas.equals("S")){%>selected<%}%>>S</option>
<option value="A"<%if(clas.equals("A")){%>selected<%}%>>A</option>
<option value="B"<%if(clas.equals("B")){%>selected<%}%>>B</option>
<option value="C"<%if(clas.equals("C")){%>selected<%}%>>C</option>
<option value="null"<%if(clas.equals("")){%>selected<%}%>>null</option>
<%
}
}catch(Exception e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</select>

</td>
</tr>

<tr>
<th colspan="4">
<input class="btn1" type="button" value="수정" onclick="check()">
<input class="btn2" type="button" name="select" value="취소">
</th>
</tr>


</table>
</form>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>