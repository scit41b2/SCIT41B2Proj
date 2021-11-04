<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#signup').on('click',function(){
		if(tovertify()) {
			$('#signupform').submit();
		} else {
			alert("필요한 부분을 입력해 주세요");
		}
	});
	$('#acc_id').on('keyup',idvertify);
	$('#acc_pw').on('keyup',pwvertify);
	$('#pwre').on('keyup',pwvertify);
	$('#acc_name').on('keyup',namevertify);
	$('#acc_address').on('keyup',addvertify);
});

function idvertify(){
	let id = $('#acc_id').val().trim();
	if(id==''){
		$('#id_ver_exp').html('아이디를 입력해주세요');
		highlight_on('#input_id_box');
	} else if(id.length<3||id.length>8){
		$('#id_ver_exp').html('아이디는 3~8글자로 입력해주세요');
		highlight_on('#input_id_box');
	} else {
		$('#id_ver_exp').html('&nbsp;');
		highlight_off('#input_id_box');
	}
}

function pwvertify(){
	let pw = $('#acc_pw').val().trim();
	let pwre = $('#pwre').val().trim();
	if(pw==''){
		$('#pw_ver_exp').html('비밀번호를 입력해주세요');
		highlight_on('#input_pw_box');
	} else if(pw.length<3||pw.length>8){
		$('#pw_ver_exp').html('패스워드는 3~8글자로 입력해주세요');
		highlight_on('#input_pw_box');
	} else {
		if(pwre==''){
			$('#pwre_ver_exp').html('비밀번호를 입력해주세요');
			highlight_on('#input_pwre_box');
		} else if(pwre!=pw){
			$('#pwre_ver_exp').html('패스워드가 일치하지 않습니다.');
			highlight_on('#input_pwre_box');
		} else {
			$('#pwre_ver_exp').html('&nbsp;');
			highlight_off('#input_pwre_box');
		}
		$('#pw_ver_exp').html('&nbsp;');
		highlight_off('#input_pw_box');
	}
}


function namevertify(){
	let name = $('#acc_name').val().trim();
	if(name==''){
		$('#name_ver_exp').html('이름을 입력해주세요');
		highlight_on('#input_name_box');
	} else {
		$('#name_ver_exp').html('&nbsp;');
		highlight_off('#input_name_box');
	}
}

function addvertify(){
	let add = $('#acc_address').val().trim();
	if(add==''){
		$('#add_ver_exp').html('주소를 입력해주세요');
		highlight_on('#input_add_box');
	} else {
		$('#add_ver_exp').html('&nbsp;');
		highlight_off('#input_add_box');
	}
}

function tovertify(){
	let id = $('#acc_id').val().trim();
	if(id==''){
		$('#id_ver_exp').html('아이디를 입력해주세요');
		highlight_on('#input_id_box');
		return false;
	}
	
	let pw = $('#acc_pw').val().trim();
	let pwre = $('#pwre').val().trim();
	if(pw==''){
		$('#pw_ver_exp').html('비밀번호를 입력해주세요');
		highlight_on('#input_pw_box');
		return false;
	} else if(pwre!=pw){
		$('#pwre_ver_exp').html('패스워드가 일치하지 않습니다.');
		highlight_on('#input_pwre_box');
		return false;
	}
	
	let name = $('#acc_name').val().trim();
	if(name==''){
		$('#name_ver_exp').html('이름을 입력해주세요');
		highlight_on('#input_name_box');
		return false;
	}
	
	let add = $('#acc_address').val().trim();
	if(add==''){
		$('#add_ver_exp').html('주소를 입력해주세요');
		highlight_on('#input_add_box');
		return false;
	}
	
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
                회원가입
            </div>
            <form id="signupform" method="post" action="signup" autocomplete="off">
            <div class="login_input_box">
                <p class="input_exp">아이디</p>
                <div class="input_type_box" id="input_id_box">
                    <input class="input_type" type="text" id="acc_id" name="acc_id"><br>
                </div>
                <p class="input_exp input_ver_exp" id="id_ver_exp">&nbsp;</p>           
                <p class="input_exp">비밀번호</p>
                <div class="input_type_box" id="input_pw_box">
                    <input class="input_type" type="password" id="acc_pw" name="acc_pw"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pw_ver_exp">&nbsp;</p>
                <p class="input_exp">비밀번호 재입력</p>
                <div class="input_type_box" id="input_pwre_box">
                    <input class="input_type" type="password" id="pwre"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pwre_ver_exp">&nbsp;</p>
                <p class="input_exp">이름</p>
                <div class="input_type_box" id="input_name_box">
                    <input class="input_type" type="text" id="acc_name" name="acc_name"><br>
                </div>
                <p class="input_exp input_ver_exp" id="name_ver_exp">&nbsp;</p>
                <p class="input_exp">주소</p>
                <div class="input_type_box" id="input_add_box">
                    <input class="input_type" type="text" id="acc_address" name="acc_address"><br>
                </div>
                <p class="input_exp input_ver_exp" id="add_ver_exp">&nbsp;</p>
            </div>
            <p class="input_exp input_ver_exp">${message}</p>
            <div class="button" id="signup">
                회원가입
            </div>
            </form>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>