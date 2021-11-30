<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>


$(function(){
	$("#back").on('click',back); //버튼 클릭 함수
	$("#proadd").on('click',function(){
		location.href='adminadd';
	});
});

function back(){
	location.href = '${pageContext.request.contextPath}'+'/';
}

function proChange(id){
	let targetplace = 'adminprochange?id='+id;
	location.href = targetplace;
}

function proStop(id) {
	if(confirm("정말 판매중지하시겠습니까?")){
		let targetplace = 'adminprostop?id='+id;
		location.href = targetplace;
	}
	
}

</script>
</head>
<body>
    <div class="wrapper" style="max-width: 1500px; min-width: 1200px;">
        <div class="main_box" id="content_box">
            <div class="login_intro">
                상품관리
            </div>
	            <div id="pro_table">
		            <table id="pro_table" style="margin-left:auto; margin-right:auto;">
		                <tr>
		                	<td id="pro_top_id" style="width:85px">상품ID</td>
		                    <td id="pro_top_img">상품사진</td>
		                    <td id="pro_top_com" style="width:85px">상품회사명</td>
		                    <td id="pro_top_name">상품명</td>
		                    <td id="pro_top_note">상품설명</td>
		                    <td id="pro_top_stock" style="width:65px">상품재고</td>
		                    <td id="pro_top_price" style="width:65px">상품가격</td>
		                    <td id="pro_top_saleprice" style="width:100px">상품할인가격</td>
		                    <td id="pro_top_change" style="width:50px">수정</td>
		                    <td id="pro_top_delete" style="width:65px">판매중단</td>
		                    
		                </tr>
			    <c:forEach var="pro" items="${proList}"> <!-- 주문정보 리스트 출력 -->
						<tr id="pro_row_${pro.pro_id}">
					        <td id="pro_${pro.pro_id}_id">${pro.pro_id}</td>
			                <td id="pro_${pro.pro_id}_img"><img class="pro_table_image" src="image/${pro.pro_id}.jpg" width="100" height="100"></td>
			                <td id="pro_${pro.pro_id}_com">${pro.pro_company}</td>
			                <td id="pro_${pro.pro_id}_name">${pro.pro_name}</td>
			                <td id="pro_${pro.pro_id}_note">${pro.pro_note}</td>
			                <td id="pro_${pro.pro_id}_stock">${pro.pro_stock}</td>
			                <td id="pro_${pro.pro_id}_price">${pro.pro_price}</td>
			                <td id="pro_${pro.pro_id}_saleprice">${pro.pro_saleprice}</td>
			                <td id="pro_${pro.pro_id}_change"><a href="javascript:proChange('${pro.pro_id}');">수정</a></td>
			                <td id="pro_${pro.pro_id}_stop"><a href="javascript:proStop('${pro.pro_id}');">중단</a></td>
						</tr>
				</c:forEach>
		            </table>
	            </div>

			<div class="button" id="proadd">
                재고추가
            </div>
            <div class="button" id="back"> <!-- 뒤로가기 버튼 -->
                뒤로가기
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>