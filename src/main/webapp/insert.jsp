<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 등록 화면</title>
<script>
function check(){
 	if(document.form.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다")} 
 	else if(document.form.author.value=="")
		{alert("작가가 입력되지 않았습니다");
		document.form.author.focus();}
	else if(document.form.bookname.value=="")
	{alert("도서이름이 입력되지 않았습니다");
	document.form.bookname.focus();}
	 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="Header.jsp" %>
<%@include file="Nav.jsp" %> 
<section>
<h3 class=tit>도서 정보 등록 화면</h3>
<form name="form" method="post" action="insertprocess.jsp">
<table border=1 id="tab">
<tr>
<th>도서코드</th>
<td><input type="text" name="bookno"></td>
</tr>
<tr>
<th>저자</th>
<td><input type="text" name="author"></td>
</tr>
<tr>
<th>도서이름</th>
<td><input type="text" name="bookname"></td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="저장" onclick="check()">
<input class="btn2" type="reset"  value="취소">
</th>
</tr>
</table>

</form>
</section>
<%@include file="Footer.jsp" %> 

</body>
</html>