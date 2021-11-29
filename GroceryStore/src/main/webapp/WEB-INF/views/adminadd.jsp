<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#admin_add').on('click',function(){
		if(tovertify()) {
			$('#proform').submit();
		} else {
			alert("필요한 부분을 입력해 주세요");
		}
	});
	$("#back").on('click',function(){
		location.href = '${pageContext.request.contextPath}'+'/';
	});
	$('#pro_company').on('keyup',com_vertify);
	$('#pro_name').on('keyup',name_vertify);
	$('#pro_price').on('keyup',price_vertify);
});

function com_vertify(){
	let text = $('#pro_company').val().trim();
	if(text==''){
		$('#pro_company_ver_exp').html('회사명을 입력해주세요');
		highlight_on('#input_pro_company_box');
	} else {
		$('#pro_company_ver_exp').html('&nbsp;');
		highlight_off('#input_pro_company_box');
	}
}
function name_vertify(){
	let text = $('#pro_name').val().trim();
	if(text==''){
		$('#pro_name_ver_exp').html('상품명을 입력해주세요');
		highlight_on('#input_pro_name_box');
	} else {
		$('#pro_name_ver_exp').html('&nbsp;');
		highlight_off('#input_pro_name_box');
	}
}

function price_vertify(){
	let text = $('#pro_price').val().trim();
	if(text==''){
		$('#pro_price_ver_exp').html('가격을 입력해주세요');
		highlight_on('#input_pro_price_box');
	} else {
		$('#pro_price_ver_exp').html('&nbsp;');
		highlight_off('#input_pro_price_box');
	}
}


function tovertify(){
	let pro_company = $('#pro_company').val().trim();
	if(pro_company==''){
		$('#pro_company_ver_exp').html('회사명을 입력해주세요');
		highlight_on('#input_pro_company_box');
		return false;
	}
	
	let pro_name = $('#pro_name').val().trim();
	if(pro_name==''){
		$('#pro_name_ver_exp').html('상품명을 입력해주세요');
		highlight_on('#input_pro_name_box');
		return false;
	}
	
	let pro_price = $('#pro_price').val().trim();
	if(pro_price==''){
		$('#pro_price_ver_exp').html('가격을 입력해주세요');
		highlight_on('#input_pro_price_box');
		return false;
	}
	
	if($('#pro_pic').val()==''){
		$('#pro_pic_ver_exp').html('사진을 선택해주세요');
		return false;
	}
	
	
	let pro_note = $('#pro_note').val().trim();
	if(pro_note=='') $('#pro_note').val(' ');
	
	let pro_stock = $('#pro_stock').val().trim();
	if(pro_stock=='') $('#pro_stock').val('0');
	
	let pro_saleprice = $('#pro_saleprice').val().trim();
	if(pro_saleprice=='') $('#pro_saleprice').val('0');
	
	
	return true;
	
}

function highlight_on(boxid){
	$(boxid).css({
		"box-shadow" : "inset 5px 5px 13px #FE5454,inset -5px -5px 13px #ffffff"
	});
}

function highlight_off(boxid){
	$(boxid).css({
		"box-shadow" : "inset 5px 5px 13px #bebebe,inset -5px -5px 13px #ffffff"
	});
}
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box">
            <div class="login_intro">
                상품추가
            </div>
            <form id="proform" method="post" action="adminadd" enctype="multipart/form-data" autocomplete="off">
            <div class="login_input_box">
                <p class="input_exp">회사이름</p>
                <div class="input_type_box" id="input_pro_company_box">
                    <input class="input_type" type="text" id="pro_company" name="pro_company"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_company_ver_exp">&nbsp;</p>           
                <p class="input_exp">상품이름</p>
                <div class="input_type_box" id="input_pro_name_box">
                    <input class="input_type" type="text" id="pro_name" name="pro_name"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_name_ver_exp">&nbsp;</p>
                <p class="input_exp">상품설명(생략가능)</p>
                <div class="input_type_box" id="input_pro_note_box">
                    <input class="input_type" type="text" id="pro_note" name="pro_note"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_note_ver_exp">&nbsp;</p>
                <p class="input_exp">상품재고(생략가능)</p>
                <div class="input_type_box" id="input_pro_stock_box">
                    <input class="input_type" type="number" id="pro_stock" name="pro_stock"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_stock_ver_exp">&nbsp;</p>
                <p class="input_exp">상품가격</p>
                <div class="input_type_box" id="input_pro_price_box">
                    <input class="input_type" type="number" id="pro_price" name="pro_price"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_price_ver_exp">&nbsp;</p>
                <p class="input_exp">상품할인가격(생략가능)</p>
                <div class="input_type_box" id="input_pro_saleprice_box">
                    <input class="input_type" type="number" id="pro_saleprice" name="pro_saleprice"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_saleprice_ver_exp">&nbsp;</p>
                <p class="input_exp">상품사진</p>
                <div class="input_type_box" id="input_pro_pic_box">
                    <input type="file" id="pro_pic" name="pro_pic"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pro_pic_ver_exp">&nbsp;</p>
            </div>
            <p class="input_exp input_ver_exp">${message}</p>
            <div class="button" id="admin_add">
                상품추가
            </div>
            <div class="button" id="back">
                뒤로가기
            </div>
            </form>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>