<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$(".pro_add_small").on('click',add);
	$(".pro_minus_small").on('click',minus);
	$("#submit").on('click',submit);
});

function add(){
	let pro = $(this).attr('data-num');
	let mydata = {"pro_id":pro};
	$.ajax({
		url : 'add'
		, method : 'GET'
		, data : mydata
		, success : function(result){
			let id="#bas_num_"+pro;
			$(id).text(result);
			basketprice();
		}
	})
}

function minus(){
	let pro = $(this).attr('data-num');
	let mydata = {"pro_id":pro};
	$.ajax({
		url : 'minus'
		, method : 'GET'
		, data : mydata
		, success : function(result){
			if(result==0){
				let rowid="#bas_row_"+pro;
				$(rowid).remove();
			}
			let id="#bas_num_"+pro;
			$(id).text(result);
			basketprice();
		}
	})
}

function basketprice(){
	$.ajax({
		url : 'basketPrice'
		, method : 'GET'
		, success : function(result){
			let data = "총합 : "+result+"원";
			$("#totalPrice").text(data);
		}
	})
}

function submit(){
	if(confirm("구매하시겠습니까?")){
		location.href='purchase';
	}
}
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box" id="bas_box">
            <div class="login_intro">
                카트
            </div>
            <table id="basket_table">
                <tr>
                    <td id="bas_top_img">상품사진</td>
                    <td id="bas_top_nam">상품명</td>
                    <td id="bas_top_pri">상품가격</td>
                    <td	id="bas_top_up"></td>
                    <td id="bas_top_num">상품개수</td>
                    <td	id="bas_top_down"></td>
                </tr>
                <c:forEach var="pro" items="${list}">
				<tr id="bas_row_${pro.pro_id}">
					<td><img class="pro_image" src="images/product/${pro.pro_id}.jpg"></td>
					<td>${pro.pro_name}</td>
                    <td>
					<c:choose>
						<c:when test="${pro.pro_saleprice!=0}">
							${pro.pro_saleprice}원
	                    </c:when>
	                    <c:otherwise>
	                    	${pro.pro_price}원
	                    </c:otherwise>
	                </c:choose>
	                </td>
	                <td>
						<div class="pro_add_small" data-num="${pro.pro_id}">
	                        +
	                    </div>
                    </td>
                    <td id="bas_num_${pro.pro_id}">${pro.bas_num}</td>
                    <td>
						<div class="pro_minus_small" data-num="${pro.pro_id}">
	                        -
	                    </div>
                    </td>
				</tr>
        		</c:forEach>       
                <tr>
                    <td id="totalPrice" colspan="6">총합 : ${totalprice}원</td>
                </tr>
            </table>
            <div class="button" id="submit">
                구매하기
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>