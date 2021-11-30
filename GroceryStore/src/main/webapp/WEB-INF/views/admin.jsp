<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#adminadd").on('click',function(){
		location.href='adminproman';
	});
	$("#adminorder").on('click',function(){
		location.href='adminorder';
	});
	$("#logout").on('click',function(){
		location.href='logout';
	});
});
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box">
            <div class="login_intro">
                관리자
            </div>
            <div class="button" id="adminadd">
                상품관리
            </div>
            <div class="button" id="adminorder">
                주문내역 확인
            </div>
            <div class="button" id="logout">
                로그아웃
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>