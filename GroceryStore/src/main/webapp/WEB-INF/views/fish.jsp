<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grocery Store</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	check();
	$(".account").on('click',function(){
		location.href='login';
	});
	$(".cart_box").on('click',function(){
		location.href='basket';
	});
	$(".pro_add").on('click',add);
});

function add(){
	let pro = $(this).attr('data-num');
	let mydata = {"pro_id":pro};
	$.ajax({
		url : 'add'
		, method : 'GET'
		, data : mydata
		, success : function(){
			check();
		}
	})
}

function check(){
	$.ajax({
		url : 'check'
		, method : 'GET'
		, success : function(result){
			$(".basket_number").text(result);
		}
	})
}
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box" id="content_box">
            <div class="account_box">
                <div class="account">
                    <img id="icon_account" src="images/account.png">
                </div>
                <c:if test="${sessionScope.loginId==null}">
                	<span id="account_text">로그인 해주세요</span>
               	</c:if>
               	<c:if test="${sessionScope.loginId!=null}">
						<span id="account_text">${sessionScope.loginName}님 환영합니다</span>
						<a href="logout">로그아웃</a>
				</c:if>
            </div>
            <div class="login_intro">
                생선
            </div>
            <div class="productlist">
            
            <c:forEach var="pro" items="${list}">
                <div class="product">
                    <div class="pro_add" data-num="${pro.pro_id}">
                        <img class="icon_plus" src="images/plus.png">
                    </div>
                    <div class="pro_box">
                        <img class="pro_image" src="images/product/${pro.pro_id}.jpg">
                        <div class="pro_title">${pro.pro_name}</div>
                    </div>
                    <c:if test="${pro.pro_saleprice!=0}">
                    	<div class="pro_price"><span class="pro_ori_price">${pro.pro_price}</span>${pro.pro_saleprice}원</div>
                    </c:if>
                    <c:if test="${pro.pro_saleprice==0}">
                    	<div class="pro_price">${pro.pro_price}원</div>
                    </c:if>
                </div>
        	</c:forEach>       
            </div>
            <div class="cart_box">
                <div class="basket">
                    <img class="icon_basket" src="images/basket.png">
                </div>
                <div class="basket_number">
                    0
                </div>
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>