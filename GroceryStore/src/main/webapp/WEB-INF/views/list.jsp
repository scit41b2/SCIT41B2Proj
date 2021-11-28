<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#back").on('click',back); //버튼 클릭 함수
});

function back(){
		window.history.back(); //뒤로가기 작동
}

function cal(ordid){ //계산
	let ordId = {"ord_id" : ordid} //JSON
	
	$.ajax({
		url : 'cal'
		, method : 'GET'
		, data : ordId
		, success : function(resp){
			let data = "금액 : "+resp+"원";
			$("#total"+ordid).text(data);
		}
		
	})
}
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box">
            <div class="login_intro">
                주문 목록
            </div>
         <c:forEach var="ord" items="${orList}"> <!-- 주문번호 기준 리스트 출력 -->
            <span id="listOn${ord.ord_id}" style="CURSOR: hand" onclick="if(or_table${ord.ord_id}.style.display == 'none'){cal(${ord.ord_id}); or_table${ord.ord_id}.style.display=''; listOn${ord.ord_id}.innerText= '접기'} else {or_table${ord.ord_id}.style.display='none';listOn${ord.ord_id}.innerText= '주문번호 : ${ord.ord_id} / 주문 일시 : ${ord.ordDate}'}">주문번호 : ${ord.ord_id} / 주문 일시 : ${ord.ordDate}</span>
	            <!-- 펼쳤다 접기 기능 span태그에 장착 -->
	            
	            <div id="or_table${ord.ord_id}" style="display:none">
		            <table id="or_table">
		                <tr>
		                    <td id="or_top_img">상품사진</td>
		                    <td id="or_top_nam">상품명</td>
		                    <td id="or_top_num">개수</td>
		                </tr>
			    <c:forEach var="pro" items="${ordInfo}"> <!-- 주문정보 리스트 출력 -->
		             <c:choose>
		              	<c:when test="${ord.ord_id == pro.ord_id}"> <!-- 해당 주문번호 일치 상품 체크 -->
							<tr id="or_row_${pro.pro_id}">
								<td><img class="pro_image" src="images/product/${pro.pro_id}.jpg"></td>
								<td>${pro.pro_name}</td>
					            <td id="or_num_${pro.pro_id}">${pro.bas_num}</td>
							</tr>
			        	</c:when>
			        	<c:otherwise>
			        		<!-- 주문번호 불일치 정보들은 여기서 자동 소거 -->
			    		</c:otherwise>
			    	</c:choose>
				</c:forEach>
						<tr>
							<td colspan="3" id="total${ord.ord_id}"></td> <!-- 계산값 -->
						</tr>  
		            	<tr>
			        		<td colspan="3">주문번호 : ${ord.ord_id} / 주문 일시 : ${ord.ordDate}의 정보입니다.</td>
			        	</tr>
		            </table>
	            </div>
<br><br><br>
	        </c:forEach>
            <div class="button" id="back"> <!-- 뒤로가기 버튼 -->
                뒤로가기
            </div>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>