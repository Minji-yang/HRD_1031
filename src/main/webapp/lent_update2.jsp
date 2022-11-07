<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 대출 예약 정보 등록 화면</title>
<script>
function check(){
/* 	if(document.form.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.")
		document.form.lentno.focus();} 
		else if(document.form.custname.value=="")
		{alert("고객성명이 입력되지 않았습니다.");
		document.form.custname.focus();}
		else if(document.form.bookno.value=="")
		{alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();}
		else{ */
			document.form.action="lent_insertprocess.jsp"}
	 function changesubmit(){
		 document.form.submit();
	 }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %>
<section>
<%@include file="DBConn.jsp"%>
<%
String bookno=request.getParameter("bookno");
String lentno=request.getParameter("lentno");
String custname=request.getParameter("custname");
String outdate=request.getParameter("outdate");
String indate=request.getParameter("indate");
PreparedStatement pstmt=null;
ResultSet rs=null;
String bookname="";

int sel=0;

if(lentno==null){
	lentno="";
}
if(custname==null){
	custname="";
}
if(outdate==null){
	outdate="";
}
if(indate==null){
	indate="";
}
if(bookno==null){
	bookno="";
}else{

try{
	String sql="select bookname from bookinfo1031 where bookno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,bookno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		bookname=rs.getString(1);
		/* System.out.println("bookname:"+bookname); */}
	else{
	bookname="";}
	sql="select custname,bookno,outdate,indate,class from reservation1031 where lentno=?";
	custname=rs.getString(1);
	bookno=rs.getString(2);
	outdate=rs.getString(3);
	indate=rs.getString(4);
	String clas=rs.getString(5);%>
	
	<script>
	alert("등록되지 않은 도서코드입니다.");
	history.back(-1);
	</script>
	<% }catch(Exception e){
			System.out.println("db오류");
			e.printStackTrace();} }%>
	
<h3 class="tit">도서 대출 예약 정보 등록 화면</h3>
<form name="form" method="post" action="lent_insert.jsp">
<table border=1 id="tab1">
<tr>
<th>대출번호</th>
<td><input type="text" name="lentno" value="<%=lentno%>"></td>
<th>고객성명</th>
<td><input type="text" name="custname"value="<%=custname%>"></td>
</tr>
<tr>
<th>도서코드</th>
<td><input type="text" name="bookno" value="<%=bookno%>" onchange="changesubmit()"></td>
<th>도서이름</th>
<td>
<input type="text" name="bookname" value="<%=bookname%>">

</td>
</tr>
<tr>
<th>대출일자</th>
<td><input type="text" name="outdate"  value="<%=outdate%>"></td>
<th>반납일자</th>
<td><input type="text" name="indate"  value="<%=indate%>" onchange="changesubmit()"
<%if(indate==""){sel=1;}else{sel=0;} %>></td>
</tr>
<tr>
<th>대출상태</th>
<td class=radio>
<input type="radio" value="1" name="status" class="opt" <%if(sel==1){%>checked<%}%>><span>대출</span>
<input type="radio" value="2" name="status" class="opt" <%if(sel==0){%>checked<%}%>><span>반납</span>
</td>
<th>등급</th>
<td>
<select name="class" class="opt">
<option value="S">S</option>
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
</select>
</td>
</tr>
<tr>
<th colspan="4">
<input class="btn1" type="submit" value="저장" onclick="check()">
<input class="btn2" type="button" name="select" value="취소">
</th>
</tr>
</table>
</form>
</section>
<%@include file="Footer.jsp" %>

</body>
</html>