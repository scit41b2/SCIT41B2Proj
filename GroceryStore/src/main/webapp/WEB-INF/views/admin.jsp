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
		location.href='adminadd';
	});
	$("#admin_cha").on('click',function(){
		location.href='admin_cha';
	});
	$("#admin_ord").on('click',function(){
		location.href='admin_ord';
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
                상품추가
            </div>
            <div class="button" id="admin_cha">
                상품수정
            </div>
            <div class="button" id="admin_ord">
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