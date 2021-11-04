<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매처리</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	let data = "${message}";
	alert(data);
	location.href='${pageContext.request.contextPath}';
})
</script>
</head>
<body>

</body>
</html>