<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#accupdate").on('click',function(){
		location.href='accupdate';
	});
	$("#list").on('click',function(){
		location.href='list';
	});
	$("#home").on('click',function(){
		let target = '${pageContext.request.contextPath}';
		location.href=target;
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
                마이페이지
            </div>
            <div class="button" id="accupdate">
                개인정보 업데이트
            </div>
            <div class="button" id="list">
                주문내역 확인
            </div>
            <div class="button" id="home">
                홈으로
            </div>
            <div class="button" id="logout">
                로그아웃
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>